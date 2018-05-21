package org.gb.service;

import javax.jws.WebService;

@WebService
public interface IDataService {
	
	/**
	 * 测试方法
	 * @param text
	 * @return
	 */
	public String sayHello(String text);


}
