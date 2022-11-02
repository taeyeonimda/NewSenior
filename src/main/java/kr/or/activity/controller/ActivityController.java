package kr.or.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.activity.model.service.ActivityService;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService service;
}
