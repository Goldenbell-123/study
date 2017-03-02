package com.acorn.user.service;

import com.acorn.model.vo.LoginDTO;
import com.acorn.model.vo.UserVO;


public interface UserService {

	public UserVO login(LoginDTO obj);
}
