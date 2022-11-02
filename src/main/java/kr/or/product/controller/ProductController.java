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
	
	@RequestMapping(value = "/productView.do")
	public String productView(int productNo, Model model) {
		Product p = service.productView(productNo);
		ArrayList<ProductReview> pr = service.productReviewList(productNo);
		model.addAttribute("p",p);
		model.addAttribute("prlist",pr);
		return "product/productView";
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
	
	@RequestMapping(value = "/productUpdateFrm.do")
	public String productUpdateFrm(int productNo, Model model) {
		Product p = service.productView(productNo);
		model.addAttribute("p",p);
		return "product/productUpdateFrm";
	}
	
	@RequestMapping(value = "/productUpdate.do")
	public String productUpdate(Product p, MultipartFile[] productFile, HttpServletRequest request, String[] productpathList) {
		
		ArrayList<ProductFileVO> flist = new ArrayList<ProductFileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
		if(!productFile[0].isEmpty()) {
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
				ProductFileVO pfile = new ProductFileVO();
				pfile.setFileName(filename);
				pfile.setFilePath(filepath);
				pfile.setProductNo(p.getProductNo());
				flist.add(pfile);
			}
		}
		p.setProductFileVO(flist);
		int result = service.productUpdate(p,flist);
		if(productpathList != null && result ==(flist.size()+1)) {
			if(productpathList != null) {
				for(String productpath : productpathList) {
					File delFile = new File(savePath+productpath);
					delFile.delete();
				}
			}
		}
		return "redirect:/productList.do?reqPage=1";
	}
	
	@RequestMapping(value = "/insertReview.do")
	public String insertReview(ProductReview pr, Model model) {
		System.out.println(pr);
		int result = service.insertReview(pr);
		return "redirect:/productView.do?productNo="+pr.getProductNo();
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(int reviewNo) {
		System.out.println(reviewNo);
		int result = service.deleteReview(reviewNo);
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
}
