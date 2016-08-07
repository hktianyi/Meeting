package org.tplatform.member.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by tianyi on 16/8/6.
 */
@Data
@Table(name = "t_member")
public class Member extends BaseEntity {

	/**
	 * 用户名
	 */
	public String userName;

	/**
	 * 密码
	 */
	public String userPwd;

	/**
	 * 真实姓名
	 */
	public String realName;

	/**
	 * 手机号
	 */
	public String mobile;

	/**
	 * 邮箱
	 */
	public String email;

	/**
	 * 性别
	 */
	private String gender;
	/**
	 * 省
	 */
	private String province;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 详细地址
	 */
	private String address;

}
