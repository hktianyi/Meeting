package org.weixin.message.mapper;

import org.apache.ibatis.annotations.Select;
import org.weixin.message.entity.TemplateMsg;
import org.weixin.message.entity.TemplateMsgDetail;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by tianyi on 16/8/7.
 */
public interface TemplateMsgMapper extends Mapper<TemplateMsg> {

//  @Override
//  @Results(value = {
//    @Result(id = true, property = "id", column = "id", javaType = Long.class, jdbcType = JdbcType.INTEGER),
//    @Result(property = "appId", column = "appId", javaType = String.class, jdbcType = JdbcType.VARCHAR),
//    @Result(property = "templateId", column = "templateId", javaType = String.class, jdbcType = JdbcType.VARCHAR),
//    @Result(property = "name", column = "name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
//    @Result(property = "detail", column = "id", many = @Many(select = "org.weixin.message.mapper.TemplateMsgMapper.selectDetail"),
//    javaType = Set.class, jdbcType = JdbcType.JAVA_OBJECT)
//  })
//  @Select("SELECT id,appId,templateId,name FROM t_wx_template_msg")
//  List<TemplateMsg> select(TemplateMsg record);

  /**
   * 根据模板ID查询模板输入项
   * @param templateId
   * @return
   */
  @Select("SELECT zhName, `key`, color, text FROM t_wx_template_msg_detail WHERE templateId = #{0}")
//  @Results(value = {
//    @Result(id = true, property = "id", column = "id", javaType = Long.class, jdbcType = JdbcType.INTEGER),
//    @Result(property = "templateId", column = "templateId", javaType = Long.class, jdbcType = JdbcType.INTEGER),
//    @Result(property = "key", column = "key", javaType = String.class, jdbcType = JdbcType.VARCHAR),
//    @Result(property = "color", column = "color", javaType = String.class, jdbcType = JdbcType.VARCHAR),
//    @Result(property = "text", column = "text", javaType = String.class, jdbcType = JdbcType.VARCHAR)
//  })
  List<TemplateMsgDetail> selectDetail(Long templateId);
}
