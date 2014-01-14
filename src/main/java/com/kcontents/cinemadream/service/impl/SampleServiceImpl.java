package com.kcontents.cinemadream.service.impl;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kcontents.cinemadream.common.util.FileUtil;
import com.kcontents.cinemadream.dao.SampleDao;
import com.kcontents.cinemadream.domain.Sample;
import com.kcontents.cinemadream.service.SampleService;



@Service
public class SampleServiceImpl implements SampleService{
	@Autowired
	public SampleDao sampleDao;

	private static final String SAMPLE_PATH = "sample/";
	
	public String thumbnailUrl(Sample bbs)
	{
		String url="http://vimeo.com/api/v2/video/"+bbs.getVideoId()+".json";
		InputStream is=null;
		try
		{
			HttpGet get = new HttpGet(url);
			is = new DefaultHttpClient()
												.execute(get)
												.getEntity()
												.getContent();
			int result;
			StringBuilder builder = new StringBuilder();
			while((result = is.read()) != -1)
			{
				builder.append((char)result);
			}
			if(is!=null) is.close();
			String thumbUrl = "http://www.tripclocker.com/images/default-no-image.png";
			if(builder.toString().startsWith("["))
			{
				JSONArray arr = new JSONArray(builder.toString());
				JSONObject obj = (JSONObject) arr.get(0);
				thumbUrl = obj.getString("thumbnail_large");
			}
			return thumbUrl;
		}catch(Exception e)
		{
			
		}
		return "http://www.tripclocker.com/images/default-no-image.png";
	}
	
	@Override
	public boolean insertBbs(Sample sample) {
		if(sampleDao.insertBbs(sample)>0)
		{
			sample.setThumbnailUrl(thumbnailUrl(sample));
			return sampleDao.updateBbs(sample) > 0 ? true : false;
		}
		return false;
	}

	@Override
	public List selectBbsList() {
		return sampleDao.selectBbsList();
	}

	@Override
	public Sample selectBbs(int no) {
		return sampleDao.selectBbs(no);
	}
	
	public boolean postHit(int no) {
		return sampleDao.postHit(no)>0?true : false;
	}
	@Override
	public boolean deleteBbs(int no) {
		return sampleDao.deleteBbs(no) > 0 ? true : false;
	}

	@Override
	public boolean updateBbs(Sample sample) {
		sample.setThumbnailUrl(thumbnailUrl(sample));
		return sampleDao.updateBbs(sample) > 0? true : false;
	}

	@Override
	public List selectNear(Map require) {
		return sampleDao.selectNear(require);
	}
}
