package com.koreait.nearby.domain;

import java.sql.Date;

public class Board {

	private Long bNo, likes;
	private String id, content, origin, saved, path;
	private Date created, modified;
	private int state;
	
	public Board() {

	}

	public Board(Long bNo, Long likes, String id, String content, String origin, String saved, String path,
			Date created, Date modified, int state) {
		super();
		this.bNo = bNo;
		this.likes = likes;
		this.id = id;
		this.content = content;
		this.origin = origin;
		this.saved = saved;
		this.path = path;
		this.created = created;
		this.modified = modified;
		this.state = state;
	}

	// getter&setter
	public Long getbNo() {
		return bNo;
	}

	public void setbNo(Long bNo) {
		this.bNo = bNo;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getSaved() {
		return saved;
	}

	public void setSaved(String saved) {
		this.saved = saved;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", likes=" + likes + ", id=" + id + ", content=" + content + ", origin=" + origin
				+ ", saved=" + saved + ", path=" + path + ", created=" + created + ", modified=" + modified + ", state="
				+ state + "]";
	}
	
	
	
	
}
