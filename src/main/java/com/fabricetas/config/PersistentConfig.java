package com.fabricetas.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.fabricetas.dao.UserDao;
import com.fabricetas.dao.UserDaoImpl;
import com.fabricetas.model.Address;
import com.fabricetas.model.Camiseta;
import com.fabricetas.model.Estampa;
import com.fabricetas.model.Role;
import com.fabricetas.model.Tema;
import com.fabricetas.model.Texto;
import com.fabricetas.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.fabricetas")
@PropertySource(value = { "classpath:application.properties" })
public class PersistentConfig {

    @Autowired
    private Environment environment;
        
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/FABRICETAS");
		dataSource.setUsername("root");
		dataSource.setPassword("admin");
//		dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driverClassName"));
//		dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
//		dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
//		dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));

		return dataSource;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		properties.put("hibernate.format_sql", "false");
//		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
//		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
//		properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
		return properties;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClasses(User.class);
		sessionBuilder.addAnnotatedClasses(Address.class);
		sessionBuilder.addAnnotatedClasses(Role.class);
		sessionBuilder.addAnnotatedClasses(Texto.class);
		sessionBuilder.addAnnotatedClasses(Tema.class);
		sessionBuilder.addAnnotatedClasses(Camiseta.class);
		sessionBuilder.addAnnotatedClasses(Estampa.class);
		return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(
			SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(
				sessionFactory);

		return transactionManager;
	}

	@Autowired
	@Bean(name = "userDao")
	public UserDao getUserDao(SessionFactory sessionFactory) {
		return new UserDaoImpl(sessionFactory);
	}
}
