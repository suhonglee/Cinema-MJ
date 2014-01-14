package com.kcontents.cinemadream.dao;

import java.util.List;
import java.util.Map;

import com.kcontents.cinemadream.domain.Scheduler;

public interface SchedulerDao {
	public static String SQLNAMESPACE = "scheduler.";
	
	public boolean post(Scheduler scheduler);

	public List list(Map require);
	
	public Scheduler select(int no);

	public boolean cancel(Map require);
}
