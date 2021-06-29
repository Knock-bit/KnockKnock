package com.knockknock.contactimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.contact.ContactVO;

@Repository
public class ContactDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//contact글 전송
	public void sendContact(ContactVO contactVO) {
		System.out.println("DAO");
		mybatis.insert("contact.sendContact", contactVO);
	}
}
