package com.kh.yc.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.yc.admin.model.service.AdminService;
import com.kh.yc.admin.model.service.AdminServiceImpl;
import com.kh.yc.admin.model.vo.Project;
import com.kh.yc.admin.model.vo.Report;
import com.kh.yc.member.model.vo.Member;

@Controller
public class AdminController {

	@Inject
	AdminService AdminService;

	@Autowired
	private AdminServiceImpl ap;
	
	@Autowired
	private AdminServiceImpl as;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 멤버리스트
	@RequestMapping(value = "member.ad", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {

		System.out.println("넘어왔다~~~~~~~~~~~~~~");
		List<Member> list = AdminService.memberList();
		model.addAttribute("list", list);

		System.out.println("list : " + list);
		return "admin/memberManagement";
	}

	// 멤버상태수정
	@RequestMapping(value = "memberUpdate.ad")

	public String memberUpdate(Member m, Model model) {

		System.out.println(m.getUserNo() + "userNo");
		System.out.println(m.getStatus() + "option");

		AdminService.updateMember(m);

		return "redirect:/memberStatus.ad";
	}

	// 멤버정보 호출
	@RequestMapping(value = "memberStatus.ad", method = RequestMethod.GET)
	public String admin9(String userNo, Model model) {

		model.addAttribute("dto", AdminService.viewMember(userNo));

		System.out.println("유저번호" + userNo);
		return "admin/MemberStatus";
	}

	// 멤버정보 호출2
	@RequestMapping(value = "memberView.ad", method = RequestMethod.GET)
	public String admin1(String userNo, Model model) {

		model.addAttribute("dto", AdminService.viewMember(userNo));

		System.out.println("유저번호" + userNo);
		return "admin/viewMember";
	}

	// ADMIN메인페이지
	@RequestMapping(value = "main.ad", method = RequestMethod.GET)
	public String admin2(Locale locale, Model model) {
		
		
		return "admin/admin_index";
	}

	// 프로젝트 매니저
	@RequestMapping(value = "project1.ad", method = RequestMethod.GET)
	public String admin3(Locale locale, Model model) {

		return "admin/projectManagement";
	}

	// 장부관리
	@RequestMapping(value = "project2.ad", method = RequestMethod.GET)
	public String admin4(Locale locale, Model model) {

		return "admin/book";
	}

	// 통계
	@RequestMapping(value = "project3.ad", method = RequestMethod.GET)
	public String admin5(Locale locale, Model model) {

		return "admin/chartsTest";
	}

	// 프로젝트 현황
	@RequestMapping(value = "project4.ad", method = RequestMethod.GET)
	public String admin6(Locale locale, Model model) {

		return "admin/projectStatus";
	}

	// 정산관리
	@RequestMapping(value = "project5.ad", method = RequestMethod.GET)
	public String admin7(Locale locale, Model model) {

		return "admin/adjust";
	}

	// 신고관리
	@RequestMapping(value = "project6.ad", method = RequestMethod.GET)
	public String admin8(Locale locale, Model model) {

		System.out.println("넘어왔다~~~~~~~~~~~~~~");
		List<Report> list = AdminService.reportList();
		model.addAttribute("list", list);

		System.out.println("list : " + list);

		return "admin/report";
	}

	// 신고 프로젝트 정보 호출
	@RequestMapping(value = "reportStatus.ad", method = RequestMethod.GET)
	public String admin10(String reportNo, Model model) {

		model.addAttribute("rpt", AdminService.viewReport(reportNo));

		System.out.println("유저번호" + reportNo);
		return "admin/reportStatus";
	}

	// 프로젝트 상태수정
	@RequestMapping(value = "reportUpdate.ad")
	public String reportUpdate(Project p, Model model) {

		System.out.println(p.getProjectNo() + "projectNo");
		System.out.println(p.getProgressStatus() + "option");

		AdminService.updateReport(p);

		return "redirect:/reportStatus.ad";
	}

	// 신청 프로젝트 리스트
	@RequestMapping(value = "projectList.ad", method = RequestMethod.GET)
	public String admin11(Locale locale, Model model) {

		System.out.println("넘어왔다~~~~~~~~~~~~~~");
		List<Project> list = AdminService.projectList();
		model.addAttribute("list", list);

		System.out.println("list *******************************************************************: " + list);
		return "admin/projectManagement";
	}

	// 신청 프로젝트 정보 호출
	@RequestMapping(value = "projectStatus.ad", method = RequestMethod.GET)
	public String admin12(String projectNo, Model model) {

		System.out.println("유저번호" + projectNo);
		model.addAttribute("rpt", AdminService.viewProject(projectNo));

		return "admin/projectDetail";
	}

	// 프로젝트 심사
	@RequestMapping(value = "projectUpdate.ad")
	public String projectUpdate(Project p, Model model) {

		System.out.println(p.getProjectNo() + "projectNo");
		System.out.println(p.getJudgeStatus() + "option");

		AdminService.updateProject(p);
		
		
		System.out.println("******************&&&되니************************");
		return "redirect:/projectStatus.ad";
	}
	
	
	// 정산현황
		@RequestMapping(value = "adjustUpdate.ad")
		public String adjustUpdate(Project p, Model model) {

			System.out.println(p.getProjectNo() + "projectNo");
			System.out.println(p.getJudgeStatus() + "option");

			AdminService.adjustUpdate(p);

			return "redirect:/adjustStatus.ad";
		}
	
	

	// 정산 프로젝트 리스트
	@RequestMapping(value = "adjustProjectList.ad", method = RequestMethod.GET)
	public String admin14(Locale locale, Model model) {

		System.out.println("넘어왔다~~~~~~~~~~~~~~");
		List<Project> list = AdminService.adjustProjectList();
		
		if(list != null) {
			
			as.Adjustup(list);
			System.out.println("ㄹ업데이드완료다이새기야");
		}
		
		model.addAttribute("list", list);

		System.out.println("list : " + list);
		return "admin/adjust2";
	}

	// 정산 프로젝트 정보 호출
	@RequestMapping(value = "adjustProjectStatus.ad", method = RequestMethod.GET)
	public String admin15(String projectNo, Model model) {
		
		model.addAttribute("rpt", AdminService.viewProject(projectNo));
		
		return "admin/adjustStatus";
	}

	// 홍보메일
	@RequestMapping(value = "project01.ad", method = RequestMethod.GET)
	public String admin13(Locale locale, Model model) {

		return "admin/email";
	}

	// 엑셀 다운로em
	@RequestMapping(value = "excel.ad", method = RequestMethod.GET)
	public String exDown(String projectNo, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("유저번호" + projectNo);
		request.setAttribute("projectNo", projectNo);

		return "admin/excel";
	}
	
	
	// 엑셀 업로더ㅡ
		@RequestMapping(value = "excel2.ad", method = RequestMethod.GET)
		public String exUp(String projectNo, Model model) {
			
			model.addAttribute("rpt", AdminService.viewProject(projectNo));
			
			return "admin/excelupTest";
		}
		
		// 엑셀 업로더ㅡ
		@RequestMapping(value="excel3.ad")
	    @ResponseBody
	    public ModelAndView insertReqItem(@RequestBody String httpParam) throws Exception{
			
			Gson gson = new Gson();
			
	        ModelAndView mav = new ModelAndView();
	        
	       			
			JSONParser jsonParser = new JSONParser();
			
			JSONArray insertParam = (JSONArray) jsonParser.parse(httpParam);

	        Map map = new HashMap();
	        List arr = new ArrayList();
	        //Map<String,Object> result = new HashMap<String, Object>();
			
	        ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
	        
	        for(int i=0; i<insertParam.size(); i++){
	        	list.add(i,((JSONObject) insertParam.get(i)));
	        }
			
	        
			
		
	       // map = (Map<String,Object>) gson.fromJson(gson.toJson(insertParam), map.getClass());
	   
	        System.out.println("*************************************" + list);
	        
	        AdminService.updateReward(list);
	        
	        
	        System.out.println("*************************************" + map);
	        
	        mav.setViewName("jsonView");
	        
			return mav;
	        
	        
		}


	/*//ireport
		@RequestMapping(value = "reportTest.ad" , method = RequestMethod.GET)
        public ModelAndView generatePDFreport(ModelAndView modelAndView) {
              
              Map<String,Object> parameterMap = new HashMap<String,Object>();
              
              
              List<Project> list = AdminService.adjustProjectList();
              
              
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(list);
 
        parameterMap.put( "datasource", JRdataSource);
 
        //pdfReport bean has ben declared in the jasper-views.xml file
        modelAndView = new ModelAndView("pdfReport" , parameterMap);
 
        return modelAndView;*/
		
		
		
		
		
}


		

