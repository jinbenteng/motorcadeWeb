package com.jbt.bean;

public class FaultInfo {
	
    private Integer id;

    private String sn;

    private Integer warn;
    
    private Long devicetime;

    private Integer systemcarid;

    private Integer faultnum;

    private Integer faultlen;

    private String faultcode;

    private Integer state;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public Long getDevicetime() {
		return devicetime;
	}

	public void setDevicetime(Long devicetime) {
		this.devicetime = devicetime;
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

    public Integer getSystemcarid() {
        return systemcarid;
    }

    public void setSystemcarid(Integer systemcarid) {
        this.systemcarid = systemcarid;
    }

    public Integer getFaultnum() {
        return faultnum;
    }

    public void setFaultnum(Integer faultnum) {
        this.faultnum = faultnum;
    }

    public Integer getFaultlen() {
        return faultlen;
    }

    public void setFaultlen(Integer faultlen) {
        this.faultlen = faultlen;
    }

    public String getFaultcode() {
        return faultcode;
    }

    public void setFaultcode(String faultcode) {
        this.faultcode = faultcode == null ? null : faultcode.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}