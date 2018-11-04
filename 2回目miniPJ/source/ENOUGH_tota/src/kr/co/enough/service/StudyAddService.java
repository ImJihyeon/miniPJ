package kr.co.enough.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.StudyDao;
import kr.co.enough.dto.MentoStudyDto;

public class StudyAddService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {		
		ActionForward foward = null;
		String path = request.getRealPath("/img/studyImg");
		System.out.println("리얼 패스 주소  : "+path);
		int size = 10 * 1024 * 1024;
		String fileName = ""; 
		String oriFileName = "";
		HttpSession session = request.getSession();

		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
			request.setCharacterEncoding("UTF-8");
			String mento_email = (String) session.getAttribute("email");
			String study_name = (String) multi.getParameter("study_name");
			String study_write = (String) multi.getParameter("study_write");
			Date start_date = Date.valueOf(multi.getParameter("start_date"));
			Date end_date = Date.valueOf(multi.getParameter("end_date"));
			int price = Integer.parseInt(multi.getParameter("price"));
			String study_subject_code = (String) multi.getParameter("study_subject_code");
			String study_level_code = (String) multi.getParameter("study_level_code");
			String study_loc_code = (String) multi.getParameter("study_loc_code");
			String study_img = (String)multi.getFilesystemName("study_img");
			
			Enumeration files = multi.getFileNames();
			String str = (String) files.nextElement(); 
			fileName = multi.getFilesystemName(str); // fileName
			oriFileName = multi.getOriginalFileName(fileName);// oriFileName
			
			StudyDao dao = new StudyDao();
			int resultRow = dao.InsertStudy(mento_email, study_name, study_write, start_date, end_date, price,
					study_subject_code, study_level_code, study_loc_code, study_img);
			
			if (resultRow > 0) {
				ArrayList<MentoStudyDto> myStudyList = new ArrayList<MentoStudyDto>();
				myStudyList = dao.getMentoStudyList(mento_email);
				String result = "";

				if (myStudyList.isEmpty()) {
					request.setAttribute("result", "false");
				} else {
					request.setAttribute("result", "true");
					request.setAttribute("myStudyList", myStudyList);
				}
				
				foward = new ActionForward();
				foward.setRedirect(false);
				foward.setPath("/view/mypage/mento/myStudy.jsp");
				
			} else {
				System.out.println("insert fail");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return foward;
	}
}
