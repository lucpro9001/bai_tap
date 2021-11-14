/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap4;

import baitap1.SanPham;


/**
 *
 * @author Admin
 */
public class CTHD {
    SanPham sp;
    int sl, ck;

    public CTHD(SanPham sp, int sl, int ck) {
        this.sp = sp;
        this.sl = sl;
        this.ck = ck;
    }
    
    public String toString() {
        return "[" + sp + ", " + sl + ", " + ck + "]"; 
    }
    
    
}
