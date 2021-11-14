/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap1.khuyenmai;

/**
 *
 * @author Admin
 */
public class KhuyenMaiXXX implements IKhuyenMai {

    @Override
    public double giamGia(double tien) {
        double max = 99999;
        int percent = 90;
        double res = tien * percent / 100;
        return res >= max ? max : res;
    }
    
    @Override
    public String toString() {
        return "KhuyenMaiXXX";
    }
    
}
