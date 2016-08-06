package org.tplatform.member.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.tplatform.member.entity.Member;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by tianyi on 16/8/6.
 */
public interface MemberMapper extends Mapper<Member> {
	@Select("select * from t_member where userName = #{userName} and status = #{status}")
	public Member findByUserName (@Param("userName") String userName, @Param("status") String status);
}
