package com.kcontents.cinemadream.common.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kcontents.cinemadream.Translater;

public class FileUtil {
//	public static final String TOMCAT_PATH = "C:/Users/a/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/CinemaDream/resources/images/";
//	public static final String TOMCAT_PATH = "C:/Users/slbi/EEworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/CinemaDream/resources/images/";
	public static final String TOMCAT_PATH = "/usr/share/tomcat6/CinemaDream/webapps/ROOT/resources/images/";
	public static boolean saveThumbnail(String fileName, String thumbName)
	{
		try {
			BufferedImage image = ImageIO.read(new File(fileName));
			BufferedImage thumb = new BufferedImage(220, 220, BufferedImage.TYPE_INT_RGB);
			
			Graphics2D g2d = (Graphics2D) thumb.getGraphics();
			g2d.drawImage(image
					, 0
					, 0
					, thumb.getWidth() -1
					, thumb.getHeight() -1
					, 0
					, 0
					, image.getWidth() -1
					, image.getHeight() -1
					, null);
			g2d.dispose();
			return ImageIO.write(thumb, "jpg", new File(thumbName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean saveImage(InputStream is, String fileName)
	{
		File file = new File(fileName);
		int result;
		FileOutputStream fos=null;
		try {
			if(! file.exists()) //경로상에 파일이 존재하지 않을 경우
			{
				if(file.getParentFile().mkdirs()) //경로에 해당하는 디렉토리들을 생성
				{
					file.createNewFile(); //이후 파일 생성
				}
			}
			fos = new FileOutputStream(file);
			while((result = is.read()) != -1)
			{
				fos.write(result);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return false;
		} finally
		{
			try {
				if(is!=null)	is.close();
				if(fos!=null) fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return true;
	}

	public static boolean removeImage(String fileName) {
		File file = new File(fileName);
		if(file.exists())
		{
			return file.delete();
		}
		return true;
	}
}
