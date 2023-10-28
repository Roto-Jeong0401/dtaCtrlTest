package egovframework.example.dtaCtrl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Service;

@Service(value = "dtaService")
public class DtaService extends EgovAbstractMapper {

	/**
	 * 회원 등록
	 * @param param
	 * @return
	 */
	public int insertMember(Map<String, Object> param) {
		int regist = insert("memberSqlInsertMember", param);
		System.out.println("regist: "+ regist);
		return regist;
	}

	/**
	 * 회원 전체 목록 - 추후 삭제
	 * @return
	 */
	public List getAllMembers() {
		List memberList = selectList("memberSqlSelectMember");
		return memberList;
	}

	/**
	 * 일치 회원 전체 목록
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getFindMembers(Map<String, Object> param) {
		System.out.println(param);
		List memberList = selectList("memberSqlSelectMember", param);
		return memberList;
	}

	/**
	 * 회원 단건 조회 - 회원 로그인
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectOneMember(Map<String, Object> param) {
		Map<String, Object> member = new HashMap<String, Object>();
		member = selectOne("memberSqlSelectOneMember", param);
		System.out.println(member);
		if(member == null) {
			System.out.println("조회 결과 없음");
			member = new HashMap<String, Object>();
		}else {
			System.out.println("조회 결과 있음");
		}
		return member;
	}

	/**
	 * 회원 정보 수정
	 * @param param
	 * @return
	 */
	public int updateMemberInfo(Map<String, Object> param) {
		int updateMember = update("memberSqlUpdateMember", param);
		if(updateMember > 0) {
			System.out.println("회원정보 수정 성공");
		}else {
			System.out.println("회원정보 수정 실패");
		}
		return updateMember;
	}

	public int deleteUserInfo(Map<String, Object> param) {
		int delUser = delete("memberSqlDeleteMember", param);
		return delUser;
	}

	
}
