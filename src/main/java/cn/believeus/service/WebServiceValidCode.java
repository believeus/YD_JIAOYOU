package cn.believeus.service;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.IOUtils;

import cn.believeus.variables.Variables;

public class WebServiceValidCode {

	public static String getCode(String phoneNum) {
		String url = Variables.webserviceValidCode + phoneNum;
		System.out.println("current webservice url:" + url);
		String validCode = "";
		try {
			HttpURLConnection connection = (HttpURLConnection) new URL(url)
					.openConnection();
			connection.setDoOutput(true);
			// 设置是否从httpUrlConnection读入，默认情况下是true;
			connection.setDoInput(true);
			// Post 请求不能使用缓存
			connection.setUseCaches(false);
			connection.connect();
			InputStream in = connection.getInputStream();
			validCode = IOUtils.toString(in, "UTF-8");
			Pattern regex = Pattern.compile("[0-9]{4}");
			Matcher matcher = regex.matcher(validCode);
			if (matcher.find()) {
				validCode = matcher.group();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return validCode;
	}
}
