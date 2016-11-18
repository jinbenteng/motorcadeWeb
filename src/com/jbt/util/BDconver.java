package com.jbt.util;

import java.util.ArrayList;
import java.util.List;

public class BDconver {
    static double pi = 3.14159265358979324;
    static double a = 6378245.0;
    static double ee = 0.00669342162296594323;
    public final static double x_pi = 3.14159265358979324 * 3000.0 / 180.0;

    public static double[] wgs2bd(double lat, double lon) {
           double[] wgs2gcj = wgs2gcj(lat, lon);
           double[] gcj2bd = gcj2bd(wgs2gcj[0], wgs2gcj[1]);
           return gcj2bd;
    }

    public static double[] gcj2bd(double lat, double lon) {
           double x = lon, y = lat;
           double z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * x_pi);
           double theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * x_pi);
           double bd_lon = z * Math.cos(theta) + 0.0065;
           double bd_lat = z * Math.sin(theta) + 0.00606;
           return new double[] { bd_lat, bd_lon };
    }

    public static double[] bd2gcj(double lat, double lon) {
           double x = lon - 0.0065, y = lat - 0.006;
           double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * x_pi);
           double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * x_pi);
           double gg_lon = z * Math.cos(theta);
           double gg_lat = z * Math.sin(theta);
           return new double[] { gg_lat, gg_lon };
    }

    public static double[] wgs2gcj(double lat, double lon) {
           double dLat = transformLat(lon - 105.0, lat - 35.0);
           double dLon = transformLon(lon - 105.0, lat - 35.0);
           double radLat = lat / 180.0 * pi;
           double magic = Math.sin(radLat);
           magic = 1 - ee * magic * magic;
           double sqrtMagic = Math.sqrt(magic);
           dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
           dLon = (dLon * 180.0) / (a / sqrtMagic * Math.cos(radLat) * pi);
           double mgLat = lat + dLat;
           double mgLon = lon + dLon;
           double[] loc = { mgLat, mgLon };
           return loc;
    }

    private static double transformLat(double lat, double lon) {
           double ret = -100.0 + 2.0 * lat + 3.0 * lon + 0.2 * lon * lon + 0.1 * lat * lon + 0.2 * Math.sqrt(Math.abs(lat));
           ret += (20.0 * Math.sin(6.0 * lat * pi) + 20.0 * Math.sin(2.0 * lat * pi)) * 2.0 / 3.0;
           ret += (20.0 * Math.sin(lon * pi) + 40.0 * Math.sin(lon / 3.0 * pi)) * 2.0 / 3.0;
           ret += (160.0 * Math.sin(lon / 12.0 * pi) + 320 * Math.sin(lon * pi  / 30.0)) * 2.0 / 3.0;
           return ret;
    }

    private static double transformLon(double lat, double lon) {
           double ret = 300.0 + lat + 2.0 * lon + 0.1 * lat * lat + 0.1 * lat * lon + 0.1 * Math.sqrt(Math.abs(lat));
           ret += (20.0 * Math.sin(6.0 * lat * pi) + 20.0 * Math.sin(2.0 * lat * pi)) * 2.0 / 3.0;
           ret += (20.0 * Math.sin(lat * pi) + 40.0 * Math.sin(lat / 3.0 * pi)) * 2.0 / 3.0;
           ret += (150.0 * Math.sin(lat / 12.0 * pi) + 300.0 * Math.sin(lat / 30.0 * pi)) * 2.0 / 3.0;
           return ret;
    }
    

    /** 
     * 检查多边形是否包含了某点~ 
     * @param point 
     * @return 
     */  
    public static boolean containsPoint(BYPoint point,String param) {
    	String[] date = param.split(",");
    	List<BYPoint> vertices = new ArrayList<BDconver.BYPoint>();
    	//BYPoint point = new BYPoint();
    	//point.setX((float) 116.403924);
    	//point.setY((float) 39.91515);
    	BYPoint pointTemp1 = new BYPoint();
    	pointTemp1.setX(Float.valueOf(date[0]));
    	pointTemp1.setY(Float.valueOf(date[1]));
    	vertices.add(pointTemp1);
    	BYPoint pointTemp2 = new BYPoint();
    	pointTemp2.setX(Float.valueOf(date[2]));
    	pointTemp2.setY(Float.valueOf(date[3]));
    	vertices.add(pointTemp2);
    	BYPoint pointTemp3 = new BYPoint();
    	pointTemp3.setX(Float.valueOf(date[4]));
    	pointTemp3.setY(Float.valueOf(date[5]));
    	vertices.add(pointTemp3);
    	BYPoint pointTemp4 = new BYPoint();
    	pointTemp4.setX(Float.valueOf(date[6]));
    	pointTemp4.setY(Float.valueOf(date[7]));
    	vertices.add(pointTemp4);
    	
		int verticesCount = vertices.size();
        int nCross = 0;
        for (int i = 0; i < verticesCount; ++ i) {
            BYPoint p1 = vertices.get(i);
            BYPoint p2 = vertices.get((i + 1) % verticesCount);

            // 求解 y=p.y 与 p1 p2 的交点 
            if ( p1.getY() == p2.getY() ) {   // p1p2 与 y=p0.y平行 
                continue;
            }
            if ( point.getY() < Math.min(p1.getY(), p2.getY()) ) { // 交点在p1p2延长线上 
                continue;
            }
            if ( point.getY() >= Math.max(p1.getY(), p2.getY()) ) { // 交点在p1p2延长线上 
                continue;  
            }  
            // 求交点的 X 坐标  
            float x = (point.getY() - p1.getY()) * (p2.getX() - p1.getX())   
                        / (p2.getY() - p1.getY()) + p1.getX();  
            if ( x > point.getX() ) { // 只统计单边交点  
                nCross++;  
            }  
        }  
     // 单边交点为偶数，点在多边形之外  
        return (nCross%2==1);  
    }

    public static class BYPoint {
    	public float  Y;
    	public float  X;

    	public float getY() {
    		return Y;
    	}
    	public void setY(float y) {
    		Y = y;
    	}
    	public float getX() {
    		return X;
    	}
    	public void setX(float x) {
    		X = x;
    	}
    }
}