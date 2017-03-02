package javastart.vo;

public class JOBS {
	// job_id varchar2 (10),
	// job_title varchar2 (35),
	// min_salary number (6),
	// max_salary number (6)

	private String jobId;
	private String jobTitle;
	private int minSalary;
	private int maxSalary;
	
	public JOBS() {
		super();
	}

	public JOBS(String jobId, String jobTitle, int minSalary, int maxSalary) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public int getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(int minSalary) {
		this.minSalary = minSalary;
	}

	public int getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(int maxSalary) {
		this.maxSalary = maxSalary;
	}
	
	
	// String jobId varchar2 (10),
	// Stirng jobTitle varchar2 (35),
	// int minSalary number (6),
	// int maxSalary number (6)
	
}
