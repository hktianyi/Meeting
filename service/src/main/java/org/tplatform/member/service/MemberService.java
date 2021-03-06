package org.tplatform.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;
import org.tplatform.member.entity.Member;
import org.tplatform.member.mapper.MemberMapper;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by tianyi on 16/8/6.
 */
@Service
public class MemberService extends BaseService<Member> {
	@Autowired
	MemberMapper memberMapper;
	public Member findByUserName (String userName){
		return memberMapper.findByUserName(userName, StatusEnum.VALID.name());
	}

	public boolean validUserName(String userName){
		Member member = new Member();
		member.setUserName(userName);
		List<Member> list = memberMapper.select(member);
		if (null != list && list.size() > 0){
			return false;
		}
		return true;
	}

	public int updateMember(Member member){
		int result = memberMapper.updateByPrimaryKeySelective(member);
		return result;
	}

	public boolean updatePwd(Long id, String userPwd) {
		int result = memberMapper.updatePwd(id, userPwd);
		if (result == 1)
			return true;
		else
			return false;
	}
}
