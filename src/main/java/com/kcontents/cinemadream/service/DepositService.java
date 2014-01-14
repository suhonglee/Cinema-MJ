package com.kcontents.cinemadream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.domain.Reply;

public interface DepositService {
	
	public int insertBbs(Deposit bbs);
	
	public List selectBbsList(Map require);
	
	public int selectBbsMaxSize(Map require);
	
	public Deposit selectBbs(int no);
	
	public boolean deleteBbs(int no);
	
	public boolean insertReply(Reply reply);
	
	public List selectReply(int bbs_no);
	
	public boolean deleteReply(Map map);
}
