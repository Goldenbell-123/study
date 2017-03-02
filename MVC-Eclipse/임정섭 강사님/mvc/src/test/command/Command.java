package test.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.view.View;

public interface Command {
	public View execute(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException;
	
}