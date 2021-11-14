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
public class Mark extends TokenizeDecorator {

    String[] marks = {";"};

    public Mark(Tokenize t) {
        super(t);
    }

    @Override
    public String[] getTokenize() {
        String[] temp = tokenize.getTokenize();
        String string = String.join(" ", temp);
        for (String s : marks) {
            string = string.replaceAll(s, "");
        }
        tokenize.Tokenize(string);
        return tokenize.getTokenize();
    }

}
