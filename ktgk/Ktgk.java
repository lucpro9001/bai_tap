/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktgk;

import baitap1.SanPham;
import baitap1.ShopCart;
import baitap1.khuyenmai.*;
import baitap1.thanhtoan.*;
import baitap1.vanchuyen.*;
import baitap2.AbDataAccess;
import baitap2.DataAccess1;
import baitap2.DataAccess2;
import baitap3.ConcreteTokenize;
import baitap3.Mark;
import baitap3.StopWord;
import baitap3.Tokenize;
import baitap4.CTHD;
import baitap4.HoaDon;
import baitap4.HoaDonHeader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Ktgk {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        baitap1();
//        baitap2();
//        baitap3();
//        baitap4();

    }

    static void baitap1() {
        SanPham a = new SanPham("1", "hàng 1", 2000000);
        SanPham a1 = new SanPham("2", "hàng 2", 3000000);
        SanPham a2 = new SanPham("3", "hàng 3", 4000000);
        List<SanPham> list = new ArrayList<>();
        list.add(a);
        list.add(a1);

        ShopCart cart = new ShopCart();
        cart.addProducts(list);
        cart.addProduct(a2);

        cart.setTt(new Airpay());
        cart.setKm(new YYY());
        cart.setVc(new GHN());

        cart.cartInfo();
    }

    static void baitap4() {
        List<CTHD> cthd = new ArrayList<>();
        cthd.add(new CTHD(new SanPham("01", "Sp1", 2000), 20, 2));
        cthd.add(new CTHD(new SanPham("02", "Sp2", 3000), 30, 3));
        cthd.add(new CTHD(new SanPham("03", "Sp3", 5000), 40, 4));
        cthd.add(new CTHD(new SanPham("04", "Sp4", 7000), 50, 3));

        HoaDon hd = new HoaDon.Builder()
                .addHeader(new HoaDonHeader("1", "2021-11-04", "Phuong moi"))
                .addCthd(cthd)
                .build();
        
        
        
        System.out.println(hd);
    }

    static void baitap3() {
        String s = "  ma  la la 1; thi hoac ;;; test    123  ";
        Tokenize tokenize = new ConcreteTokenize(s);
        tokenize = new StopWord(tokenize);
        tokenize = new Mark(tokenize);
      
        String[] result = tokenize.getTokenize();
        for (String string : result) {
            System.out.println(string);
        }
        
    }
    
    static void baitap2() {
        SanPham a = new SanPham("1", "hàng 1", 2000000);
        SanPham a1 = new SanPham("2", "hàng 2", 3000000);
        SanPham a2 = new SanPham("3", "hàng 3", 4000000);
        SanPham a3 = new SanPham("3", "hàng 4", 1000000);
        AbDataAccess data1 = DataAccess1.instance();
        AbDataAccess data2 = DataAccess1.instance();
        
        AbDataAccess data3 = DataAccess2.instance();

        data1.addProduct(a);
        data2.addProduct(a1);
        data3.addProduct(a2);
        data1.in();
        data2.in();
        data3.in();
        data2.addProduct(a2);
        data1.in();
        data1.removeProduct("1");
        data1.updateProduct(a3);
        data2.in();
    }
}
