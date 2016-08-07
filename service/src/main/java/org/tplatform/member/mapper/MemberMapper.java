package org.tplatform.member.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.tplatform.member.entity.Member;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by tianyi on 16/8/6.
 */
public interface MemberMapper extends Mapper<Member> {
	@Select("select * from t_member where userName = #{userName} and status = #{status}")
	public Member findByUserName (@Param("userName") String userName, @Param("status") String status);

	@Update("update t_member set userPwd = #{userPwd} where id = #{id}")
	int updatePwd(@Param("id") Long id,@Param("userPwd") String userPwd);
}
