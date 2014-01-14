package com.kcontents.cinemadream.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Reply;



@Repository
public class ConsultDaoImpl implements ConsultDao{
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBbs(Consult bbs)
	{
		return sqlSession.insert(SQLNAMESPACE+"insertBbs", bbs);
	}
	
	public Consult selectBbs(int no)
	{
		return sqlSession.selectOne(SQLNAMESPACE+"selectBbs", no);
	}
	
	public int deleteBbs(int no)
	{
		return sqlSession.delete(SQLNAMESPACE+"deleteBbs", no);
	}
	
	public int insertReply(Reply reply)
	{
		return sqlSession.insert(SQLNAMESPACE+"insertReply", reply);
	}
	
	public List selectReply(int bbs_no)
	{
		return sqlSession.selectList(SQLNAMESPACE+"selectReply",bbs_no);
	}
	
	public int deleteReply(Map map)
	{
		return sqlSession.delete(SQLNAMESPACE+"deleteReply", map);
	}

	@Override
	public List selectBbsList(Map require) {
		return sqlSession.selectList(SQLNAMESPACE+"selectBbsList", require);
	}

	@Override
	public int selectBbsMaxSize(Map require) {
		Object obj = sqlSession.selectOne(SQLNAMESPACE+"selectBbsMaxSize", require);
		if(obj!=null) return (Integer)obj;
		return 0;
	}

}
