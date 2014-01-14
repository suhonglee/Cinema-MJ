package com.kcontents.cinemadream.dao;

import java.util.List;
import java.util.Map;

import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.domain.Reply;

public interface DepositDao {
	public static String SQLNAMESPACE = "deposit.";
	
public int insertBbs(Deposit bbs);
	
	public Deposit selectBbs(int no);
	
	public int deleteBbs(int no);
	
	public int insertReply(Reply reply);
	
	public List selectReply(int bbs_no);
	
	public int deleteReply(Map map);
	
	public List selectBbsList(Map require);
	
	public int selectBbsMaxSize(Map require);
}
