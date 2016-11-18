package com.jbt.bean;

public class CarInfo {
	
    private Integer id;

    private String sn;

    private Integer fleetinfo;

    private SectorInfo sectorinfo;

    private String platenumber;

    private String drivertype;

    private Float totalmileage;

    private String drivername;

    private String vin;

    private String enginenum;

    private String purpose;

    private String carmodel;

    private Integer seatnum;

    private Integer state;

    private String managername;

    private String createdate;

    private String description;

    private String monitortime;

    private String monitorresult;

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

    public Integer getFleetinfo() {
        return fleetinfo;
    }

    public void setFleetinfo(Integer fleetinfo) {
        this.fleetinfo = fleetinfo;
    }

    public SectorInfo getSectorinfo() {
		return sectorinfo;
	}

	public void setSectorinfo(SectorInfo sectorinfo) {
		this.sectorinfo = sectorinfo;
	}

	public String getPlatenumber() {
        return platenumber;
    }

    public void setPlatenumber(String platenumber) {
        this.platenumber = platenumber == null ? null : platenumber.trim();
    }

    public String getDrivertype() {
        return drivertype;
    }

    public void setDrivertype(String drivertype) {
        this.drivertype = drivertype == null ? null : drivertype.trim();
    }

    public Float getTotalmileage() {
        return totalmileage;
    }

    public void setTotalmileage(Float totalmileage) {
        this.totalmileage = totalmileage;
    }

    public String getDrivername() {
        return drivername;
    }

    public void setDrivername(String drivername) {
        this.drivername = drivername == null ? null : drivername.trim();
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin == null ? null : vin.trim();
    }

    public String getEnginenum() {
        return enginenum;
    }

    public void setEnginenum(String enginenum) {
        this.enginenum = enginenum == null ? null : enginenum.trim();
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose == null ? null : purpose.trim();
    }

    public String getCarmodel() {
        return carmodel;
    }

    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel == null ? null : carmodel.trim();
    }

    public Integer getSeatnum() {
        return seatnum;
    }

    public void setSeatnum(Integer seatnum) {
        this.seatnum = seatnum;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername == null ? null : managername.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getMonitortime() {
        return monitortime;
    }

    public void setMonitortime(String monitortime) {
        this.monitortime = monitortime == null ? null : monitortime.trim();
    }

    public String getMonitorresult() {
        return monitorresult;
    }

    public void setMonitorresult(String monitorresult) {
        this.monitorresult = monitorresult == null ? null : monitorresult.trim();
    }
}