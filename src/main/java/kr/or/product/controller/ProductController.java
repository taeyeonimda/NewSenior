package kr.or.product.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.ProductFileRename;
import kr.or.product.model.service.ProductService;
import kr.or.product.model.vo.Product;
import kr.or.product.model.vo.ProductFileVO;
import kr.or.product.model.vo.ProductPageData;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private ProductFileRename fileRename;
	
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
	
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(Product p, MultipartFile[] productFile, HttpServletRequest request) {
		ArrayList<ProductFileVO> fileList = new ArrayList<ProductFileVO>();
		if(!productFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
			for(MultipartFile file : productFile) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.productFileRename(savePath, filename);    
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ProductFileVO pFile = new ProductFileVO();
				pFile.setFileName(filename);
				pFile.setFilePath(filepath);
				fileList.add(pFile);
			}
		}
		p.setProductFileVO(fileList);
		int result = service.insertProduct(p);
		if(result > 0) {
			return "redirect:/productList.do?reqPage=1";
		}
		return"redirect:/";
	}
	//summerNote
	@ResponseBody
	@RequestMapping(value = "/uploadImage.do")
	public String productUploadImage() {
		
		return "";
	}
	
	@RequestMapping(value = "/productView.do")
	public String productView(int productNo, Model model) {
		Product p = service.productView(productNo);
		model.addAttribute("p",p);
		return "product/productView";
	}
}
