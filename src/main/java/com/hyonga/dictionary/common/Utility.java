package com.hyonga.dictionary.common;

import java.text.DecimalFormat;

public class Utility {

    public static String addComma(String str) {
        int iStr = Integer.parseInt(str);
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(iStr);
    }
}
