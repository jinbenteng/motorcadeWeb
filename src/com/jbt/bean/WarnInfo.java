package com.jbt.bean;

public class WarnInfo {
    private Integer id;

    private String sn;

    private Integer warn;

    private Long devicetime;

    private Integer warntype;

    private Float warnnum;

    private Integer state;

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

    public Integer getWarn() {
        return warn;
    }

    public void setWarn(Integer warn) {
        this.warn = warn;
    }

    public Long getDevicetime() {
        return devicetime;
    }

    public void setDevicetime(Long devicetime) {
        this.devicetime = devicetime;
    }

    public Integer getWarntype() {
        return warntype;
    }

    public void setWarntype(Integer warntype) {
        this.warntype = warntype;
    }

    public Float getWarnnum() {
        return warnnum;
    }

    public void setWarnnum(Float warnnum) {
        this.warnnum = warnnum;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }
}