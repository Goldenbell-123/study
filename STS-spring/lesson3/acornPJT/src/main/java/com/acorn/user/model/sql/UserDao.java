package com.acorn.user.model.sql;

import com.acorn.model.vo.LoginDTO;
import com.acorn.model.vo.UserVO;

public interface UserDao {

	public UserVO loginRow(LoginDTO obj);
}
