package com.hyitclassnet.dao;

import com.classnet.dao.IHibernateSupportDao;
import com.hyitclassnet.entities.SignIn;

public interface SignInDao extends IHibernateSupportDao<SignIn>{
	
	public boolean duplicateSignIn(Integer stuno);
}
