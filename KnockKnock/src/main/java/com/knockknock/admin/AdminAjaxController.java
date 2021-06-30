package com.knockknock.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
@RestController
public class AdminAjaxController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/getJsonKeyword.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int getAjaxKeyword(@RequestBody AdminKeywordVO vo) {
		System.out.println("vo : " + vo);
		int check = adminService.checkKeyword(vo);
		int result = 0;
		if(check ==0) {
			result = adminService.insertKeyword(vo);
		}
		return result;
	}

//	@RequestMapping(value = "/deleteKeyword.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
//	public Map<String, Object> deleteKeyword(@RequestBody List<Map<String,String>>  params) {
//		Map<String,Object> resultMap = new HashMap<String, Object>();
//		System.out.println(params);
//		return null;
//		
//	}

	@ResponseBody
	@RequestMapping(value = "/deleteKeyword.do", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		System.out.println(chArr);
		int result = adminService.deleteKeyword(chArr);
		System.out.println(result);
		return result;
	}
	

	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        
		 String fileRoot = "/Users/hanjeongseol/git/Knock/knock/upload/"; // 외부경로로 저장을 희망할때.
		 
		
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/";
		
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
