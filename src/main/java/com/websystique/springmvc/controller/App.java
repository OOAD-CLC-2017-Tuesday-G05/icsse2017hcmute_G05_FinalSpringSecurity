package com.websystique.springmvc.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

@SuppressWarnings("deprecation")
@ComponentScan(basePackages = "com.websystique.springmvc")
@SpringBootApplication(scanBasePackages = {"com.websystique.springmvc"})
public class App extends SpringBootServletInitializer
{
	@Override
    protected SpringApplicationBuilder configure (SpringApplicationBuilder application) {
        return application.sources(App.class);
    }
    public static void main(String[] args) throws Exception {
        SpringApplication.run(App.class, args);
    }
}
