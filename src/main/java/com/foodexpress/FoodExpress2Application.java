package com.foodexpress;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
public class FoodExpress2Application {

	public static void main(String[] args) {
		if (System.getenv("RENDER") == null) {
			Dotenv dotenv = Dotenv.configure()
					.directory("./FoodExpress")
					.load();

			System.setProperty("DB_URL", dotenv.get("DB_URL"));
			System.setProperty("DB_USERNAME", dotenv.get("DB_USERNAME"));
			System.setProperty("DB_PASSWORD", dotenv.get("DB_PASSWORD"));
			System.setProperty("MAIL_PORT", dotenv.get("MAIL_PORT"));
			System.setProperty("MAIL_USERNAME", dotenv.get("MAIL_USERNAME"));
			System.setProperty("MAIL_PASSWORD", dotenv.get("MAIL_PASSWORD"));
			System.setProperty("API_KEY", dotenv.get("API_KEY"));
		}
		SpringApplication.run(FoodExpress2Application.class, args);
	}

}
