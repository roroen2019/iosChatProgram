package com.leanly.mobile.chat.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.servers.Server;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Value("${leanly.openapi.dev-url}")
    private String devUrl;
    @Value("${leanly.openapi.prod-url}")
    private String prodUrl;

    @Bean
    public OpenAPI chatOpenApi() {
        Server devServer = new Server();
        devServer.setUrl(devUrl);
        devServer.setDescription("Server URL in Development environment");

        Server prodServer = new Server();
        prodServer.setUrl(prodUrl);
        prodServer.setDescription("Server URL in Production environment");

        Contact contact = new Contact();
        contact.setEmail("brainstorm2973@gmail.com");
        contact.setName("Aaron");
        contact.setUrl("https://github.com/constant94-dev");

        License mitLicense = new License().name("MIT License")
            .url("https://choosealicense.com/licenses/mit/");

        Info info = new Info()
            .title("Mobile Chat Management API")
            .version("1.0.0")
            .contact(contact)
            .description("This API exposes endpoints to manage users.")
            .license(mitLicense);

        return new OpenAPI().info(info).servers(List.of(devServer, prodServer));
    }
}
