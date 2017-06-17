using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnermyManager : MonoBehaviour {

	private GameObject comp;
	private GameObject creature;
	private GameObject[] spawnPoints;

	public int maxSpawnCnt = 3;
	public List<GameObject> enermyPool = new List<GameObject> ();

	public static int aliveEnermyCnt;


	void Awake () {
		comp = Resources.Load<GameObject> ("Comp");
		creature = Resources.Load<GameObject> ("Creature");
		spawnPoints = GameObject.FindGameObjectsWithTag ("SpawnPoint");

		for (int i = 0; i < maxSpawnCnt; i++) {
			// 공룡 생성
			GameObject compObj = Instantiate (comp, transform.position, Quaternion.identity);
			compObj.name = "Comp_" + i.ToString ();
			compObj.SetActive (false);
			enermyPool.Add (compObj);

			// 보스 생성
			//GameObject creatureObj = Instantiate (creature, transform.position, Quaternion.identity);
			//creatureObj.name = "Creature_" + i.ToString ();
			//creatureObj.SetActive (false);
			//enermyPool.Add (creatureObj);	// 일단 보스몹은 보류

		}

		aliveEnermyCnt = enermyPool.Count;
		StartCoroutine (SpawnEnermys ());
	}

	IEnumerator SpawnEnermys() {

//		while (!isGameOver && (aliveEnermyCnt != maxSpawnCnt)) {
			yield return new WaitForSeconds (0.1f);
			if(Player.isGameOver) yield break;

			foreach (GameObject enermy in enermyPool) {
				if (!enermy.activeSelf) {
					int idx = Random.Range (1, spawnPoints.Length);
					//Debug.Log (spawnPoints [idx].transform.position);
					enermy.transform.position = spawnPoints [idx].transform.position;
					enermy.SetActive (true);
				}
			}
//		}
	}
}
