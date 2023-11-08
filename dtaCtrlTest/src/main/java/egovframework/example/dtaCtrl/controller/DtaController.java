package egovframework.example.dtaCtrl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
	 * 메인화면 초기 로드시 회원목록 조회/ default - 검색조건 없음, 아이디 입력 시 해당 아이디로 목록 조회
	 * 변경: 메인화면에서 검색조건 선택시 메소드 - default 검색조건 없이 조회
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getAllMembers.do", method = RequestMethod.GET)
	@ResponseBody
	public String getAllMembers(@RequestParam Map<String, Object> param, Model model) {
		
		ModelAndView mav = new ModelAndView("index");
		// 검색조건에 따라서 입력값을 id, name으로 변경
		System.out.println("param.get('user'): "+param.get("user")+" ,param.get('condition'): "+param.get("condition"));
		Map<String, Object> response = new HashMap<String, Object>();
		List<Map<String, Object>> memberList = dtaService.getFindMembers(param);
		try {
			if(memberList.size() != 0) {
				if(!memberList.isEmpty() || memberList != null || !memberList.equals("")) {
					System.out.println("조회 성공");
					System.out.println("memberList: "+ memberList);
					System.out.println("memberList.get(0): "+ memberList.get(0));
					
					ArrayList<Map<String, String>> memberArray = new ArrayList<>();
					
					for(int i=0; i<memberList.size(); i++) {
						Map<String, String> row = new LinkedHashMap<>();
						row.put("이름", (String) memberList.get(i).get("USERNM"));
						row.put("아이디", (String) memberList.get(i).get("USERID"));
						row.put("주소", (String) memberList.get(i).get("ADDRESS"));
						row.put("비고", (String) memberList.get(i).get("COMMENT"));
						memberArray.add(row);
					}
					System.out.println("memberArray: "+memberArray);
					model.addAttribute("what", "success");
					// model.addAttribute("list", memberList);
					model.addAttribute("list", memberArray);
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
	 * 검색버튼을 이용한 조회
	 * @param condition
	 * @param user
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/toFindMemberByBtn.do")
	public ModelAndView toFindMemberByBtn(@RequestParam String condition, String user) {
		System.out.println("검색조건: "+condition+", 검색어: "+user);
		ModelAndView mav = new ModelAndView("welcomeBegin");
		Map<String, Object> pMap = new HashMap();
		pMap.put("condition", condition);
		pMap.put("user", user);
		List<Map<String, Object>> memberList = new ArrayList<Map<String, Object>>();
		try {
			if(!(condition == null || condition == "" || condition.equals("")) && !(user == null || user == "" || user.equals(""))) {
				memberList = dtaService.getFindMembers(pMap);
				
				if(memberList.size() != 0) {
					if(!memberList.isEmpty() || memberList != null || !memberList.equals("")) {
						System.out.println("조회 성공: "+memberList);
						mav.addObject("memberList", memberList);
					}else {
						System.out.println("조회 실패");
					}
				}else {
					System.out.println("조회 결과 없음");
				}
			}else {
				System.out.println("검색조건이나 검색어가 없음");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return mav;
	}
	
	/**
	 * 약관동의페이지로 이동
	 * @return
	 */
	@RequestMapping("/toPolicy.do")
	public String toPolicy() {
		return "welcomePolicy";
	}
	
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
	 * 회원정보 일치 확인(로그인 전 단계)	-	상세페이지 호출
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/getLogin.do")
	@ResponseBody
	public String getLoginState(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("param: "+param);
		Map<String, Object> member = new HashMap();
		member = dtaService.selectOneMember(param);	// 비밀번호 일치회원 있는지 확인
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
	 * 회원정보 수정
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
	
	/**
	 * 회원 수정, 탈퇴 전 비밀번호 확인
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/isRightPwd.do")
	@ResponseBody
	public String isRightPwd(@RequestParam Map<String, Object> param, Model model) {
		String code = (String) param.get("code");	// 접근한 uri에 따라 리턴하는 code를 변경
		
		System.out.println("전달받은 파라미터: "+param);
		Map<String, Object> member = dtaService.selectOneMember(param);
		System.out.println("return 확인: "+member);
		if(member.equals("") || member.isEmpty() || member == null) {
			System.out.println("비번 불일치");
			model.addAttribute("what", "fail");
		}else {
			System.out.println("비번 일치");
			model.addAttribute("what", "success");
			model.addAttribute("code", code);
		}
		JSONObject jObj = new JSONObject((Map) model);
		System.out.println("return model:" + model);
		
		return jObj.toString();
	}
	/**
	 * 회원 탈퇴
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteUserInfo.do")
	@ResponseBody
	public String deleteUser(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("전달받은 파라미터: "+param);
		int delUser = dtaService.deleteUserInfo(param);
		if(delUser > 0) {
			System.out.println("삭제 완료");
			model.addAttribute("what", "success");
		}else {
			System.out.println("삭제 실패");
			model.addAttribute("what", "fail");
		}
		JSONObject jObj = new JSONObject((Map) model);
		return jObj.toString();
	}
}
