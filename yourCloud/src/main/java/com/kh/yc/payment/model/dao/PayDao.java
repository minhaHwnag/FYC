package com.kh.yc.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.yc.delivery.model.vo.Delivery;
import com.kh.yc.funding.model.vo.Funding;
import com.kh.yc.member.model.vo.Member;
import com.kh.yc.payment.model.vo.Payment;
import com.kh.yc.project.model.vo.Project;

public interface PayDao {

	void updateProjectSuccess(SqlSessionTemplate sqlSession);

	ArrayList<Member> paySuccessMember(SqlSessionTemplate sqlSession);

	ArrayList<Project> fundSuccessProject(SqlSessionTemplate sqlSession);

	ArrayList<Funding> fundingList(SqlSessionTemplate sqlSession, ArrayList<Project> fundSuccessProject);

	void insertFundingSuccess(SqlSessionTemplate sqlSession, ArrayList<Funding> fundingList);

	void insertPayment(SqlSessionTemplate sqlSession, Payment pay);

	Payment selectRePay(SqlSessionTemplate sqlSession, String merchantUid);

	void updatePayStatus(SqlSessionTemplate sqlSession, Payment pay);

	int insertFund(SqlSessionTemplate sqlSession, Funding fund);

	void insertDelivery(SqlSessionTemplate sqlSession, Delivery delivery);

	void insertDeliveryStatus(SqlSessionTemplate sqlSession, Delivery delivery);


}
