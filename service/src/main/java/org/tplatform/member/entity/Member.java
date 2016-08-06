package org.tplatform.member.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * Created by tianyi on 16/8/6.
 */
@Data
@Table(name = "t_member")
public class Member extends BaseEntity {
}
