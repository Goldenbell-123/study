using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


//Mobile Ver0.00
public class Enemy : MonoBehaviour {

    public enum EnemyState { idle, run, attack, die, jump } //열거형 상수(가독성 있는 분기를 만들기 위해)
    public EnemyState enemyState = EnemyState.idle; //Default 동작은 idle
    public float traceDist = 25.0f; // 추적 범위
    public float attackDist = 3.0f; // 공격 범위
    Transform tr;
    NavMeshAgent navi;
    Animator ani;
    CapsuleCollider capCol;
    Transform player;
    bool IsDie = false;
    GameObject bloodEffect;
    GameObject bloodDecal;
    public int hp = 100;
    int hpInit = 100;

    void Awake ()
    {
        hp = hpInit;
        tr = GetComponent<Transform>();
        navi = GetComponent<NavMeshAgent>();
        capCol = GetComponent<CapsuleCollider>();
        ani = this.gameObject.GetComponent<Animator>();
        player = GameObject.FindWithTag("Player").GetComponent<Transform>();
        bloodDecal = Resources.Load<GameObject>("BloodDecal");
        bloodEffect = Resources.Load<GameObject>("BloodEffect");




    }
    private void OnEnable()
    {
        navi.destination = player.position;
        StartCoroutine(this.setEnemyCheckState());
        StartCoroutine(this.setEnemyAction());
    }
    IEnumerator setEnemyCheckState()
    {
        while (!IsDie)
        {
            yield return new WaitForSeconds(0.02f);
            float dist = Vector3.Distance(player.position, tr.position);

            if(dist <= attackDist)
            {
                enemyState = EnemyState.attack;
            }
            else if(dist <= traceDist)
            {
                enemyState = EnemyState.run;
            }
            else
            {
                enemyState = EnemyState.idle;
            }
        }


    }
    IEnumerator setEnemyAction()
    {
        while (!IsDie)
        {
            switch(enemyState)
            {
                case EnemyState.attack:
                    navi.Stop();
                    ani.SetBool("IsAttack", true);
                    break;
                case EnemyState.run:
                    navi.destination = player.position;
                    navi.Resume();
                    ani.SetBool("IsAttack", false);
                    ani.SetBool("IsTrace", true);
                    break;
                case EnemyState.idle:
                    navi.Stop();
                    ani.SetBool("IsTrace", false);
                    break;
            }
            yield return null;//리턴 타입의 함수이기 떄문 무조건 반환하게 되어있음.
        }

    }
    void OnDamage(object[] _params)
    {
        navi.Stop();
        hp -= (int)_params[1];
        ani.SetTrigger("IsHit");


        createBlood((Vector3)_params[0]);
        if (hp <= 0)
        {
            setDie();
        }

    }
    void createBlood(Vector3 hitPos)
    {
        GameObject newEff = (GameObject)Instantiate(bloodEffect, hitPos, Quaternion.identity);
        Destroy(newEff, 2.0f);


        Vector3 decalPos = tr.position + (Vector3.up * 0.05f);
        Quaternion decalRot = Quaternion.Euler(90, 0, Random.Range(0, 360));

        GameObject newDecal = (GameObject)Instantiate(bloodDecal, decalPos, decalRot);


        newDecal.transform.localScale = Vector3.one * Random.Range(1.5f, 3.5f);

        Destroy(newDecal, 4.0f);

    }

    void setDie()
    {

        IsDie = true;
        capCol.enabled = false;
        GetComponent<Rigidbody>().isKinematic = true;
        navi.Stop();
        ani.SetTrigger("IsDie");
        gameObject.tag = "Untagged";
        UIManager.instance.killScore(100);
        enemyState = EnemyState.die;
        StopAllCoroutines();
        foreach(Collider col in GetComponentsInChildren<SphereCollider>())
        {
            col.enabled = false;
        }
        StartCoroutine(this.ObjectPool());
        //적 비활성

    }

    IEnumerator ObjectPool()
    {
        yield return new WaitForSeconds(1.0f);
        
        IsDie = false;
        hp = 100;
        gameObject.tag = "Enemy";
        enemyState = EnemyState.idle;
        ani.SetBool("IsTrace", false);
        capCol.enabled = true;
             foreach (Collider col in GetComponentsInChildren<SphereCollider>())
        {
            col.enabled = true;
        }
        gameObject.SetActive(false);
    }

    public void OnJump()
    {
        navi.Stop();

        enemyState = EnemyState.jump;
        ani.SetTrigger("IsJump");


    }
}
