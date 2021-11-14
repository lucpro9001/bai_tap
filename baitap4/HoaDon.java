/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap4;

import java.util.List;

/**
 *
 * @author Admin
 */
public class HoaDon {
    HoaDonHeader header;
    List<CTHD> cthd;

    protected HoaDon(Builder b) {
        header = b.header;
        cthd = b.cthd;
    }
    
    @Override
    public String toString() {
        String res = header + "\n";
        for (CTHD cthd1 : cthd) {
            res += cthd1 + "\n";
        }
        res = res;
        return res;
    }
    
    public static class Builder {
        HoaDonHeader header;
        List<CTHD> cthd;

        public Builder addCthd(List<CTHD> cthd) {
            this.cthd = cthd;
            return this;
        }
        public Builder addACthd(CTHD cthd) {
            this.cthd.add(cthd);
            return this;
        }
        
        public Builder addHeader(HoaDonHeader hd) {
            this.header = hd;
            return this;
        }
        
        public HoaDon build() {
            return new HoaDon(this);
        }
    }
}
