package kr.or.nsClass.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nsClass.model.dao.NsClassDao;

@Service
public class NsClassService {
	@Autowired
	private NsClassDao dao;
}
