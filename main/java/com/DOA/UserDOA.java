package com.DOA;

import com.entity.User;

public interface UserDOA {
	
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public boolean CheckPassword(int id,String ps);
	
	public boolean UpdateProfile(User us);
	
	public boolean checkUser(String em);

}
