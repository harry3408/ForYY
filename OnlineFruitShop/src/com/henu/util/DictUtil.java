package com.henu.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.henu.dao.DictMapper;
import com.henu.model.Dict;

import net.sf.json.util.JSONUtils;

public class DictUtil {

	private static DictMapper dictMapper = (DictMapper) SpringUtil.getBean("dictMapper");

	private static final String CACHE_DICT_MAP = "dictMap";
	private static List<Dict> allDict = null;
	private static Map<String, List<Dict>> dictMap = null;

	private static void initDict() {
		if (allDict == null || dictMap == null) {
			allDict = dictMapper.getAll();

			dictMap = new HashMap<String, List<Dict>>();
			for (Dict dict : allDict) {
				if (!dictMap.containsKey(dict.getType())) {
					dictMap.put(dict.getType(), new ArrayList<Dict>());
				}
				dictMap.get(dict.getType()).add(dict);
			}
		}
	}

	public static List<Dict> getDictsByType(String type) {
		initDict();

		List<Dict> result = dictMap.get(type);
		if (result == null) {
			result = new ArrayList<Dict>();
		}
		return result;
	}
	
	public static String getDictsByTypeForJson(String type) {
		initDict();

		List<Dict> result = dictMap.get(type);
		if (result == null) {
			result = new ArrayList<Dict>();
		}
		return JSONObject.toJSONString(result);
	}

	public static String getDictValueBykeyAndType(String key, String type, String defaultValue) {
		initDict();
		
		List<Dict> dictByType = dictMap.get(type);
		for (Dict dict : dictByType) {
			if (dict.getKey().equals(key)) {
				return dict.getValue();
			}
		}
		return defaultValue;
	}
}
