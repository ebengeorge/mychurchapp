package com.dev.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class CmsApplication extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(CmsApplication.class, args);
	}
}

