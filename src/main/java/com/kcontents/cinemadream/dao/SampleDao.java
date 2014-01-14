package com.kcontents.cinemadream.dao;

import java.util.List;
import java.util.Map;

import com.kcontents.cinemadream.domain.Sample;

public interface SampleDao {
	public static String SQLNAMESPACE = "sample.";
	
	public int insertBbs(Sample bbs);
	
	public List selectBbsList();
	
	public int deleteBbs(int no);

	public Sample selectBbs(int no);

	public int updateBbs(Sample sample);
	
	public List selectNear(Map require);

	public int postHit(int no);
}
