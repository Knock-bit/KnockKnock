package com.knockknock.admin.proposal.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;

@Repository
public class AdminProposalDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminProposalVO> getProposalList(PagingVO pvo){
		return mybatis.selectList("Util.getProposalList",pvo);
	}
	
	public int countProposal() {
		return mybatis.selectOne("Util.countProposal");
	}
	
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return mybatis.selectOne("AdminDAO.getProposal",vo);
	}
}
