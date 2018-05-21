package org.gb.tool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import org.gb.service.impls.WebServiceHelper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SuppressWarnings("serial")
public class InitialServlet extends HttpServlet{

	@Override
	public void init() throws ServletException {
		System.out.println("InitialServlet正在初始化");
		
		//读取spring配置文件
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");

		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("InitialServlet正在销毁");
		super.destroy();
	}
	
}
