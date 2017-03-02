package user.model.vo;

public class UserVo {
	private String id, pwd , name, email , gender , phoneNumber;

	/**
	 * 
	 */
	public UserVo() {
		super();
	}

	/**
	 * @param id
	 * @param pwd
	 * @param name
	 * @param email
	 * @param gender
	 * @param phoneNumber
	 */
	public UserVo(String id, String pwd, String name, String email, String gender, String phoneNumber) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getphoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setphoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
}
