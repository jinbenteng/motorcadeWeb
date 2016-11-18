package com.jbt.bean;

public class DeviceInfo {
    private Integer id;

    private String sn;

    private String telnum;

    private String telserialnum;

    private String checkcode;

    private String devicetype;

    private Integer sectorinfo;

    private Integer state;

    private Integer cardstate;

    private String adder;

    private String createdate;

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum == null ? null : telnum.trim();
    }

    public String getTelserialnum() {
        return telserialnum;
    }

    public void setTelserialnum(String telserialnum) {
        this.telserialnum = telserialnum == null ? null : telserialnum.trim();
    }

    public String getCheckcode() {
        return checkcode;
    }

    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode == null ? null : checkcode.trim();
    }

    public String getDevicetype() {
        return devicetype;
    }

    public void setDevicetype(String devicetype) {
        this.devicetype = devicetype == null ? null : devicetype.trim();
    }

    public Integer getSectorinfo() {
        return sectorinfo;
    }

    public void setSectorinfo(Integer sectorinfo) {
        this.sectorinfo = sectorinfo;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCardstate() {
        return cardstate;
    }

    public void setCardstate(Integer cardstate) {
        this.cardstate = cardstate;
    }

    public String getAdder() {
        return adder;
    }

    public void setAdder(String adder) {
        this.adder = adder == null ? null : adder.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }
}