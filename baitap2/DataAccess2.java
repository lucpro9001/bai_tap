/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap2;

import baitap1.SanPham;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DataAccess2 extends AbDataAccess {

    private static AbDataAccess instance;
    
    public static AbDataAccess instance() {
        if(instance == null) {
            instance = new DataAccess2();
        }
        return instance;
    }
}
