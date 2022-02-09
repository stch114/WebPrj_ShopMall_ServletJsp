package com.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory { // SqlSession 객체 생성
	// Configuration.xml을 이용 -> SqlSessionFactory 통해 SqlSession 객체 생성하고 리턴해주는 클래스
	static SqlSessionFactory sqlSessionFactory = null;
	static { // static 초기화
		String resource = "com/config/Configuration.xml"; // Configuration.xml의 경로와 파일이름 지정(경로 주의).
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			// IOException 발생 : 파일 경로, 파일명 등이 잘못된 경우
			System.out.println("Configuration.xml 읽기 성공");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		System.out.println("SqlSessionFactory 생성 성공");
	} // end static

	public static SqlSession getSession() {
		SqlSession session = sqlSessionFactory.openSession();
		return session;
	}
}