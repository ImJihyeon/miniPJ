package kr.co.enough.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.StudyDao;
import kr.co.enough.dto.StudyDto;

public class SearchStudyCheckService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String[] loc;
		String[] level;
		
		ArrayList<StudyDto> studyList;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		  	String study_subject_code = request.getParameter("STUDY_SUBJECT_CODE");
		  	
			loc = request.getParameterValues("loc");
			level = request.getParameterValues("level");
			StudyDao dao = new StudyDao();
			studyList = dao.SearchStudyCheck(study_subject_code, loc, level);
			
			request.setAttribute("studyList", studyList);
			request.setAttribute("study_subject_code", study_subject_code);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/view/category/studyList.jsp"); 

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("erro :" + e.getMessage());
		}

		
		return forward;
	}
}
