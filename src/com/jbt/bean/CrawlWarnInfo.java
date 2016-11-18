package com.jbt.bean;


public class CrawlWarnInfo {
    private Integer id;

    private String crawlname;

    private Integer warntype;

    private Integer charttype;

    private String circlepoint;

    private String circleradius;

    private String polygonpoint;

    private String validitystart;

    private String validityend;
    
    private Integer parktime;
    
    private Integer idletime;

    private CrawlInfo crawlinfo;

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

    public Integer getWarntype() {
        return warntype;
    }

    public void setWarntype(Integer warntype) {
        this.warntype = warntype;
    }

    public Integer getCharttype() {
        return charttype;
    }

    public void setCharttype(Integer charttype) {
        this.charttype = charttype;
    }

    
    public String getCirclepoint() {
		return circlepoint;
	}

	public void setCirclepoint(String circlepoint) {
		this.circlepoint = circlepoint;
	}

	

    public String getCircleradius() {
		return circleradius;
	}

	public void setCircleradius(String circleradius) {
		this.circleradius = circleradius;
	}

	public String getPolygonpoint() {
        return polygonpoint;
    }

    public void setPolygonpoint(String polygonpoint) {
        this.polygonpoint = polygonpoint == null ? null : polygonpoint.trim();
    }   

	

	public Integer getParktime() {
		return parktime;
	}

	public void setParktime(Integer parktime) {
		this.parktime = parktime;
	}

	public Integer getIdletime() {
		return idletime;
	}

	public void setIdletime(Integer idletime) {
		this.idletime = idletime;
	}

	public String getValiditystart() {
		return validitystart;
	}

	public void setValiditystart(String validitystart) {
		this.validitystart = validitystart;
	}

	public String getValidityend() {
		return validityend;
	}

	public void setValidityend(String validityend) {
		this.validityend = validityend;
	}

	public CrawlInfo getCrawlinfo() {
		return crawlinfo;
	}

	public void setCrawlinfo(CrawlInfo crawlinfo) {
		this.crawlinfo = crawlinfo;
	}

	public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}