package kr.co.enough.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.enough.action.Action;
import kr.co.enough.action.ActionForward;
import kr.co.enough.dao.PayDao;
import kr.co.enough.service.DropOutMentoService;
import kr.co.enough.service.DropOutService;
import kr.co.enough.service.MentoMyStudyService;
import kr.co.enough.service.MentoMyStudyUpdateListService;
import kr.co.enough.service.MentoProfileService;
import kr.co.enough.service.MentoStudyMemberService;
import kr.co.enough.service.MyProfileService;
import kr.co.enough.service.MyStudyDeleteService;
import kr.co.enough.service.MyStudyService;
import kr.co.enough.service.MyWishService;
import kr.co.enough.service.UpdateMentoProfileService;
import kr.co.enough.service.UpdateProfileService;
import kr.co.enough.service.WishDeleteService;


@WebServlet("*.mypage")
public class MyPageControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public MyPageControllerServlet() {
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
      System.out.println("MyPageController success");
      System.out.println(RequestURI);
      System.out.println(url_command);
      if(url_command.equals("/myProfile.mypage")) {
         try {
            action = new MyProfileService();
            forward = action.execute(request, response);
         }catch(Exception e) {
         e.printStackTrace();
         }
      }else if(url_command.equals("/updateProfile.mypage")) {
         try {
            
            action = new UpdateProfileService();
            forward = action.execute(request, response);
            System.out.println("member profile update success");
         }catch(Exception e) {
            
         }
      }else if(url_command.equals("/dropOut.mypage")) {
         try {
            action = new DropOutService();
            forward = action.execute(request, response);
            System.out.println("탈퇴");
         }catch(Exception e) {
            
         }
      }else if(url_command.equals("/myStudy.mypage")) {
         try {
            action = new MyStudyService();
            forward = action.execute(request, response);
         }catch(Exception e) {
         }
      }else if(url_command.equals("/myWish.mypage")) {
         try {
            System.out.println("");
            action = new MyWishService();
            forward = action.execute(request, response);
         }catch(Exception e) {
         }
      }else if (url_command.equals("/mentoMyStudy.mypage")) { /* メントが生成したスタディのリストを見る
*/
			try {
				action = new MentoMyStudyService();
				forward = action.execute(request, response);

			} catch (Exception e) {
			}
		} else if (url_command.equals("/mentoMyStudyUpdateList.mypage")) { /* メントが修正リストを表示する */
			try {
				action = new MentoMyStudyUpdateListService();
				forward = action.execute(request, response);
			} catch (Exception e) {
			}
		} else if (url_command.equals("/mentoStudyMember.mypage")) { /* mentoがスタディー別会員リスト表示 - セレクトボックス生成 */
			try {
				action = new MentoStudyMemberService();
				forward = action.execute(request, response);
			} catch (Exception e) {
			}
			/*Delete 会員がマイページで決済取り消し */ 
	      }else if(url_command.equals("/wishDelete.mypage")) {
	            try {
	               action = new WishDeleteService();
	                 forward = action.execute(request, response);
	              }catch(Exception e) {
	              }
	        }else if(url_command.equals("/myStudyDelete.mypage")) {
	            try {
	               action = new MyStudyDeleteService();
	                 forward = action.execute(request, response);
	              }catch(Exception e) {
	              }
	        } else if (url_command.equals("/mentoProfile.mypage")) {
			try {
				action = new MentoProfileService();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/updateMentoProfile.mypage")) {
			try {
				action = new UpdateMentoProfileService();
				forward = action.execute(request, response);
				System.out.println("member profile update success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/dropOutMentoProfile.mypage")) {
			try {
				action = new DropOutMentoService();
				forward = action.execute(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(url_command.equals("/payDelete.mypage")) {
	    	  PrintWriter out = response.getWriter();
	    	  HttpSession session = request.getSession();

				String MEM_EMAIL = (String) session.getAttribute("email");
				int study_num = Integer.parseInt(request.getParameter("study_num"));			
	    	  try {
	  			
	  			PayDao dao = new PayDao();
	  			int studyDeleteRow = dao.studyMemberDelete(MEM_EMAIL, study_num);

	  			if (studyDeleteRow > 0) {
	  				System.out.println("studyMember delete 성공 : " + studyDeleteRow);
	  				int payDeleteRow = dao.payDelete(MEM_EMAIL, study_num);
	  				System.out.println("결재 payDeleteRow : " + payDeleteRow);
	  				if (payDeleteRow > 0) {
	  					System.out.println("결제 delete 성공");
	  					out.print("true");
	  				} else {
	  					System.out.println("결제 delete 실패");
	  					out.print("false");
	  				}
	  			} else {
	  				System.out.println("studyMember delete 실패");
	  				out.print("false");
	  			}
	  		} catch (Exception e) {
	  			e.printStackTrace();
	  		}
			  } //決裁取り消し 完

      
      if(forward !=null) {
         if(forward.isRedirect()) { //forward.isRedirect()-> true
            response.sendRedirect(forward.getPath()); //location.href 
         
         }else { //forward.isRedirect()-> false
            //forward >> 住所変化はなく,内容だけ変化 >> 
            
            RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
            dis.forward(request, response);
         }
      }
      
      
   }

}




