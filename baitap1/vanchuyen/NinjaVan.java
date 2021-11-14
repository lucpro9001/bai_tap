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
public class NinjaVan implements IVanChuyen {

    @Override
    public int giaoHang() {
        return 5;
    }
    
    @Override
    public String toString() {
        return "NinjaVan";
    }
}
