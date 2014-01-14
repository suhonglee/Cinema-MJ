package com.kcontents.cinemadream.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kcontents.cinemadream.dao.CommunityDao;
import com.kcontents.cinemadream.dao.PartnerDao;
import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Partner;



@Repository
public class PartnerDaoImpl implements PartnerDao{
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(Partner partner)
	{
		return sqlSession.insert(SQLNAMESPACE+"insert", partner);
	}
	
	public List selectList()
	{
		return sqlSession.selectList(SQLNAMESPACE+"selectList");
	}
	
	public int delete(int no)
	{
		return sqlSession.delete(SQLNAMESPACE+"delete", no);
	}
}
