package com.jbt.bean;

public class DriverInfo {
    private Integer id;

    private String realname;

    private String cardid;

    private String drivertype;

    private String drivingenddate;

    private String email;

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

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid == null ? null : cardid.trim();
    }

    public String getDrivertype() {
        return drivertype;
    }

    public void setDrivertype(String drivertype) {
        this.drivertype = drivertype == null ? null : drivertype.trim();
    }

    public String getDrivingenddate() {
        return drivingenddate;
    }

    public void setDrivingenddate(String drivingenddate) {
        this.drivingenddate = drivingenddate == null ? null : drivingenddate.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
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