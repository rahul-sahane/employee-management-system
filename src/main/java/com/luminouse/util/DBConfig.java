package com.luminouse.util;

public class DBConfig {

    public static final String URL =
            getEnv("DB_URL", "jdbc:oracle:thin:@//localhost:1521/FREE");

    public static final String USERNAME =
            getEnv("DB_USERNAME", "rsw");

    public static final String PASSWORD =
            getEnv("DB_PASSWORD", "");

    private static String getEnv(String name, String fallback) {
        String value = System.getenv(name);
        return value != null && !value.isBlank() ? value : fallback;
    }
}
