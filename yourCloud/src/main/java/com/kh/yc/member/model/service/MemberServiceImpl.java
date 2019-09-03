package com.kh.yc.member.model.service;

import java.io.File;
import java.util.Random;


import javax.security.auth.login.LoginException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yc.member.model.dao.MemberDao;
import com.kh.yc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	/*
	 * @Autowired private JavaMailSender javaMailSender;
	 */
	/*
	 * @Autowired private JavaMailSender mailSender;
	 */
	@Override
	public Member loginMember(Member m) throws LoginException {
		
		Member loginUser = null;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
			throw new LoginException("로그인 실패!");
		}else {
			loginUser = md.selectMember(sqlSession, m);
		}
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member m) {
		
		return md.insertMember(sqlSession, m);
	}

	public int idcheck(String userId) {
		return md.countId(sqlSession, userId);
	}

	public int CheckDuplication(String inputId) {

		int idCnt = md.CheckDuplication(sqlSession,inputId);
		return idCnt;
	}
	
	
	

 

}
