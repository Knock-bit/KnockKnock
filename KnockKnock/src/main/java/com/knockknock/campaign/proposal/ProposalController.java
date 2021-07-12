package com.knockknock.campaign.proposal;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

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
	public String proposalSubmit (ProposalVO proposal, @RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
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
			proposal.setCpFile(filePath);
		}
		
		int result = proposalService.insertProposal(proposal);
		System.out.println(result + "건 제안서 제출. ");
		return "campaign/proposal/pResult";
	}
	
	
	@PostMapping("/proposalSummer.do")
	public String ttest(ProposalVO proposal, MultipartFile file) throws IllegalStateException, IOException {
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
			proposal.setCpFile(filePath);
		}
		
		int result = proposalService.insertProposal(proposal);
		return "campaign/proposal/pResult";
	}
	
	
	/*
	 * @GetMapping("/vewSummer.do") public String tt(Model model) { ProposalVO svo =
	 * adminService.selectSummer(); model.addAttribute("summer",svo);
	 * System.out.println(svo); return "/summernoteTest/summernoteDetail"; }
	 */

	@RequestMapping(value="/uploadProposalSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();

        
		 String fileRoot = "C:/knock2/summer/"; // 외부경로로 저장을 희망할때.
		 
		
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/";
		 
		// 내부경로 저장 -> 혜민누나버전 
//		String savePath = request.getSession().getServletContext().getRealPath("/resource/img/upload/");

		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/img/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("fileName", savedFileName);
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}
	
	

}
