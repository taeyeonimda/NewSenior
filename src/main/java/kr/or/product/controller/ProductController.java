package kr.or.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.product.model.service.ProductService;
import kr.or.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/productList.do")
	public String productList(Model model) {
		ArrayList<Product> list = service.allProduct();
		System.out.println(list);
		model.addAttribute("list",list);
		return "product/productList";
	}
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "goods,activity,class form/goodsEnroll";
	}
	
}
