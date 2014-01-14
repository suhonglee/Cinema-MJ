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
import com.kcontents.cinemadream.dao.PartnerDao;
import com.kcontents.cinemadream.domain.Partner;
import com.kcontents.cinemadream.service.PartnerService;

@Service
public class PartnerServiceImpl implements PartnerService{
	@Autowired
	public PartnerDao partnerDao;
	private static final String PARTNER_PATH = "partner/";
	@Override
	public boolean insert(Map map) {
		Partner partner = (Partner) map.get("partner");
		if(partnerDao.insert(partner)>0)
		{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("files");
			java.util.Iterator<String> fileNames = multipartRequest.getFileNames();
			boolean fileUpdate = true;
			try {
				while(fileNames.hasNext())
				{
					String fileName = fileNames.next();
					MultipartFile mFile = multipartRequest.getFile(fileName);
					FileUtil.saveImage(mFile.getInputStream(), FileUtil.TOMCAT_PATH+PARTNER_PATH+partner.getNo()+"/imageFile.jpg");
					FileUtil.saveThumbnail(FileUtil.TOMCAT_PATH+PARTNER_PATH+partner.getNo()+"/imageFile.jpg", FileUtil.TOMCAT_PATH+PARTNER_PATH+partner.getNo()+"/thumb_imageFile.jpg");
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
	public List selectList() {
		return partnerDao.selectList();
	}

	@Override
	public boolean delete(int no) {
		if(partnerDao.delete(no)>0)
		{
			return FileUtil.removeImage(FileUtil.TOMCAT_PATH+PARTNER_PATH+no+"/imageFile.jpg");
		}
		return false;
	}
}
