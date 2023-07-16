package com.spring.filter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.stereotype.Component;


@Component
@WebFilter(urlPatterns = { "/**", "", "/"}, dispatcherTypes = DispatcherType.REQUEST)
public class UTF8Filter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("FILTER RUN.....");
		request.setCharacterEncoding(StandardCharsets.UTF_8.name());
		response.setCharacterEncoding(StandardCharsets.UTF_8.name());
		chain.doFilter(request, response);
	}

}
