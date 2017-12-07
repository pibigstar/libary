package com.lei.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 加密工具类
 * @author pibigstar
 *
 */
public class EncryptUtil {
	
	/**
	 * Base64加密
	 * @param str
	 * @return
	 */
	public static String encBase64(String str) {
		return Base64.encodeToString(str.getBytes());
	}
	
	/**
	 * Base64解密
	 * @param str
	 * @return
	 */
	public static String decBase64(String str) {
		return Base64.decodeToString(str);
	}
	/**
	 * Md5加密
	 * @param str
	 * @return
	 */
	public static String md5(String str) {
		return new Md5Hash(str,"pibigstar").toString();
	}

}
