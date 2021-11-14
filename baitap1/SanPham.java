/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap1;

/**
 *
 * @author Admin
 */
public class SanPham {
    String id, name;
    double cost;

    public SanPham(String id, String name, double cost) {
        this.id = id;
        this.name = name;
        this.cost = cost;
    }
    
    @Override
    public String toString() {
        return "[" + id + ", " + name + ", " + cost + "]";
    }

    public String getId() {
        return id;
    }
    
    
}
