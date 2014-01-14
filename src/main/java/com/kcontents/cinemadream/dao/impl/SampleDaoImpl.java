package com.kcontents.cinemadream.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kcontents.cinemadream.dao.SampleDao;
import com.kcontents.cinemadream.domain.Sample;



@Repository
public class SampleDaoImpl implements SampleDao{
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBbs(Sample bbs)
	{
		return sqlSession.insert(SQLNAMESPACE+"insertBbs", bbs);
	}
	
	public List selectBbsList()
	{
		return sqlSession.selectList(SQLNAMESPACE+"selectBbsList");
	}
	
	public int deleteBbs(int no)
	{
		return sqlSession.delete(SQLNAMESPACE+"deleteBbs", no);
	}

	@Override
	public Sample selectBbs(int no) {
		return sqlSession.selectOne(SQLNAMESPACE+"selectBbs", no);
	}

	@Override
	public int updateBbs(Sample sample) {
		return sqlSession.update(SQLNAMESPACE+"updateBbs", sample);
	}

	@Override
	public List selectNear(Map require) {
		return sqlSession.selectList(SQLNAMESPACE+"selectNear", require);
	}

	@Override
	public int postHit(int no) {
		return sqlSession.update(SQLNAMESPACE+"postHit", no);
	}

}
