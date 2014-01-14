package com.kcontents.cinemadream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Reply;

public interface ConsultService {
	
	public int insertBbs(Consult bbs);
	
	public List selectBbsList(Map require);
	
	public int selectBbsMaxSize(Map require);
	
	public Consult selectBbs(int no);
	
	public boolean deleteBbs(int no);
	
	public boolean insertReply(Reply reply);
	
	public List selectReply(int bbs_no);
	
	public boolean deleteReply(Map map);
}
