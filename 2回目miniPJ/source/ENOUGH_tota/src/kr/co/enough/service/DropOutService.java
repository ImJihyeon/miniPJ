package kr.co.enough.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.JoinDao;
import kr.co.enough.dao.LoginDao;
import kr.co.enough.dao.MyPageDao;

public class DropOutService implements Action{
	@Override
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		try {
			MyPageDao dao = new MyPageDao();
			
	        dao.dropOutStudyMember(email);
	        dao.dropPayment(email);
	        dao.dropOutWish(email);
	        dao.dropOut(email);
	        session.invalidate();
		}catch(Exception e) {
			System.out.println("erro :" + e.getMessage());
		}
		
		forward  = new ActionForward();
		forward.setRedirect(false); //forward방식
		forward.setPath("/view/main.jsp");
		return 	forward;
	}
}
