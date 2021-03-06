package com.kh.yc.funding.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.log.SysoCounter;
import com.kh.yc.admin.model.service.AdminService;
import com.kh.yc.admin.model.service.AdminServiceImpl;
import com.kh.yc.admin.model.vo.Project;
import com.kh.yc.board.model.service.BoardService;
import com.kh.yc.common.CommonUtils;
import com.kh.yc.funding.model.service.FundingService;
import com.kh.yc.funding.model.vo.Attachment;
import com.kh.yc.member.model.vo.Member;
import com.kh.yc.project.model.service.ProjectService;
import com.kh.yc.project.model.vo.Sign;
import com.kh.yc.reward.model.vo.Reward;
import com.kh.yc.reward.model.vo.RewardInfo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;

@CrossOrigin(origins = "*")
@Controller
@SessionAttributes("RewardNo2")
public class FundingController {

	@Autowired
	private FundingService fs;

	@Autowired
	private BoardService bs;
	
	@Autowired
	private ProjectService ps;
	private IamportClient client;

	@Autowired
	private AdminServiceImpl as;
	
	

	@RequestMapping(value = "FundingOpen1.fd", method = RequestMethod.GET)
	public String FundingOpen(Locale locale, Model model) {

		return "fundingOpen/FundingOpen1";
	}

	@RequestMapping(value = "FundingOpen2.fd", method = RequestMethod.GET)
	public String fundingInsert(Project p, Model model) {

		return "fundingOpen/FundingOpen2";
	}

	@RequestMapping(value = "FundingOpen3.fd", method = RequestMethod.GET)
	public String FundingOpen2(HttpSession session, Project p, Model model) {
		String ranNum = "";
		boolean tf = true;
		while (tf) {
			int ran = (int) (Math.random() * 1000000) + 1;
			ranNum = String.valueOf(ran);
			System.out.println(ran);
			if (ranNum.length() == 6) {
				int check = fs.pNoCheck(ranNum);
				System.out.println("check :" + check);
				if (check > 0) {
					continue;
				} else {
					break;
				}
			}
		}
		Member m = (Member) session.getAttribute("loginUser");
		Project pro = new Project();
		pro.setProjectNo(Integer.parseInt(ranNum));
		pro.setUserNo(m.getUserNo());

		int check = fs.insertProjectNum(pro);
	

		model.addAttribute("pro", pro);

		return "fundingOpen/FundingOpen3";

	}
	// System.out.println(p.getCategory() + "option");

	// p.setProjectNo(random);
	// System.out.print(p.getProjectNo());

	/* List<Project> list = fs.projectListInfo(p.getProjectNo()); */

	@RequestMapping(value = "FundingOpen4.fd", method = RequestMethod.GET)
	public String FundingOpen4(HttpSession session, HttpServletRequest request, HttpServletResponse response, Project p,
			String category, Model model) {

		String projectNo = request.getParameter("projectNo");
		String userNo = request.getParameter("userNo");
		Member m = (Member) session.getAttribute("loginUser");

		int fcategory = fs.updateCategory(p);

		System.out.println("카테코리 와라 제발 : " + p);
		model.addAttribute("p", p);
		model.addAttribute("loginUser" + m);

		return "fundingOpen/FundingOpen4";
	}

	@RequestMapping(value = "FundingOpen5.fd", method = RequestMethod.POST)
	public String FundingOpen5(Model model, Project p, HttpServletRequest request, Attachment a,
			@RequestParam(name = "photo", required = true) MultipartFile photo) {
		System.out.println("오픈 일 : " + p);

		System.out.println("photo:" + photo.getSize() + ":");
		if (photo != null && photo.getOriginalFilename().length() != 0) {

			String root = request.getSession().getServletContext().getRealPath("resources");

			String filePath = root + "\\uploadFiles";
			String origunFileName = photo.getOriginalFilename();
			String ext = origunFileName.substring(origunFileName.lastIndexOf("."));
			String changeName = CommonUtils.getRandomString()+ext;
			String fullFilePath = filePath + "\\" + changeName;
			System.out.println("********************");
			try {

				System.out.println("fullFilePath : " + fullFilePath);

				photo.transferTo(new File(fullFilePath));

				Attachment fileVO = new Attachment();

				fileVO.setOriginFileName(origunFileName);
				fileVO.setFileSrc(fullFilePath);
				fileVO.setNewFileName(changeName);
				fileVO.setProjectNo(p.getProjectNo());
				fileVO.setFileLevel("0");
				// insert 파일정보

				String fileName = fs.selectFile(p);
				int file = fs.selectFileList(p);

				if (file == 0) {
					file = fs.insertFile(fileVO);
				} else if (file > 0) {
					if (fileName.equals(origunFileName)) {
						System.out.println("존재하는 파일입니다");
					} else {
						file = fs.updateFile(fileVO);
					}
				}
				
				p.setMainImg(String.valueOf(fileVO.getAttachmentNo()));
				System.out.println("파알  : ================================================= " + fileVO);
				model.addAttribute("fileVO", fileVO);
				// p.setAttachment(fileVO);
			} catch (Exception e) {

				e.printStackTrace();
				new File(fullFilePath).delete();
			}
		}else  {
			List<Project> list = fs.baseInfoList(p);
			System.out.println("list : " + list);
			
			List<Attachment> listAttachment = fs.
					baseInfoListAt(a);
			model.addAttribute("p",list.get(0));
			if(listAttachment.size() !=0) {
				
				model.addAttribute("fileVO",listAttachment.get(0));
			}
			
		}
		
		
		System.out.println("photo:" + a.getOriginFileName());
	
		int result = fs.UpdateInfo(p);
		System.out.println("아아아아 ================" + p);
		model.addAttribute("p", p);

		return "fundingOpen/FundingOpen4";
	}

	// 다음으로 가기 기본정보에서 ~ 리워드로
	@RequestMapping(value = "FundingOpenNext5.fd", method = RequestMethod.POST)
	public String FundingOpenNext5(Project p, Model model, HttpServletRequest request) {
		
		
		
		model.addAttribute("p", p);
		return "fundingOpen/FundingOpen5";
	}

	// 리워드 저장부분
	@RequestMapping("insertreReward.fd")
	public ModelAndView RewardSave(String idx, Project p, HttpServletRequest request, HttpServletResponse response,
			Reward r, Model model) {

		ModelAndView mv = new ModelAndView("jsonView2");
		
		
		System.out.println("리워드 : " + r);
		r.setProjectNo(p.getProjectNo());
		
		int reward = fs.rewardInest(r);

		System.out.println("idx : " + idx);

		System.out.println("리워드 번호 : " + r.getRewardNo());
		
		int RewardNo2 = r.getRewardNo();
		

		model.addAttribute("RewardNo2",RewardNo2);
		model.addAttribute("r1", r);
		//mv.addObject("RewardNo2",RewardNo2);
		mv.addObject("r", r);
		
		// mv.setViewName("mvReward");
		/*
		 * List<Reward> list = fs.rewardSelect(r);
		 * 
		 * System.out.println("list : " + list);
		 * 
		 * mv.addObject("r",list );
		 */

		return mv;
	}
	
	// 리워드 업데이트
	@RequestMapping("updateReward.fd")
	public ModelAndView RewardUpdate(String idx, Project p, HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute("RewardNo2") int RewardNo2, Reward r) {

		System.out.println("잘받아 오나 확인 : " + r);
		System.out.println("RewardNo2"+RewardNo2);

		ModelAndView mv = new ModelAndView("jsonView2");
		// System.out.println("************************"+mv.getViewName());
		// System.out.println("********************************" + mv);

		System.out.println("리워드업데이트 전 : " + r);
		System.out.println("업데이트  키 : " + r.getRewardNo());

		r.setRewardNo(RewardNo2);
		int rewardUP = fs.rewardUpdate(r);
		
		System.out.println("리워드업데이트 후 : " + r);
			
		mv.addObject("r", r);

		return mv;

	}
	
	@RequestMapping("deleteReward.fd")
	public ModelAndView deleteReward(Reward r, ModelAndView mv, HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute("RewardNo2") int RewardNo2) {
		System.out.println(mv);
	
		r.setRewardNo(RewardNo2);
		
		System.out.println("리워드 번호 : ========================== " + r);
		
		int del = fs.deleteReward(r);
		
		mv.addObject("r", r);
		mv.setViewName("jsonView");
		
		return mv;
	}
	 

	@RequestMapping(value = "FundingOpen6.fd")
	public String FundingOpen6(Project p, String projectNo, Model model,
			@SessionAttribute("RewardNo2") String RewardNo2, Reward r) {
		
		r.setRewardNo(Integer.parseInt(RewardNo2));
		
		p.setProjectNo(Integer.parseInt(projectNo));
		
		model.addAttribute("p", p);
		model.addAttribute("RewardNo2",r.getRewardNo());

		return "fundingOpen/FundingOpen6";
	}

	@RequestMapping(value = "FundingOpen7.fd")
	public String FundingOpen7(Project p, Reward r, RewardInfo ri, Model model) {
		System.out.println("실행");
		
		System.out.println("ri 들어오는 중  :" + ri);

		fs.updateProject(p);

		if (r.getRewardNo() > 0) {
			fs.insertRewardInfo(ri);
			System.out.println("ri 인설트 : " + ri);
			
		}
		model.addAttribute("p", p);
		return "fundingOpen/FundingOpen7";
	}

	@RequestMapping(value = "FundingOpen8.fd")
	public String FundingOpen8(Project p, Member m, HttpServletRequest request, @RequestParam(name = "photo", required = false) MultipartFile photo, Model model) {
		System.out.println("프로필");
		System.out.println("프로젝트 번호 : " + p.getProjectNo());
		Attachment attach = new Attachment();
		attach = fs.selectAttach(p);
		if(attach == null || attach.equals(null)) {
				
			String root = request.getSession().getServletContext().getRealPath("resources");
			attach = new Attachment();
			String filePath = root + "\\uploadfiles";
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String newFileName = CommonUtils.getRandomString();
			
			try {
				photo.transferTo(new File(filePath + "\\" + newFileName + ext));
				
				
				attach.setAttachmentDiv("프로젝트");
				attach.setProjectNo(p.getProjectNo());
				attach.setFileSrc(filePath + "\\");
				attach.setOriginFileName(originFileName);
				attach.setNewFileName(newFileName + ext);
				attach.setFileLevel("1");
				
				int result = fs.insertProfileImg(attach);
				if(result > 0) {
					attach = fs.selectAttach(p);
					p.setProfileImg(attach.getAttachmentNo()+"");
					fs.updateProject(p);
					fs.updateMember(m);
				} else {
					throw new Exception();
				}
			} catch (Exception e) {
				e.printStackTrace();
				new File(filePath + "\\" + newFileName + ext).delete();
			}
		}
		System.out.println(p);
		System.out.println(attach);
		model.addAttribute("p", p);
		return "fundingOpen/FundingOpen8";
	}

	@RequestMapping(value = "FundingOpen9.fd")
	public String FundingOpen9(Project p, Model model) {

		fs.updateProject(p);
		
		model.addAttribute("p", p);
		return "fundingOpen/FundingOpen9";
	}

	@RequestMapping("payTest.fd")
	public String payTest() {

		return "fundingOpen/payTest";
	}

	@RequestMapping("finalOpen.fd")
	public String finalOpen(Member m, Project p ,HttpServletRequest request, @RequestParam(name = "photo", required = false) MultipartFile photo, Model model) {
		System.out.println(m);
		
		System.out.println("대표자 명 전 : " + p);
		
		int result = fs.updateAdjust(m);
		System.out.println(result);
		fs.updateProject(p);
		result = fs.openProject(p);
		
		System.out.println("대표자 명 전 : " + p);
		
		ArrayList<com.kh.yc.project.model.vo.Project> list = null;
		try {
			if ((m == null) || (m.getMemberCategory().length() == 0)) {
				list = bs.getProject();
			} else {
				String category = m.getMemberCategory();
				list = ps.memberCategory(category);
				
				
				
			}
		} catch (Exception e) {
			list = bs.getProject();
		}
		model.addAttribute("list", list);
		return "main/main";
	}
		
	@RequestMapping("getToken.fd")
	public ModelAndView getToken(String imp_key, String imp_secret, ModelAndView mv) {
		System.out.println(imp_key);
		System.out.println(imp_secret);

		String api_key = imp_key;
		String api_secret = imp_secret;

		client = new IamportClient(api_key, api_secret);

		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			System.out.println(auth_response);

		} catch (IamportResponseException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());

			switch (e.getHttpStatusCode()) {
			case 401:
				// TODO
				System.out.println(401);
				break;
			case 500:
				// TODO
				System.out.println(500);
				break;
			}
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping("signiture.fd")
	public String signiture(String bNum, String userNo, Model model) {

		model.addAttribute("bNum", bNum);
		model.addAttribute("userId", userNo);

		return "fundingOpen/signiture";
	}

	@RequestMapping("sign.fd")
	public ModelAndView sign(ModelAndView mv, String userNo, String bNum, HttpServletRequest request, Model model) {
		String sign = StringUtils.split(request.getParameter("sign"), ",")[1];
		String root = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		String attachPath = "\\";

		String fileName = "sign" + System.currentTimeMillis() + ".png";

		Sign s = new Sign();
		
		s.setUserNo(Integer.parseInt(userNo));
		s.setbNo(Integer.parseInt(bNum));
		int result = fs.signUser(s);

		if (result > 0) {
			Attachment a = new Attachment();
			a.setFileSrc(root + attachPath);
			a.setProjectNo(Integer.parseInt(bNum));
			a.setOriginFileName(fileName);
			a.setNewFileName(fileName);
			

			result = fs.signFile(a);
			try {
				FileUtils.writeByteArrayToFile(new File(root + attachPath + fileName), Base64.decodeBase64(sign));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		model.addAttribute("fileName", fileName);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("signProject.fd")
	public String signProject(String bNum, Model model) {
		model.addAttribute("bNum", bNum);

		return "fundingOpen/signProject";
	}
	//기본정보 조회
		@RequestMapping("baseInfoList.fd")
		public String baseInfoList(Model model, HttpServletRequest request, Project p, Attachment a) {
			System.out.println("pppppppppppppppp : " + p );
			List<Project> list = fs.baseInfoList(p);
			System.out.println("list : " + list);
			
			List<Attachment> listAttachment = fs.baseInfoListAt(a);
		System.out.println("사진 사진  :" + listAttachment);
		System.out.println("photo:" + a.getOriginFileName());
			
			if(list.size()!=0) {
			
				model.addAttribute("p",list.get(0));
				
				
			}
			if(listAttachment.size() != 0) {
				
				model.addAttribute("fileVO",listAttachment.get(0));
			}
			
			
			
			return "fundingOpen/FundingOpen4";
		}
	
	
	  
	 //리워드 
	@RequestMapping("rewardList.fd")
	public String rewardList(Project p, Model model, HttpServletRequest request, Reward r) {
		
		List<Reward> rewardList = fs.rewardList(r);
		
		model.addAttribute("r",rewardList);
		model.addAttribute("p",p);
		

		return "fundingOpen/FundingOpen5";
	}
	
	@RequestMapping("selectRewardAll.fd")
	public ModelAndView selectRewardAll(ModelAndView mv, Project p, Model model, HttpServletRequest request, Reward r) {
		
		r.setProjectNo(p.getProjectNo());
		List<Reward> rewardList = fs.selectRewardAll(r);
		
		
		
		mv.setViewName("jsonView2");;
		mv.addObject("r",rewardList);
		
		return mv;
	}
	
	@RequestMapping("rewardStory.fd")
	public String rewardStory(Project p, RewardInfo rf, Model model) {
		
		List<Project> rewardInfo = fs.selectRewardInfo(p);
		
		List<RewardInfo> listInfo = fs.selectlistInfo(rf);
		
		if(rewardInfo.size()!=0) {
			model.addAttribute("p", rewardInfo.get(0));
		}
		
		if(listInfo.size()!=0) {
			model.addAttribute("rf",listInfo.get(0));
			
		}
		return "fundingOpen/FundingOpen6";
	}

//	@RequestMapping("makerInfo.fd")
//	public String makerInfo(Project p, Attachment at, Member m, Model model) {
//		System.out.println("전");
//			
//			//Member m = (Member) session.getAttribute("loginUser");
//			
//			List<Project> makerInfoList = fs.selectMakerInfo(p);
//			List<Attachment> makerProfileImgList = fs.selectProfileImgList(at);
//			List<Member> makerCompanyNameList = fs.makerCompanyNameList(m);
//			System.out.println("mmmmmmmmmmmmmm : " + m );
//			
//			if(makerInfoList.size() !=0) {
//				model.addAttribute("p",makerInfoList.get(0));
//			}
//			if(makerProfileImgList.size() !=0) {
//				model.addAttribute("at",makerProfileImgList.get(0));
//			}
//			if(makerCompanyNameList.size() !=0) {
//				model.addAttribute("m",makerCompanyNameList.get(0));
//			}
//		
//		return "fundingOpen/FundingOpen7";
//	}
	
	
	
	

}
