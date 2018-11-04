package kr.co.enough.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.enough.service.MyStudyService;
import kr.co.enough.service.MyWishService;
import kr.co.enough.service.UpdateAdminPageService;
import kr.co.enough.service.UpdateMentoPageService;
import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.service.AdminMemberDeleteService;
import kr.co.enough.service.AdminMemberListService;
import kr.co.enough.service.AdminMentoDeleteService;
import kr.co.enough.service.AdminMentoListService;
import kr.co.enough.service.AdminMentoNoService;
import kr.co.enough.service.AdminMentoOkService;
import kr.co.enough.service.AdminProfileService;
import kr.co.enough.service.AdminStudyDeleteService;
import kr.co.enough.service.AdminStudyListService;
import kr.co.enough.service.DropOutMentoService;
import kr.co.enough.service.DropOutService;
import kr.co.enough.service.EmailCheckService;
import kr.co.enough.service.JoinService;
import kr.co.enough.service.LoginService;
import kr.co.enough.service.MyProfileService;
import kr.co.enough.service.UpdateProfileService;


@WebServlet("*.admin")
public class AdminPageControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public AdminPageControllerServlet() {
        super();
       
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }
   

   private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   String RequestURI = request.getRequestURI();
      String ContextPath = request.getContextPath();
      String url_command = RequestURI.substring(ContextPath.length());
      Action action= null;
      ActionForward forward = null;

      if(url_command.equals("/adminPage.admin")) {
         try {
            action = new AdminProfileService();
            forward = action.execute(request, response);
         }catch(Exception e) {
         e.printStackTrace();
         }
      }else if(url_command.equals("/updateAdminPage.admin")) {
    	  try{
    		  action = new UpdateAdminPageService();
    	    forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/adminStudyList.admin")) {
    	  try{
    		  action = new AdminStudyListService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/adminMentoList.admin")) {
    	  try {
    		  action = new AdminMentoListService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/adminMemberList.admin")) {
    	  try {
    		  action = new AdminMemberListService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/mentoOk.admin")) {
    	  try {
    		  action = new AdminMentoOkService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/mentoDelete.admin")) {
    	  try {
    		  action = new AdminMentoNoService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/studyDelete.admin")) {
    	  try {
    		  action = new AdminStudyDeleteService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/mentoDrop.admin")) {
    	  try {
    		  action = new AdminMentoDeleteService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(url_command.equals("/memberDrop.admin")) {
    	  try {
    		  action = new AdminMemberDeleteService();
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }
    
      
      if(forward !=null) {
         if(forward.isRedirect()) { 
            response.sendRedirect(forward.getPath()); 
         
         }else { 
            
            RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
            dis.forward(request, response);
         }
      }
      
      
   }

}




