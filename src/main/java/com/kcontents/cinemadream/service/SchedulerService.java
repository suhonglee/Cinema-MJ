package com.kcontents.cinemadream.service;

import java.util.List;
import java.util.Map;

import com.kcontents.cinemadream.domain.Scheduler;

public interface SchedulerService {
	public boolean post(Scheduler scheduler);
	public Scheduler select(int no);
	public List list(Map require);
	public boolean cancel(Map require);
}
