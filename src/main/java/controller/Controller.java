package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MemberServiceFactory;

public interface Controller {
	String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
