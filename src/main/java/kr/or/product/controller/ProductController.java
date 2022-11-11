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

import com.google.gson.Gson;

import common.ProductFileRename;
import kr.or.cart.model.vo.Cart;
import kr.or.product.model.service.ProductService;
import kr.or.product.model.vo.Product;
import kr.or.product.model.vo.ProductFileVO;
import kr.or.product.model.vo.ProductPageData;
import kr.or.product.model.vo.ProductReview;

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
	
	@RequestMapping(value = "/adminProductList.do")
	public String adminProductList(Model model, int reqPage) {
		ProductPageData	ppd = service.adminProduct(reqPage);
		model.addAttribute("list",ppd.getList());
		model.addAttribute("pageNavi",ppd.getPageNavi());
		return "product/adminProductList";
	}
	
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "goods,activity,class form/goodsEnroll";
	}
	
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(Product p, MultipartFile[] productFile, HttpServletRequest request) {
		ArrayList<ProductFileVO> fileList = new ArrayList<ProductFileVO>();
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
			//input이 3개면 각각 조건을 비교해야함
			for(MultipartFile file : productFile) {
				if(!file.isEmpty()) {
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
	
	@RequestMapping(value = "/productView.do")
	public String productView(int productNo, Model model) {
		Product p = service.productView(productNo);
		int result = service.productReviewCount(productNo);
		model.addAttribute("p",p);
		return "product/productView";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/productReviewList.do",produces = "application/json;charset=utf-8")
	public String productReviewList(int productNo) {
		ArrayList<ProductReview> pr = service.productReviewList(productNo);
		Gson gson = new Gson();
		String result = gson.toJson(pr);
		return result;
	}
	
	
	@RequestMapping(value = "/deleteProduct.do")
	public String deleteProduct(int productNo, HttpServletRequest request) {
		ArrayList<ProductFileVO> list = service.deleteProduct(productNo);
		if(list != null) {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
			for(ProductFileVO file : list) {
				File delFile = new File(path+file.getFilePath());
				delFile.delete();
			}
		}
		return "redirect:/productList.do?reqPage=1";
	}
	
	@RequestMapping(value = "/adminDeleteProduct.do")
	public String adminDeleteProduct(int productNo, HttpServletRequest request) {
		ArrayList<ProductFileVO> list = service.deleteProduct(productNo);
		if(list != null) {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
			for(ProductFileVO file : list) {
				File delFile = new File(path+file.getFilePath());
				delFile.delete();
			}
		}
		return "redirect:/adminProductList.do?reqPage=1";
	}
	
	@RequestMapping(value = "/productUpdateFrm.do")
	public String productUpdateFrm(int productNo, Model model) {
		Product p = service.productView(productNo);
		model.addAttribute("p",p);
		return "product/productUpdateFrm";
	}
	
	@RequestMapping(value = "/productUpdate.do")
	public String productUpdate(Product p, MultipartFile[] productFile, HttpServletRequest request, String[] productpathList,int[] fileNoList) {
		System.out.println("controller : "+productFile.length);
		ArrayList<ProductFileVO> flist = new ArrayList<ProductFileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
			for(MultipartFile file : productFile) {
				if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.productFileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
					ProductFileVO pfv = new ProductFileVO();
					pfv.setFileName(filename);
					pfv.setFilePath(filepath);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ProductFileVO pfile = new ProductFileVO();
				pfile.setFileName(filename);
				pfile.setFilePath(filepath);
				pfile.setProductNo(p.getProductNo());
				flist.add(pfile);
			}
		}
		//p.setProductFileVO(flist);
		int result = service.productUpdate(p,flist, fileNoList);
		if(productpathList != null && result ==(flist.size()+fileNoList.length+1)) {
			if(productpathList != null) {
				for(String productpath : productpathList) {
					File delFile = new File(savePath+productpath);
					delFile.delete();
				}
			}
		}
		return "redirect:/productList.do?reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertReview.do")
	public String insertReview(ProductReview pr) {
		int result = service.insertReview(pr);
		return String.valueOf(pr.getReviewNo());
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(int reviewNo) {
		int result = service.deleteReview(reviewNo);
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping(value = "/productReviewUpdate.do")
	public String reviewUpdate(ProductReview pr) {
		int result = service.reviewUpdate(pr);
		return "redirect:/productView.do?productNo="+pr.getProductNo();
	}

}
