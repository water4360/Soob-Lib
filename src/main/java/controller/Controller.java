package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MemberServiceFactory;

public interface Controller {
	String handleRequest(HttpServletRequest request, HttpServletResponse response);
}
