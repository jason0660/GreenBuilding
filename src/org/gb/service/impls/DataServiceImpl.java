package org.gb.service.impls;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.UUID;
import javax.jws.WebService;

import org.gb.service.IDataService;

@WebService(endpointInterface = "org.lpr.service.IDataService")
public class DataServiceImpl implements IDataService{

	/**
	 * 测试
	 */
	public String sayHello(String text) {
        return "Hello : " + text;
    }

	
	
}
