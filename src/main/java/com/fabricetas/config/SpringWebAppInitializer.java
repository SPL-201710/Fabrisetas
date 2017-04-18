package com.fabricetas.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.*;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.fabricetas")
public class SpringWebAppInitializer extends WebMvcConfigurerAdapter {

    @Bean(name="multipartResolver")
    public StandardServletMultipartResolver resolver(){
        return new StandardServletMultipartResolver();
    }

    /**
     * Configure ViewResolvers to deliver preferred views.
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        registry.viewResolver(viewResolver);
    }

    /**
     * Configure ResourceHandlers to serve static resources like CSS/ Javascript etc...
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }

    /**
     * Configure MessageSource to lookup any validation/error message in internationalized property files
     */
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }

    /**Optional. It's only required when handling '.' in @PathVariables which otherwise ignore everything after last '.' in @PathVaidables argument.
     * It's a known bug in Spring [https://jira.spring.io/browse/SPR-6164], still present in Spring 4.1.7.
     * This is a workaround for this issue.
     */
   /* @Override
    public void configurePathMatch(PathMatchConfigurer matcher) {
        matcher.setUseRegisteredSuffixPatternMatch(true);
    }*/
    
    
    
    
    
//	/* Soluci�n para que el JspServlet pueda manipular archivos .html */
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

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		/* Se configuran los html como recursos de la aplicaci�n */
//		registry.addResourceHandler("/views/**").addResourceLocations("/views/");
//		/* Se accede en front mediante <link href="resources/css/bootstrap.css" rel="stylesheet" media="screen"> */
//		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
//	}
/*
	/* Configuraci�n inicial (por defecto) para manipulaci�n de archivos jsp */
/*    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }*/

}