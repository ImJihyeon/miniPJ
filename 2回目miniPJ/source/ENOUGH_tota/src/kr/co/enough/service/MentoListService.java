package kr.co.enough.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.MentoDao;
import kr.co.enough.dto.MentoDto;

public class MentoListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward foward = null;
		try {
			   MentoDao dao = new MentoDao();
       	       ArrayList<MentoDto> mentolist = dao.getMentoList();       	       
       	       request.setAttribute("mentolist", mentolist);       	      
       	       
       	       foward = new ActionForward();
       	       foward.setRedirect(false);
       	       foward.setPath("/view/mento/mento.jsp");
       	       
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return foward;
	}

}
