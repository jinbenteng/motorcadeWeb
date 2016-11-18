package com.jbt.bean;

import java.io.Serializable;

public class SectorInfo implements Serializable{
    private Integer id;

    private String sectornum;

    private String sectorname;

    private ManagerInfo managerinfo;

    private String tel;

    private Integer level;

    private Integer parentinfo;

    private Integer rootinfo;

    private Integer state;

    private String description;

    private String createdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSectornum() {
        return sectornum;
    }

    public void setSectornum(String sectornum) {
        this.sectornum = sectornum == null ? null : sectornum.trim();
    }

    public String getSectorname() {
        return sectorname;
    }

    public void setSectorname(String sectorname) {
        this.sectorname = sectorname == null ? null : sectorname.trim();
    }

    public ManagerInfo getManagerinfo() {
		return managerinfo;
	}

	public void setManagerinfo(ManagerInfo managerinfo) {
		this.managerinfo = managerinfo;
	}

	public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentinfo() {
        return parentinfo;
    }

    public void setParentinfo(Integer parentinfo) {
        this.parentinfo = parentinfo;
    }

    public Integer getRootinfo() {
        return rootinfo;
    }

    public void setRootinfo(Integer rootinfo) {
        this.rootinfo = rootinfo;
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
}