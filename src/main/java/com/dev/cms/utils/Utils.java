package com.dev.cms.utils;

import java.util.Map;

public class Utils {
    public static final String toJson(Map<?, ?> map) {
        StringBuilder jsonString = new StringBuilder();
        jsonString.append("{");

        for (Map.Entry<?, ?> entry : map.entrySet()) {
            jsonString.append("\"")
                      .append(entry.getKey())
                      .append("\":\"")
                      .append(entry.getValue())
                      .append("\",");
        }

        // Remove the last comma if there is any key-value pair
        if (jsonString.length() > 1) {
            jsonString.deleteCharAt(jsonString.length() - 1);
        }

        jsonString.append("}");
        return jsonString.toString();
    }
}
