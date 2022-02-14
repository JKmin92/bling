package kr.com.amean.provider.factory;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlsessionFactoryProvider {
	
	private static final String resource = "config.xml";
	private static SqlSessionFactory factory;
	
	public static SqlSessionFactory getSqlsessionFactory() {
		if(SqlsessionFactoryProvider.factory == null) {
			createSessionFactory();
		}
		
		return SqlsessionFactoryProvider.factory;
		
	}
	
	private static void createSessionFactory() {
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlsessionFactoryProvider.factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("SqlsessionFactory Error");
		}
	}

}
