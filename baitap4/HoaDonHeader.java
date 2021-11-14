/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap4;

/**
 *
 * @author Admin
 */
public class HoaDonHeader {
    String ma, ngayBan, tenKH;

    public HoaDonHeader(String ma, String ngayBan, String tenKH) {
        this.ma = ma;
        this.ngayBan = ngayBan;
        this.tenKH = tenKH;
    }
    
    @Override
    public String toString() {
        return "[" + ma + ", " + tenKH + ", " + ngayBan + "]";
    }
}
