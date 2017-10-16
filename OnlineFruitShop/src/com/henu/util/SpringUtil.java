package com.henu.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Lazy
public class SpringUtil {

	private static ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");;

	private static ApplicationContext getApplicationContext(){
		return applicationContext;
	}

	public static Object getBean(String beanId){
		return getApplicationContext().getBean(beanId);
	}
}
