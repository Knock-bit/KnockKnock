package com.knockknock.admin.proposal;

import java.util.List;

import com.knockknock.util.PagingVO;

public interface AdminProposalService {
	public List<AdminProposalVO> getProposalList(PagingVO pvo);
	public int countProposal();
	public AdminProposalVO getProposal(AdminProposalVO vo);
}
