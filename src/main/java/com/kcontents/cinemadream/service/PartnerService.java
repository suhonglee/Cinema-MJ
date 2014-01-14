package com.kcontents.cinemadream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Partner;
import com.kcontents.cinemadream.domain.Reply;

public interface PartnerService {
	
	public boolean insert(Map map);
	
	public List selectList();
	
	public boolean delete(int no);
}
