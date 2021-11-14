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
public abstract class AbDataAccess {

    List<SanPham> list = new ArrayList<>();

    protected AbDataAccess() {
    }

    public void updateProduct(SanPham o) {
        for (SanPham sanPham : list) {
            if (sanPham.getId().equals(o.getId())) {
                int i = list.indexOf(sanPham);
                list.set(i, o);
                return;
            }
        }
    }

    public void addProduct(SanPham o) {
        list.add(o);
    }

    public void removeProduct(String id) {
        for (SanPham sanPham : list) {
            if (sanPham.getId().equals(id)) {
                list.remove(sanPham);
                return;
            }
        }
    }

    public void in() {
        System.out.println(list);
    }
}
