package com.dev.cms.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncryptionUtil {

    public static String hashPassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    public static boolean matches(String a, String b) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(a, b);
    }

    public static void main(String[] args) {
        String pwd = "user";
        String hashed = hashPassword(pwd);
        System.out.println(matches("Password",  hashed));
        System.out.println(hashed);
    }
}
