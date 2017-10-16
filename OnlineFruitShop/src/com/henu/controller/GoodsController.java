package com.henu.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.henu.dao.DictMapper;
import com.henu.model.Dict;
import com.henu.model.Goods;
import com.henu.pagination.Pagination;
import com.henu.service.GoodsService;
import com.henu.service.GoodsServiceTest;
import com.henu.util.DictUtil;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private DictMapper dictMapper;
	
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	@RequestMapping("/admin/goodsManager/list")
    public String getGoods(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    		@RequestParam(value = "keyword", defaultValue = "") String keyword,
    		HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
        if (currentPage < 1) {
            currentPage = 1;
        }

        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);

        map.put("pagination", pagination);
        map.put("keyword", keyword);
        List<Goods> goodsList = goodsService.query(map);
        request.setAttribute("goodsList", goodsList);
        request.setAttribute("pagination", pagination);
        return "admin/goodsManager";
    }
	
	@RequestMapping("/admin/goodsManager/getGoods/{id}")
    public String getGoods(@PathVariable int id, HttpServletRequest request) {
		Goods goods = null;
		if (id == 0) {
			goods = new Goods();
		} else {
			goods = goodsService.getById(id);
		}
		request.setAttribute("goods", goods);
    	return "admin/goodsDetail";
    }
	
	@RequestMapping("/admin/goodsManager/editGoods")
	public String create(Goods goods){
		if (goods.getId() > 0) {
			goodsService.update(goods);
		} else {
			goodsService.create(goods);
		}
		return "redirect:list";
	}

	@RequestMapping("/index")
	public String index(){
		return "main";
	}
	
	/*
	 * For user
	 * */
	
	@RequestMapping("/goods/new")
	public @ResponseBody List<Goods> getNewSale() {
		return goodsService.getLastByLimit();
	}
	
	@RequestMapping("/goods/{category}")
	public @ResponseBody List<Goods> getGoodsByCategoryForAjax(@PathVariable String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		Pagination pagination = new Pagination();
        pagination.setCurrentPage(1);

        map.put("pagination", pagination);
        map.put("type", "category");
        map.put("keyword", category);
        List<Goods> goodsList = goodsService.query(map);
        return goodsList;
	}
	
	@RequestMapping("/goods/list/{category}")
	public String getGoodsByCategory(@PathVariable String category,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    		@RequestParam(value = "keyword", defaultValue = "") String keyword,
    		HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
        if (currentPage < 1) {
            currentPage = 1;
        }
 
        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);

        map.put("pagination", pagination);
        map.put("type", "category");
        if (category != null && !category.equals("")) {
            map.put("keyword", category);
        }
        List<Goods> goodsList = goodsService.query(map);
        request.setAttribute("goodsList", goodsList);
        request.setAttribute("pagination", pagination);
        request.setAttribute("category", category);
        return "user/goodsList";
	}
	
	@RequestMapping("/goods/detail/{id}")
	public String goodsDetail(@PathVariable int id,HttpServletRequest request) {
		Goods goods = goodsService.getById(id);
		request.setAttribute("goods", goods);
		return "user/goodsDetail";
	}

	@RequestMapping("/goods/main")
	public @ResponseBody Object getGoodsForMain() {
		
		List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();
		
		List<Dict> dicts = DictUtil.getDictsByType("category");
		for (Dict dict : dicts) {
			List<Goods> gs = goodsService.getGoodsForDescLimit(dict.getKey(), 8);
			if (!CollectionUtils.isEmpty(gs)) {
				Map<String, Object> goodsListByType = new HashMap<String, Object>();
				goodsListByType.put("category", dict.getKey());
				goodsListByType.put("categoryValue", DictUtil.getDictValueBykeyAndType(dict.getKey(), "category", "其它"));
				goodsListByType.put("data", gs);
				
				res.add(goodsListByType);
			}
		}
		
		return res;
	}
}
