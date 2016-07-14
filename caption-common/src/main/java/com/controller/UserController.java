package com.controller;

import com.pojo.po.TUser;
import com.service.IUserService;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/reg")
	public String toReg() {
		return "/reg";
	}

	@RequestMapping("/doReg")
	public String doReg(TUser user, HttpServletRequest request) {
		try {
			boolean flag = this.userService.saveUser(user);
			if (flag) {
				request.getSession().setAttribute("user", this.userService.getUser(user));
				request.setAttribute("users", this.userService.getAllUsers());
				return "/users";
			}
			return "/reg";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("/tologin")
	public void toLogin(HttpServletResponse response) throws IOException {
		response.sendRedirect("welcom.jsp");
	}

	@RequestMapping("/doLogin")
	public String doLogin(TUser user, HttpServletResponse response, HttpServletRequest request) {
		try {
			if (this.userService.getUser(user) != null) {
				request.getSession().setAttribute("user", this.userService.getUser(user));
				request.setAttribute("users", this.userService.getAllUsers());
				return "/users";
			}
			response.sendRedirect("welcom.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}