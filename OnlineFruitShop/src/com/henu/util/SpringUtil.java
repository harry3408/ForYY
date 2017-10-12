package com.henu.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;


	@Override
	public void setApplicationContext(ApplicationContext ac)
			throws BeansException {
		applicationContext = ac;
	}

	public static ApplicationContext getApplicationContext(){
		return applicationContext;
	}

	public static Object getBean(String beanId){
		ApplicationContext applicationContext = getApplicationContext();
		return applicationContext.getBean(beanId);
	}
}
