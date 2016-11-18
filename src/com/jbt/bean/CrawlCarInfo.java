package com.jbt.bean;


/**
 * @author zhangzhongde
 *
 */
public class CrawlCarInfo {
    private Integer id;

    private CarInfo carid;

    private String crawlwarnid;

    private String addtime;

    private Integer state;

    private String sn;

    private String crawlname;
    
    private String managerid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public CarInfo getCarid() {
		return carid;
	}

	public void setCarid(CarInfo carid) {
		this.carid = carid;
	}
	

    public String getCrawlwarnid() {
		return crawlwarnid;
	}

	public void setCrawlwarnid(String crawlwarnid) {
		this.crawlwarnid = crawlwarnid;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }    

	

	public String getManagerid() {
		return managerid;
	}

	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}

	public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public String getCrawlname() {
        return crawlname;
    }

    public void setCrawlname(String crawlname) {
        this.crawlname = crawlname == null ? null : crawlname.trim();
    }
}