package com.kcontents.cinemadream.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.DepositDao;
import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.domain.Reply;
import com.kcontents.cinemadream.service.DepositService;



@Service
public class DepositServiceImpl implements DepositService{
	@Autowired
	public DepositDao bbsDao;
	
	public int insertBbs(Deposit bbs)
	{
		return bbsDao.insertBbs(bbs);
	}
	
	public Deposit selectBbs(int no)
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
