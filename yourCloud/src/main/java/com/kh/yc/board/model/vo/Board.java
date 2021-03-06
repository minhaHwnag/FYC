package com.kh.yc.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Board implements Serializable {
	private int bNo;
	private String bTitle;
	private String writer;
	private int bCount;
	private String open;
	private String status;
	private String bCategory;
	private String refBNo;
	private Date createDate;
	private String bcontent;
	private String companyName;
	private String pTitle;
	private ArrayList<Comment> commentList;
	private String newFileName;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int bNo, String bTitle, String writer, int bCount, String open, String status, String bCategory,
			String refBNo, Date createDate, String bcontent, String companyName, String pTitle,
			ArrayList<Comment> commentList, String newFileName) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.writer = writer;
		this.bCount = bCount;
		this.open = open;
		this.status = status;
		this.bCategory = bCategory;
		this.refBNo = refBNo;
		this.createDate = createDate;
		this.bcontent = bcontent;
		this.companyName = companyName;
		this.pTitle = pTitle;
		this.commentList = commentList;
		this.newFileName = newFileName;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getRefBNo() {
		return refBNo;
	}

	public void setRefBNo(String refBNo) {
		this.refBNo = refBNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public ArrayList<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(ArrayList<Comment> commentList) {
		this.commentList = commentList;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", writer=" + writer + ", bCount=" + bCount + ", open="
				+ open + ", status=" + status + ", bCategory=" + bCategory + ", refBNo=" + refBNo + ", createDate="
				+ createDate + ", bcontent=" + bcontent + ", companyName=" + companyName + ", pTitle=" + pTitle
				+ ", commentList=" + commentList + ", newFileName=" + newFileName + "]";
	}

	


}
