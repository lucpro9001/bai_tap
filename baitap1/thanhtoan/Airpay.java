/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap1.thanhtoan;

/**
 *
 * @author Admin
 */
public class Airpay implements IThanhToan {

    @Override
    public double thanhToan(double tien) {
        return tien >= 1000000 ? tien * 0.97 : tien;
    }
    
    @Override
    public String toString() {
        return "AirPay";
    }
    
}
