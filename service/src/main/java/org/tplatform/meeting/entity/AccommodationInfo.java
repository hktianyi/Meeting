package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * Created by guo_x on 2016/8/14.
 */
@Data
@Table(name = "t_accommodationInfo")
public class AccommodationInfo extends BaseEntity {
	private String stayDate;
	private String leaveDate;
	private String dinner1;
	private String dinner2;
	private String dinner3;
	private String meetingId;
}
