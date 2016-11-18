package com.jbt.bean;

public class UseCarInfo {
    private Integer id;

    private StaffInfo driverinfo;

    private CarInfo carinfo;

    private String starttime;

    private String endtime;

    private String managername;

    private Integer state;

    private String descprition;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

   

    public StaffInfo getDriverinfo() {
		return driverinfo;
	}

	public void setDriverinfo(StaffInfo driverinfo) {
		this.driverinfo = driverinfo;
	}

	public CarInfo getCarinfo() {
		return carinfo;
	}

	public void setCarinfo(CarInfo carinfo) {
		this.carinfo = carinfo;
	}

	public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime == null ? null : starttime.trim();
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime == null ? null : endtime.trim();
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername == null ? null : managername.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getDescprition() {
        return descprition;
    }

    public void setDescprition(String descprition) {
        this.descprition = descprition == null ? null : descprition.trim();
    }
}