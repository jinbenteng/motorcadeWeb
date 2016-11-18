package com.jbt.bean;

public class StaffInfo {
    private Integer id;

    private String staffname;

    private String tel;

    private String cardid;

    private String sex;

    private SectorInfo sectorinfo;

    private Integer stafftype;

    private String drivertype;

    private String address;

    private String drivingphoto;

    private Integer state;

    private String description;

    private String createdate;

    private String adder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname == null ? null : staffname.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid == null ? null : cardid.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }


    public SectorInfo getSectorinfo() {
		return sectorinfo;
	}

	public void setSectorinfo(SectorInfo sectorinfo) {
		this.sectorinfo = sectorinfo;
	}

	public Integer getStafftype() {
        return stafftype;
    }

    public void setStafftype(Integer stafftype) {
        this.stafftype = stafftype;
    }

    public String getDrivertype() {
        return drivertype;
    }

    public void setDrivertype(String drivertype) {
        this.drivertype = drivertype == null ? null : drivertype.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getDrivingphoto() {
        return drivingphoto;
    }

    public void setDrivingphoto(String drivingphoto) {
        this.drivingphoto = drivingphoto == null ? null : drivingphoto.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }

    public String getAdder() {
        return adder;
    }

    public void setAdder(String adder) {
        this.adder = adder == null ? null : adder.trim();
    }
}