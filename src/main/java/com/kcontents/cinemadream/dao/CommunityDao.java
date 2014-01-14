package com.kcontents.cinemadream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Sample;

public interface CommunityDao {
	public static String SQLNAMESPACE = "community.";
	
	public int insert(Community community);
	
	public List selectList(Map require);
	
	public int delete(int no);

	public Community select(int no);

	public int update(Community community);

	public int getMaxSize(HashMap require);

	public List selectNear(Map require);
	
}
