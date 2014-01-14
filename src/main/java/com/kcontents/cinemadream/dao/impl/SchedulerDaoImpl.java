package com.kcontents.cinemadream.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kcontents.cinemadream.dao.SchedulerDao;
import com.kcontents.cinemadream.domain.Scheduler;

@Repository
public class SchedulerDaoImpl implements SchedulerDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean post(Scheduler scheduler) {
		return sqlSession.insert(SQLNAMESPACE+"post",scheduler)>1 ? true : false;
	}

	@Override
	public List list(Map require) {
		return sqlSession.selectList(SQLNAMESPACE+"list",require);
	}

	@Override
	public Scheduler select(int no) {
		return sqlSession.selectOne(SQLNAMESPACE+"select",no);
	}

	@Override
	public boolean cancel(Map require) {
		return sqlSession.delete(SQLNAMESPACE+"cancel",require)>0? true : false;
	}
}
