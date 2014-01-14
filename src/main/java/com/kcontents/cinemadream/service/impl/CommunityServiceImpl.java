package com.kcontents.cinemadream.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kcontents.cinemadream.common.util.FileUtil;
import com.kcontents.cinemadream.common.util.NaverAPI;
import com.kcontents.cinemadream.dao.CommunityDao;
import com.kcontents.cinemadream.dao.SampleDao;
import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Sample;
import com.kcontents.cinemadream.service.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	public CommunityDao communityDao;
	private static final String COMMUNITY_PATH = "community/";
	@Override
	public boolean insert(Map map) {
		Community community = (Community) map.get("community");
		if(communityDao.insert(community)>0)
		{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("files");
			java.util.Iterator<String> fileNames = multipartRequest.getFileNames();
			boolean fileUpdate = true;
			try {
				while(fileNames.hasNext())
				{
					String fileName = fileNames.next();
					MultipartFile mFile = multipartRequest.getFile(fileName);
					FileUtil.saveImage(mFile.getInputStream(), FileUtil.TOMCAT_PATH+COMMUNITY_PATH+community.getNo()+"/"+fileName+".jpg");
				}
			} catch (IOException e) 
			{
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
			return true;
		}
		return false;
	}

	@Override
	public List selectList(Map require) {
		return communityDao.selectList(require);
	}

	@Override
	public boolean delete(int no) {
		if(communityDao.delete(no)>0)
		{
			boolean fileRemove=true;
			if(! FileUtil.removeImage(FileUtil.TOMCAT_PATH+COMMUNITY_PATH+no+"/titleImageFile.jpg"))
			{
				fileRemove = false;
			}
			if(! FileUtil.removeImage(FileUtil.TOMCAT_PATH+COMMUNITY_PATH+no+"/contentImageFile.jpg"))
			{	
				fileRemove = false;
			}
			return fileRemove;
		}
		return false;
	}

	@Override
	public Community select(int no) {
		return communityDao.select(no);
	}

	@Override
	public boolean update(Map map) {
		Community community = (Community) map.get("community");
		if(communityDao.update(community)>0)
		{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("files");
			java.util.Iterator<String> fileNames = multipartRequest.getFileNames();
			boolean fileUpdate = true;
			try {
				while(fileNames.hasNext())
				{
					String fileName = fileNames.next();
					MultipartFile mFile = multipartRequest.getFile(fileName);
					if(! FileUtil.removeImage(FileUtil.TOMCAT_PATH+COMMUNITY_PATH+community.getNo()+"/"+fileName+".jpg"))
					{
						fileUpdate = false;
					}
					if(! FileUtil.saveImage(mFile.getInputStream(), FileUtil.TOMCAT_PATH+COMMUNITY_PATH+community.getNo()+"/"+fileName+".jpg"))
					{
						fileUpdate = false;
					}
				}
			} catch (IOException e) 
			{
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
			return fileUpdate;
		}
		return false;
	}

	@Override
	public int getMaxSize(HashMap require) {
		return communityDao.getMaxSize(require);
	}

	@Override
	public List selectNear(Map require) {
		return communityDao.selectNear(require);
	}
}
