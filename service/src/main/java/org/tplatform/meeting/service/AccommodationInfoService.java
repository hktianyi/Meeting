package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.AccommodationInfo;
import org.tplatform.meeting.mapper.AccommodationInfoMapper;

/**
 * Created by guo_x on 2016/8/14.
 */
@Service
public class AccommodationInfoService extends BaseService<AccommodationInfo> {
	@Autowired
	private AccommodationInfoMapper accommodationInfoMapper;
}
