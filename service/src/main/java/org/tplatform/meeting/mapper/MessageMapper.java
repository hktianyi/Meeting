package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.meeting.entity.Message;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by guo_x on 2016/8/7.
 */
public interface MessageMapper extends Mapper<Message> {

  @Update("UPDATE t_message SET `status` = #{status} WHERE id = #{id}")
  int updateStatus(@Param("id") Long id, @Param("status") StatusEnum status);
}
