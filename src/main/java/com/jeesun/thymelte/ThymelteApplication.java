package com.jeesun.thymelte;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class ThymelteApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThymelteApplication.class, args);
	}
}
