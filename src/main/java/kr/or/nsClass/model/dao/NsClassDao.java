package kr.or.nsClass.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NsClassDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
