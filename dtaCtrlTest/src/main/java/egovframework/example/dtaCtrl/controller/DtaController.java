package egovframework.example.dtaCtrl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import egovframework.example.dtaCtrl.service.DtaService;


@Controller
public class DtaController {

	Logger logger = LoggerFactory.getLogger(DtaController.class);
	
	@Resource
	private DtaService dtaService;
	
	/**
	 * 메인화면 진입
	 * @return
	 */
	@RequestMapping("/index.do")
	public String begin() {
		System.out.println("index...");
		return "welcomeBegin";
	}
	
	/**
	 * 수정 코드 - 검색기능 있음 (메인화면 초기 로드시 회원목록 조회/ default - 검색조건 없음)
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getAllMembers.do", method = RequestMethod.GET)
	@ResponseBody
	public String getAllMembers(@RequestParam Map<String, Object> param, Model model) {
		
		ModelAndView mav = new ModelAndView("index");
		// System.out.println("param: "+param);
		System.out.println("param.get('userId'): "+param.get("userId"));
		Map<String, Object> response = new HashMap<String, Object>();
		List<Map<String, Object>> memberList = dtaService.getFindMembers(param);
		try {
			if(memberList.size() != 0) {
				if(!memberList.isEmpty() || memberList != null || !memberList.equals("")) {
					System.out.println("조회 성공");
					System.out.println("memberList: "+ memberList);
					System.out.println("memberList.get(0): "+ memberList.get(0));
					model.addAttribute("what", "success");
					model.addAttribute("list", memberList);
				}else {
					System.out.println("조회 실패");
					model.addAttribute("what", "fail");
				}
			}else {
				System.out.println("조회 결과 없음");
				model.addAttribute("what", "fail");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		JSONObject jObj = new JSONObject((Map) model);
		
		return jObj.toString();
	}
	
	/**
	 * 기존 코드 - 검색기능 없음
	 * @return
	 */
//	@RequestMapping(value = "/getAllMembers.do", method = RequestMethod.GET)
//	@ResponseBody
//	public String getAllMembers(Model model) {
//		
//		ModelAndView mav = new ModelAndView("index");
//		Map<String, Object> response = new HashMap<String, Object>();
//		
//		List<Map<String, Object>> memberList = dtaService.getAllMembers();
//		try {
//			if(!memberList.isEmpty() || memberList != null || !memberList.equals("")) {
//				System.out.println("조회 성공");
//				System.out.println("memberList: "+ memberList);
//				System.out.println("memberList.get(0): "+ memberList.get(0));
//				//			response.put("what", "success");
//				//			response.put("list", memberList.get(0));
//				//			System.out.println("response: "+response);
//				model.addAttribute("what", "success");
//				model.addAttribute("list", memberList);
//			}else {
//				System.out.println("조회 실패");
//				//			response.put("what", "fail");
//				model.addAttribute("what", "fail");
//			}
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		JSONObject jObj = new JSONObject((Map) model);
//		
//		return jObj.toString();
//	}
	
	/**
	 * 회원가입페이지로 이동
	 * @return
	 */
	@RequestMapping("/toSignin.do")
	public String toSignin() {
		return "signinPage";
	}
	/**
	 * 로그인페이지로 이동
	 * @return
	 */
	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return "loginPage";
	}
	/**
	 * 회원가입 처리
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/registMember.do")
	@ResponseBody
	public String registMember(@RequestParam Map<String, Object> param) throws Exception {
		logger.info("회원가입중..."+param);
		Map<String, Object> response = new HashMap<String, Object>();
		
		try {
			
			int registOk = dtaService.insertMember(param);
			if(registOk > 0) {
				System.out.println("회원가입 성공");
				response.put("userId", param.get("userId"));
				response.put("result", "success");
			}else {
				System.out.println("회원가입 실패");
				response.put("result", "fail");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		JSONObject jObj = new JSONObject(response);
		return jObj.toJSONString();
	}
	
	/**
	 * 회원정보 일치 확인(로그인 전 단계)
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/getLogin.do")
	@ResponseBody
	public String getLoginState(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("param: "+param);
		Map<String, Object> member = new HashMap();
		member = dtaService.selectOneMember(param);
		System.out.println("return 확인: "+member);
		if(member.equals("") || member.isEmpty() || member == null) {
			System.out.println("회원정보 없음");
			model.addAttribute("what", "fail");
		}else {
			System.out.println("로그인 성공");
			model.addAttribute("what", "success");
			model.addAttribute("member", member);
		}
		JSONObject jObj = new JSONObject((Map) model);
		return jObj.toString();
	}
	
	/**
	 * 전달 받은 정보로 로그인
	 * @param param
	 * @return
	 */
	@RequestMapping("/welcomeUserDtl.do")
	public String moveUserDtl(@RequestParam Map<String, Object> param, Model model) {
		// ModelAndView mav = new ModelAndView("welcomeUserDtl");
		System.out.println("parameter: "+param);
		Map<String, Object> member = dtaService.selectOneMember(param);
		// mav.addObject("memeber", member);
		model.addAttribute("member", member);
		System.out.println("model Data: "+model);
		return "welcomeUserDtl";
	}
	
	/**
	 * 회원정보 수정	- 여기 ajax로 호출하는 것 연습 (@ResponseBody, JSONObject...) - 성공시 alert 띄우고 페이지 이동
	 * 비밀번호 맞는지 먼저 조회하는거 필요(dtaService.selectOneMember..)
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateUserInfo.do")
	public String updateUser(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("parameter data: "+param);
		String page = "";
		int memberInfo = dtaService.updateMemberInfo(param);
		System.out.println("회원정보 수정: "+memberInfo);
		if(memberInfo == 1) {
			model.addAttribute("what", "success");
		}else {
			model.addAttribute("what", "fail");
		}
		page = "welcomeBegin";
		return page;
	}
	
	// 회원 탈퇴 - 직접 해보기
	
}
