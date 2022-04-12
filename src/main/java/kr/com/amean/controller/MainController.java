package kr.com.amean.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.com.amean.entity.SmartEditorVO;
import kr.com.amean.service.ExperienceSerivce;


@Controller
public class MainController {
	
	@Autowired ExperienceSerivce experienceService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "tf/home";
	}
	
	@RequestMapping("/editImageUpload")
	public String simpleImageUpload(HttpServletRequest req, SmartEditorVO smartEditorVO) throws UnsupportedEncodingException {
		String file_result = "";
		String result = "";
		String callback = smartEditorVO.getCallback();
		String callback_func = smartEditorVO.getCallback();
		MultipartFile multipartFile = smartEditorVO.getFileData();

		try {
			if(multipartFile != null && multipartFile.getSize() > 0 && StringUtils.isNotBlank(multipartFile.getName())) {
				if(multipartFile.getContentType().toLowerCase().startsWith("image/")) {
					String orginalName = multipartFile.getName();
					String uploadPath = req.getServletContext().getRealPath("/img");
					String path = uploadPath + "/smartEdit";
					File file = new File(path);
					if(!file.exists()) {
						file.mkdirs();
					}
					String fileName = UUID.randomUUID().toString();
					smartEditorVO.getFileData().transferTo(new File(path + fileName));
					file_result += "&bNewLine=true&sFileName=" + orginalName + "&sFileURL=/img/smartedit" + fileName;
				} else {
					file_result += "&errstr=error";
				}
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		result += "redirect:" + callback + "?callback_func=" + URLEncoder.encode(callback_func, "UTF-8") + file_result;
		

		return result;
	}

	@RequestMapping("/editMultiImageUpload")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){ 
		try {
			System.out.println("into editMultiImageUpload"); 
			//파일정보 
			String sFileInfo = ""; //파일명을 받는다 - 일반 원본파일명 
			String filename = request.getHeader("file-name"); //파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1); //확장자를소문자로 변경 
			filename_ext = filename_ext.toLowerCase(); //이미지 검증 배열변수 
			String[] allow_file = {"jpg","png","bmp","gif"}; //돌리면서 확장자가 이미지인지 
			int cnt = 0; 

			 for(int i=0; i<allow_file.length; i++) { 
				if(filename_ext.equals(allow_file[i])){ 
					cnt++; 
				} 
			} //이미지가 아님 
			if(cnt == 0) { 
				PrintWriter print = response.getWriter(); 
				print.print("NOTALLOW_"+filename); 
				print.flush(); 
				print.close(); 
			} else { //이미지이므로 신규 파일로 디렉토리 설정 및 업로드 
					//파일 기본경로 
				String dftFilePath = request.getSession().getServletContext().getRealPath("/"); //파일 기본경로 _ 상세경로 
				String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator; 
				System.out.println(filePath);
				File file = new File(filePath); 
					
				if(!file.exists()) { 
					file.mkdirs(); 
				} 

				String realFileNm = ""; 
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
				String today= formatter.format(new java.util.Date()); 
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf(".")); 
				String rlFileNm = filePath + realFileNm; 
					
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream is = request.getInputStream(); 
				OutputStream os=new FileOutputStream(rlFileNm); 
				int numRead; 
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))]; 

				while((numRead = is.read(b,0,b.length)) != -1){ 
					os.write(b,0,numRead); 
				} 
					
				if(is != null) { 
					is.close(); 
				} 
				os.flush(); 
				os.close(); 
					
				///////////////// 서버에 파일쓰기 ///////////////// // 정보 출력 
				sFileInfo += "&bNewLine=true"; // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
				sFileInfo += "&sFileName="+ filename;
				sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm; 
				PrintWriter print = response.getWriter(); 
				print.print(sFileInfo); 
				print.flush(); 
				print.close(); 
			} 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
	}


	
}
