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
public class TokenizeDecorator extends Tokenize {
    protected Tokenize tokenize;
    
    protected TokenizeDecorator(Tokenize tokenize) {
        this.tokenize = tokenize;
    }

    @Override
    public String[] getTokenize() {
        return tokenize.getTokenize();
    }

    @Override
    public void Tokenize(String s) {
        tokenize.Tokenize(s);
    }

}
