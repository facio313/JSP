package kr.or.ddit.servlet05.service;

import java.io.InputStream;
import java.util.Properties;

import kr.or.ddit.servlet01.DescriptionServlet;

public class PropertiesServiceImpl implements PropertiesService {

	@Override
	public Properties retrieveData(String locale) {
		Properties properties = new Properties();
		
		if (locale.contains("ko")) {
			try(
				InputStream is = DescriptionServlet.class.getResourceAsStream("/kr/or/ddit/props/Message_ko.properties");
			){	
				properties.load(is);
			}catch (Exception e) {
				throw new RuntimeException();
			}
		} else if (locale.contains("en")) {
			try(
				InputStream is = DescriptionServlet.class.getResourceAsStream("/kr/or/ddit/props/Message_en.properties");
			){	
				properties.load(is);
			} catch (Exception e) {
				throw new RuntimeException();
			}
		} else {
			try(
				InputStream is = DescriptionServlet.class.getResourceAsStream("/kr/or/ddit/props/DataStore.properties");
			){	
				properties.load(is);
			} catch (Exception e) {
				throw new RuntimeException();
			}
		}
		
		return properties;
	}
}
