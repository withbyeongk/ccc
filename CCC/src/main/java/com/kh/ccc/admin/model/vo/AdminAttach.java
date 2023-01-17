package com.kh.ccc.admin.model.vo;

import java.sql.Date;

public class AdminAttach {

//	AD_NO	NUMBER
//	A_NO	NUMBER
//	AD_ORIGIN_NAME	VARCHAR2(300 BYTE)
//	AD_CHANGE_NAME	VARCHAR2(300 BYTE)
//	AD_CHANGE_FILE	VARCHAR2(300 BYTE)
//	AD_LEVEL	NUMBER
//	AD_CREATE_DATE	DATE
//	AD_STATUS	VARCHAR2(1 BYTE)

	private int adminNo;
	private int aNo;
	private String adminOriginName;
	private String adminChangeName;
	private String adminChangeFile;
	private int adminLevel;
	private Date adminCreateDate;
	private String adminStatus;

	public AdminAttach() {
		super();
	}

	public AdminAttach(int adminNo, int aNo, String adminOriginName, String adminChangeName, String adminChangeFile,
			int adminLevel, Date adminCreateDate, String adminStatus) {
		super();
		this.adminNo = adminNo;
		this.aNo = aNo;
		this.adminOriginName = adminOriginName;
		this.adminChangeName = adminChangeName;
		this.adminChangeFile = adminChangeFile;
		this.adminLevel = adminLevel;
		this.adminCreateDate = adminCreateDate;
		this.adminStatus = adminStatus;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getAdminOriginName() {
		return adminOriginName;
	}

	public void setAdminOriginName(String adminOriginName) {
		this.adminOriginName = adminOriginName;
	}

	public String getAdminChangeName() {
		return adminChangeName;
	}

	public void setAdminChangeName(String adminChangeName) {
		this.adminChangeName = adminChangeName;
	}

	public String getAdminChangeFile() {
		return adminChangeFile;
	}

	public void setAdminChangeFile(String adminChangeFile) {
		this.adminChangeFile = adminChangeFile;
	}

	public int getAdminLevel() {
		return adminLevel;
	}

	public void setAdminLevel(int adminLevel) {
		this.adminLevel = adminLevel;
	}

	public Date getAdminCreateDate() {
		return adminCreateDate;
	}

	public void setAdminCreateDate(Date adminCreateDate) {
		this.adminCreateDate = adminCreateDate;
	}

	public String getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	@Override
	public String toString() {
		return "AdminAttach [adminNo=" + adminNo + ", aNo=" + aNo + ", adminOriginName=" + adminOriginName
				+ ", adminChangeName=" + adminChangeName + ", adminChangeFile=" + adminChangeFile + ", adminLevel="
				+ adminLevel + ", adminCreateDate=" + adminCreateDate + ", adminStatus=" + adminStatus + "]";
	}

}
