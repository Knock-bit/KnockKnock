package com.knockknock.campaign.ing.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.ing.CampaignUserVO;

@Repository
public class CampaignUserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CampaignUserVO> selectAllCampaignUsers(int ciIdx){
		System.out.println("ciIdx:" + ciIdx);
		System.out.println("CampaignUserDAO - selectAllCampaignUsers 실행");
		return mybatis.selectList("campaign.selectAllCampaignUsers", ciIdx);
	}
}
