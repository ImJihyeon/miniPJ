package kr.co.enough.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.MyPageDao;
import kr.co.enough.dto.LoginDto;


public class UpdateMentoPageService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward foward = null;
      String path = request.getRealPath("/img/profie");
      int size = 10 * 1024 * 1024; 
      String fileName=""; 
      String oriFileName = ""; 
      HttpSession session = request.getSession();
      
      LoginDto dto = new LoginDto();
      String msg="";
      try {
         MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
         String name = (String)multi.getParameter("name");
         String hp = (String)multi.getParameter("hp");
         String member_img = (String)multi.getFilesystemName("member_img");
         System.out.println("member_img: "+member_img);
         String email = (String)session.getAttribute("email");
         if(member_img == null) {
            member_img = (String)session.getAttribute("member_img");
         }
           if(hp.length()==11) {
               hp = new StringBuilder(hp).insert(hp.length()-4, "-").toString();
               hp = new StringBuilder(hp).insert(hp.length()-9, "-").toString();
              }else if(hp.length()==10) {
               hp = new StringBuilder(hp).insert(hp.length()-4, "-").toString();
               hp = new StringBuilder(hp).insert(hp.length()-8, "-").toString();
              }
           dto.setName(name);
           dto.setHp(hp);
           dto.setMember_img(member_img);
           dto.setEmail(email);
           MyPageDao dao = new MyPageDao();
           int profileList = dao.updateProfileList(dto);
           if(profileList > 0) {
              msg="success";
           }else {
              msg="fail";
           }
           Enumeration files = multi.getFileNames(); 
           String str = (String)files.nextElement(); //入力ボックス名を変数に保存
           fileName=multi.getFilesystemName(str); //fileName
           oriFileName = multi.getOriginalFileName(fileName);//oriFileName
           foward = new ActionForward();
           foward.setRedirect(false);
           foward.setPath("/view/mypage/mento/mentopage.jsp");
           session.setAttribute("member_img", member_img);
           session.setAttribute("name", name);
           String test = (String)session.getAttribute("name");
           request.setAttribute("hp",hp);
         }catch(Exception e) {
         e.printStackTrace();
      }
      return foward;
   }
}


           