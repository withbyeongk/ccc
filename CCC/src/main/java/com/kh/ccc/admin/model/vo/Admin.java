package com.kh.ccc.admin.model.vo;

import java.sql.Date;

public class Admin {

//	
//	A_NO	NUMBER
//	AG_NO	NUMBER
//	A_ID	VARCHAR2(30 BYTE)
//	A_PWD	VARCHAR2(200 BYTE)
//	A_NAME	VARCHAR2(30 BYTE)
//	A_EMAIL	VARCHAR2(30 BYTE)
//	A_HIRE_DATE	DATE
//	A_MODIFY_DATE	DATE
//	A_QUIT_DATE	DATE
//	A_STATUS	VARCHAR2(1 BYTE)

	private int aNo;
	private int aGno;
	private String aId;
	private String aPwd;
	private String aName;
	private String aEmail;
	private Date aHireDate;
	private Date aModifyDate;
	private Date aQuitDate;
	private String aStatus;

	public Admin() {
		super();
	}

	public Admin(int aNo, int aGno, String aId, String aPwd, String aName, String aResidentNo, String aEmail,
			String aPhone, Date aHireDate, Date aModifyDate, Date aQuitDate, String aStatus) {
		super();
		this.aNo = aNo;
		this.aGno = aGno;
		this.aId = aId;
		this.aPwd = aPwd;
		this.aName = aName;
		this.aEmail = aEmail;
		this.aHireDate = aHireDate;
		this.aModifyDate = aModifyDate;
		this.aQuitDate = aQuitDate;
		this.aStatus = aStatus;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getaGno() {
		return aGno;
	}

	public void setaGno(int aGno) {
		this.aGno = aGno;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaEmail() {
		return aEmail;
	}

	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}

	public Date getaHireDate() {
		return aHireDate;
	}

	public void setaHireDate(Date aHireDate) {
		this.aHireDate = aHireDate;
	}

	public Date getaModifyDate() {
		return aModifyDate;
	}

	public void setaModifyDate(Date aModifyDate) {
		this.aModifyDate = aModifyDate;
	}

	public Date getaQuitDate() {
		return aQuitDate;
	}

	public void setaQuitDate(Date aQuitDate) {
		this.aQuitDate = aQuitDate;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	@Override
	public String toString() {
		return "Admin [aNo=" + aNo + ", aGno=" + aGno + ", aId=" + aId + ", aPwd=" + aPwd + ", aName=" + aName
				+ ", aEmail=" + aEmail + ", aHireDate=" + aHireDate + ", aModifyDate=" + aModifyDate + ", aQuitDate="
				+ aQuitDate + ", aStatus=" + aStatus + "]";
	}

}
