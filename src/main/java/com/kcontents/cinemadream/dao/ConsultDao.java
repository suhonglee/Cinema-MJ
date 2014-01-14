package com.kcontents.cinemadream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Reply;

public interface ConsultDao {
	public static String SQLNAMESPACE = "consult.";
	
	public int insertBbs(Consult bbs);
	
	public Consult selectBbs(int no);
	
	public int deleteBbs(int no);
	
	public int insertReply(Reply reply);
	
	public List selectReply(int bbs_no);
	
	public int deleteReply(Map map);
	
	public List selectBbsList(Map require);
	
	public int selectBbsMaxSize(Map require);
}
