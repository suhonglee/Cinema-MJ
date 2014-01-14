package com.kcontents.cinemadream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Sample;

public interface CommunityService {
	
	public boolean insert(Map map);
	
	public List selectList(Map require);
	
	public boolean delete(int no);

	public Community select(int no);

	public boolean update(Map map);

	public int getMaxSize(HashMap require);

	public List selectNear(Map require);
	
}
