package com.kh.yc.member.model.dao;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.yc.member.model.vo.Member;

public interface MemberDao {
	

	Member loginMember(SqlSessionTemplate sqlSession, Member m) throws LoginException;

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int insertBoard(SqlSessionTemplate sqlSession);

	void GetKey(String user_id, String key);

	int countId(SqlSessionTemplate sqlSession, String userId);
	/*
	 * String countId(SqlSessionTemplate sqlSession, Member m);
	 */

	int CheckDuplication(SqlSessionTemplate sqlSession,String inputId);
}
