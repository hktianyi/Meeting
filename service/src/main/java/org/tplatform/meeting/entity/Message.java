package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * Created by guo_x on 2016/8/7.
 */
@Data
@Table(name = "t_message")
public class Message extends BaseEntity {
	public Long userId;
	public String title;
	public String content;
}
