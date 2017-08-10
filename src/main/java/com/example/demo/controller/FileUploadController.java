package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller 
public class FileUploadController {

 	@RequestMapping(value = "/initupload", method = RequestMethod.GET)
	public String upload() {
		return "repair";  //通过此方法跳转到repair.ftl页面
		
	}
}