/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitap3;

/**
 *
 * @author Admin
 */
public class ConcreteTokenize extends Tokenize {
    String[] split;

    public ConcreteTokenize(String s) {
        Tokenize(s);
    }

    @Override
    public String[] getTokenize() {
        return split;
    }
    @Override
    public void Tokenize(String s) {
        s = s.trim();
        s = s.replaceAll("\\s+", " ");
        split = s.split(" ");
    }

    
}
