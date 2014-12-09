package cn.believeus.variables;

import cn.believeus.util.PropertiesUtils;

public class Variables {

	public static final Object SESSION_USER = "sessionUser";
	public static final Object USER_NAME = "username";
	public static final String PHONE_NUM="phoneNum";
	public static final String ID_CARD="idCard";
	public static final String validateCode = "SessionValidateCode";
	//phone validate code
	public static final String validCode="validCode";
	//validate webservice interface
	public static final String webserviceValidCode=PropertiesUtils.findValue("project.properties", "webserviceValidCode");

}
