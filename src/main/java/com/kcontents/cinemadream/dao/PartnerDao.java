package com.kcontents.cinemadream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.dao.ConsultDao;
import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Partner;
import com.kcontents.cinemadream.domain.Sample;

public interface PartnerDao {
	public static String SQLNAMESPACE = "partner.";
	
	public int insert(Partner partner);
	
	public List selectList();
	
	public int delete(int no);
}
