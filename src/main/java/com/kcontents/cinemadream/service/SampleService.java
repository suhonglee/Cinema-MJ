package com.kcontents.cinemadream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Sample;

public interface SampleService {
	
	public boolean insertBbs(Sample bbs);
	
	public List selectBbsList();
	
	public boolean deleteBbs(int no);

	public Sample selectBbs(int no);

	public boolean postHit(int no);
	
	public boolean updateBbs(Sample sample);

	public List selectNear(Map require);
	
}
