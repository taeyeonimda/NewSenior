package kr.or.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.product.model.service.ProductService;
import kr.or.product.model.vo.Product;
import kr.or.product.model.vo.ProductPageData;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/productList.do")
	public String productList(Model model,int reqPage) {
		ProductPageData	ppd = service.allProduct(reqPage);

		model.addAttribute("list",ppd.getList());
		model.addAttribute("pageNavi",ppd.getPageNavi());
		return "product/productList";
	}
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "goods,activity,class form/goodsEnroll";
	}
	
}
