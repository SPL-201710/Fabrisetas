package com.fabricetas.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.fabricetas")
public class SpringWebAppInitializer extends WebMvcConfigurerAdapter { 

//	/* Solución para que el JspServlet pueda manipular archivos .html */
//	@Autowired
//	@Qualifier("jstlViewResolver")
//	private ViewResolver jstlViewResolver;
//
//	@Bean
//	@DependsOn({ "jstlViewResolver" })
//	public ViewResolver viewResolver() {
//		return jstlViewResolver;
//	}
//
//	@Bean(name = "jstlViewResolver")
//	public ViewResolver jstlViewResolver() {
//		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
//		resolver.setPrefix(""); // NOTA: Sin preffix
//		resolver.setViewClass(JstlView.class);
//		resolver.setSuffix(""); // NOTA: Sin suffix
//		return resolver;
//	}
//
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		/* Se configuran los html como recursos de la aplicación */
//		registry.addResourceHandler("/views/**").addResourceLocations("/views/");
//		/* Se accede en front mediante <link href="resources/css/bootstrap.css" rel="stylesheet" media="screen"> */
//		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
//	}
	
	/* Configuración inicial (por defecto) para manipulación de archivos jsp */
    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

}