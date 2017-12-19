package com.lei.model;

/**
 * 前后端交互实体模板
 * @author pibigstar
 *
 */
public class Result<T> {

	/**状态码，0为成功，其他都是失败*/
	private Integer code;
	
	private String msg;
	
	private T data;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
	
	
}
