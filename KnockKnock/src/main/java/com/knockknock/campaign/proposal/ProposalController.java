package com.knockknock.campaign.proposal;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProposalController {
	
	private String uploadPath = "C:/knock2/temp/";
	
	@Autowired
	private ProposalService proposalService;
	
	
	@GetMapping("/campaign/proposal.do")
	public String proposal (ProposalVO proposal) {
		System.out.println("Proposal Contoreller > proposal 실행");
		return "campaign/proposal/proposal";
	}
	
	@PostMapping("/campaign/proposal/submit.do")
	public String proposalSubmit (ProposalVO proposal, MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("Proposal Contoreller > submit.do 실행");
		
		if (file.isEmpty()) {
			
		} else {
			// 저장경로 지정
			String fileName = file.getOriginalFilename();
			String onlyFileName = fileName.substring(0, fileName.indexOf("."));
			String extension = fileName.substring(fileName.indexOf("."));
			String filePath = null;
			int count = 0;
			
	 		// 중복 파일명 확인
			while(true) {
				if(count == 0) {
					filePath = onlyFileName + extension;
				} else { 
					filePath = onlyFileName + "(" + count + ")" + extension;
				}
				System.out.println("파일 생성 ! ");
				File checkFile = new File(uploadPath + filePath);
				System.out.println("파일명 :" + filePath);
				if(!checkFile.exists()) {
					System.out.println("if문 안");
					break;
				}
				System.out.println("if문 지나오나?");
				count ++;
			}
			file.transferTo(new File(uploadPath + filePath));
			proposal.setCpFile(filePath + fileName);
		}
		
		int result = proposalService.insertProposal(proposal);
		System.out.println(result + "건 제안서 제출. ");
		return "main/main";
	}

}
