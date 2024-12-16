package com.example.dockerLearning;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@SpringBootApplication
public class DockerLearningApplication {

	public static void main(String[] args) {
		System.out.println("test commit from laptop");
		SpringApplication.run(DockerLearningApplication.class, args);
	}

}
