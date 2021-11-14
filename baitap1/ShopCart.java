/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap1;

import baitap1.khuyenmai.IKhuyenMai;
import baitap1.thanhtoan.IThanhToan;
import baitap1.vanchuyen.IVanChuyen;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ShopCart {
    List<SanPham> list;
    IKhuyenMai km;
    IThanhToan tt;
    IVanChuyen vc;

    public ShopCart() {
        list = new ArrayList<>();
    }
    
    public void addProducts(List<SanPham> addList) {
        list.addAll(addList);
    }
    
    public void addProduct(SanPham addList) {
        list.add(addList);
    }
    
    public double tongTien() {
        double s = 0;
        for (SanPham sanPham : list) {
            s += sanPham.cost;
        }
        return s;
    }

    public void setKm(IKhuyenMai km) {
        this.km = km;
    }

    public void setTt(IThanhToan tt) {
        this.tt = tt;
    }

    public void setVc(IVanChuyen vc) {
        this.vc = vc;
    }

    public void cartInfo() {
        double s = this.tongTien();
        for (SanPham sanPham : list) {
            println(sanPham);
        }
        println("--------");
        println("- Hinh thuc van chuyen: " + vc.giaoHang() + " days");
        println("- Tong tien: " + s);
        println("- Hinh thuc thanh toan(" + tt + "): " + tt.thanhToan(s));
        println("- Khuyen Mai(" + km + "): " + km.giamGia(s));
        s = tt.thanhToan(s) - km.giamGia(s);
        println("- Thành tiền: " + s);
    }
    
    void println(Object o) {
        System.out.println(o);
    }
}
