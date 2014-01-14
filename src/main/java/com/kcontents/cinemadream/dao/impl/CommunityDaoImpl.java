package com.kcontents.cinemadream.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kcontents.cinemadream.dao.CommunityDao;
import com.kcontents.cinemadream.domain.Community;



@Repository
public class CommunityDaoImpl implements CommunityDao{
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(Community community)
	{
		return sqlSession.insert(SQLNAMESPACE+"insert", community);
	}
	
	public List selectList(Map require)
	{
		return sqlSession.selectList(SQLNAMESPACE+"selectList",require);
	}
	
	public int delete(int no)
	{
		return sqlSession.delete(SQLNAMESPACE+"delete", no);
	}

	@Override
	public Community select(int no) {
		return sqlSession.selectOne(SQLNAMESPACE+"select", no);
	}

	@Override
	public int update(Community community) {
		return sqlSession.update(SQLNAMESPACE+"update", community);
	}

	@Override
	public int getMaxSize(HashMap require) {
		Object obj = sqlSession.selectOne(SQLNAMESPACE+"getMaxSize", require);
		if(obj!=null) return (Integer)obj;
		return 0;
	}

	@Override
	public List selectNear(Map require) {
		return sqlSession.selectList(SQLNAMESPACE+"selectNear",require);
	}
}
