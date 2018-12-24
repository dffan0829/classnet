package com.hyitclassnet.filter;

import javax.servlet.http.HttpServletRequest;

import org.acegisecurity.Authentication;
import org.acegisecurity.AuthenticationException;
import org.acegisecurity.ui.webapp.AuthenticationProcessingFilter;

import com.hyitclassnet.exception.ValidationCodeException;

public class LoginCodeFilter extends AuthenticationProcessingFilter {
	public Authentication attemptAuthentication(HttpServletRequest httpServletRequest) throws AuthenticationException {
		String inputValidationCode = httpServletRequest.getParameter("j_validation_code");
		// 从Session中取出验证码
		String code = (String) httpServletRequest.getSession().getAttribute("image_key");

		if (code != null && !code.equals(inputValidationCode)) {
			httpServletRequest.getSession().setAttribute("codeerror", "验证码输入错误!");
			// 用户输入的值与看到的不一致,抛出异常
			throw new ValidationCodeException("验证码输入错误!");
		}
		httpServletRequest.getSession().removeAttribute("codeerror");

		return super.attemptAuthentication(httpServletRequest);
	}
}
