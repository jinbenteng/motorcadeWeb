package com.jbt.bean;


public class CrawlInfo {
    private Integer id;

    private String crawlname;

    private ManagerInfo manager;

    private String creattime;

    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCrawlname() {
        return crawlname;
    }

    public void setCrawlname(String crawlname) {
        this.crawlname = crawlname == null ? null : crawlname.trim();
    }

    

    public ManagerInfo getManager() {
		return manager;
	}

	public void setManager(ManagerInfo manager) {
		this.manager = manager;
	}


    public String getCreattime() {
		return creattime;
	}

	public void setCreattime(String creattime) {
		this.creattime = creattime;
	}

	public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}