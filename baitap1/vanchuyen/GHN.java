/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap1.vanchuyen;

/**
 *
 * @author Admin
 */
public class GHN implements IVanChuyen {

    @Override
    public int giaoHang() {
        return 4;
    }
    
    @Override
    public String toString() {
        return "Giao hang nhanh";
    }
    
}
