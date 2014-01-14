package com.kcontents.cinemadream.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.SchedulerDao;
import com.kcontents.cinemadream.domain.Scheduler;
import com.kcontents.cinemadream.service.SchedulerService;

@Service
public class SchedulerServiceImpl implements SchedulerService{
	@Autowired
	private SchedulerDao schedulerDao;
	
	@Override
	public boolean post(Scheduler scheduler) {
		return schedulerDao.post(scheduler);
	}

	@Override
	public List list(Map require) {
		return schedulerDao.list(require);
	}

	@Override
	public Scheduler select(int no) {
		return schedulerDao.select(no);
	}

	@Override
	public boolean cancel(Map require) {
		// TODO Auto-generated method stub
		return schedulerDao.cancel(require);
	}

}
