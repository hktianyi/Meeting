package org.tplatform.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;
import org.tplatform.member.entity.Member;
import org.tplatform.member.mapper.MemberMapper;

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
}
