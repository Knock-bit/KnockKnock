package com.knockknock.contactimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.contact.ContactService;
import com.knockknock.contact.ContactVO;

@Service("contactService")
public class ContactServiceImpl implements ContactService{
	@Autowired
	private ContactDAO contactDAO;

	@Override
	public void sendContact(ContactVO contactVO) {
		contactDAO.sendContact(contactVO);
	}

}
