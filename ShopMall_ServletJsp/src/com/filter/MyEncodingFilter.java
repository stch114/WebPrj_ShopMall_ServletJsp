package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyEncodingFilter implements Filter {

	// request와 response 작업 처리 사이에서 filterAPI 실행. 주의) lib/web.xml파일에 filter 등록.

	public void destroy() {
		System.out.println("destroy");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 모든 request와 response 작업 사이에서 발생.
		// 서버가 클라이언트의 request를 받기 전과 서버의 response를 클라이언트가 받기 전에 모두 작동.
		// 따라서 하나의 '요청과 응답'마다 2번씩 실행.
		System.out.println("doFilter");
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init");
	}
}
