package kr.or.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/productList.do")
	public String productList() {
		return "product/productList";
	}
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "goods,activity,class form/goodsEnroll";
	}
	
}
