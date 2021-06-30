package com.knockknock.util;

import java.util.HashMap;
import java.util.Map;

public class UtilClass {
	// 페이지 셋팅부분
	public static Map<String, String> pageSet(String nowPage, String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		Map<String, String> ncPage = new HashMap<String, String>();
		ncPage.put("nowPage", nowPage);
		ncPage.put("cntPerPage", cntPerPage);
		return ncPage;
	}
}
