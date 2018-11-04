package kr.co.enough.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.AdminDao;


public class AdminMentoDeleteService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = null;
      try {
             
           request.setCharacterEncoding("UTF-8");
           response.setContentType("text/html; charset=UTF-8");      
           String mento_email = request.getParameter("mento_email");
           String msg = "";
           AdminDao dao = new AdminDao();
           int result = dao.getAdminStudyMentoList(mento_email);
           if(result == 1) {
        	   msg = "スタディーのリストをまず削除しなさい";
        	   request.setAttribute("msg", msg);
        	   forward = new ActionForward();
        	   forward.setRedirect(false);
        	   forward.setPath("/adminMentoList.admin");
           }else {
        	dao.getAdminMentoNoList(mento_email);	
        	 forward = new ActionForward();
             forward.setRedirect(false);
             forward.setPath("/adminMentoList.admin"); 
           }
           }catch(Exception e) {
         e.printStackTrace();
      }
      return forward;
   }
}

           