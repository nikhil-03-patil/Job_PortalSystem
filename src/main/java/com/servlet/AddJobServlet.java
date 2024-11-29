package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;


@WebServlet("/add_job")
public class AddJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			  String title = req.getParameter("title");
			  String location = req.getParameter("location");
			  String category = req.getParameter("category");
			  String status = req.getParameter("status");
			  String desc = req.getParameter("desc");
			  //System.out.println(desc);
			  
			  Jobs j = new Jobs();
			  j.setTitle(title);
			  j.setLocation(location);
			  j.setCategory(category);
			  j.setStatus(status);
			  j.setDescription(desc);
			  
			 // j.getDescription();
			  
			  HttpSession session = req.getSession();
			  
			  JobDAO dao = new JobDAO(DBConnect.getconn());
			  boolean f = dao.addJobs(j);
			  if(f){
				  session.setAttribute("succMsg", "Job vacancy added successfully");
				  resp.sendRedirect("add_job.jsp");
			  }else{
				  session.setAttribute("succMsg", "Something went wrong...!");
				  resp.sendRedirect("add_job.jsp");
			  }
			  
			  
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
	}		
	}
}
