package com.knockknock.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteKeyword.do", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		System.out.println(chArr);
		int result = adminService.deleteKeyword(chArr);
		System.out.println(result);
		return result;
	}
}
