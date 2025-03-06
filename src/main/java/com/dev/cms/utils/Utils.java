package com.dev.cms.utils;

import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
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

    public static final String formatInstant(Instant instant) {
        ZonedDateTime zonedDateTime = instant.atZone(ZoneId.of("UTC"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy HH:mm");
        return zonedDateTime.format(formatter);       
    }
}
