package kr.co.enough.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.service.EmailCheckService;
import kr.co.enough.service.JoinService;
import kr.co.enough.service.LoginService;
import kr.co.enough.service.MentoApplyListService;
import kr.co.enough.service.MentoDetailService;
import kr.co.enough.service.MentoListService;
import kr.co.enough.service.MyProfileService;
import kr.co.enough.service.PaymentAddService;
import kr.co.enough.service.SearchStudyCheckService;
import kr.co.enough.service.StudyAddService;
import kr.co.enough.service.StudyDeleteService;
import kr.co.enough.service.StudyDetailService;
import kr.co.enough.service.StudyListService;
import kr.co.enough.service.StudyUpdateService;
import kr.co.enough.service.UpdateProfileService;


@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FrontControllerServlet() {
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
		if(url_command.equals("/view/form/login.do")) {
			try {
				  action = new LoginService();
				  forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(url_command.equals("/view/form/join.do")){
			try {
				action = new JoinService();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(url_command.equals("/view/form/emailCheck.do")){
			try {
				action = new EmailCheckService();
				forward = action.execute(request, response);
			}catch(Exception e) {
			e.printStackTrace();
			}
		}else if(url_command.equals("/view/form/myProfile.do")) {
			try {
				action = new MyProfileService();
				forward = action.execute(request, response);
			}catch(Exception e) {
			e.printStackTrace();
			}
		}else if(url_command.equals("/view/form/updateProfile.do")) {
			try {
				
				action = new UpdateProfileService();
				forward = action.execute(request, response);
				if(forward != null) {
					
				}
			}catch(Exception e) {
				
			}
		}else if(url_command.equals("/view/category/studyList.do")) {   //ここから下まで3つ追加
			try {
				  action = new StudyListService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/view/category/SearchStudyCheck.do")) {
			try {
				  action = new SearchStudyCheckService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
		} else if(url_command.equals("/view/category/studyDetail.do")){   
			try {
				action = new StudyDetailService();
				forward = action.execute(request, response);
			}catch(Exception e) {
			e.printStackTrace();
			}
	}else if(url_command.equals("/view/mento/MentoList.do")) { // メントリスト·サーブレット
			try {
				action = new MentoListService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(url_command.equals("/view/mento/MentoDetail.do")) { // メント詳細リストサブレット

			try {
				  action = new MentoDetailService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
	} else if(url_command.equals("/view/category/StudyAdd.do")) { // スタディー生成

			try {
				  action = new StudyAddService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(url_command.equals("/view/category/PaymentAdd.do")) {  // 決済ページ
			try {
				  action = new PaymentAddService(); 
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(url_command.equals("/view/mento/MentoApplyList.do")) {
	         try {
	               System.out.println("피자");
	              action = new MentoApplyListService();
	              forward = action.execute(request, response);
	            
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	         }else if(url_command.equals("/view/category/StudyUpdate.do")) { // メントが自分のスタディーの修正

			try {
				  action = new StudyUpdateService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(url_command.equals("/view/category/StudyDelete.do")) { // メントが"自分のスタディー"を削除
			try {
				  action = new StudyDeleteService();
				  forward = action.execute(request, response);
				  
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} 
		
		if(forward !=null) {
			if(forward.isRedirect()) { //forward.isRedirect()가 true이면..
				response.sendRedirect(forward.getPath()); //location.href 
			
			}else { //forward.isRedirect()가 false이면..
				//forward >> 주소변화 없고 내용만 변화 >> 
				
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
		
	}

}





