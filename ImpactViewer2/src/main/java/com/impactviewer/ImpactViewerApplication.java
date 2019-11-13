package com.impactviewer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.impactviewer")
public class ImpactViewerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ImpactViewerApplication.class, args);
	}

}
