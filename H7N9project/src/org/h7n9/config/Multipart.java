package org.h7n9.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class Multipart {

	@Bean
	public CommonsMultipartResolver getMultipartResolver() {
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		 mr.setMaxUploadSize(10000);
		 mr.setDefaultEncoding("UTF-8");
		return mr;
	}
}
