package com.kcontents.cinemadream.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Reply;
import com.kcontents.cinemadream.service.ConsultService;



@Service
public class ConsultServiceImpl implements ConsultService{
	@Autowired
	public ConsultDao bbsDao;
	
	public int insertBbs(Consult bbs)
	{
		return bbsDao.insertBbs(bbs);
	}
	
	public Consult selectBbs(int no)
	{
		return bbsDao.selectBbs(no);
	}
	
	public boolean deleteBbs(int no)
	{
		return bbsDao.deleteBbs(no) == 1 ? true : false;
	}
	
	public boolean insertReply(Reply reply)
	{
		return bbsDao.insertReply(reply)== 1 ? true : false;
	}
	
	public List selectReply(int bbs_no)
	{
		return bbsDao.selectReply(bbs_no);
	}
	
	public boolean deleteReply(Map map)
	{
		return bbsDao.deleteReply(map) == 1 ? true : false;
	}

	@Override
	public List selectBbsList(Map require) {
		return bbsDao.selectBbsList(require);
	}

	@Override
	public int selectBbsMaxSize(Map require) {
		return bbsDao.selectBbsMaxSize(require);
	}
}
