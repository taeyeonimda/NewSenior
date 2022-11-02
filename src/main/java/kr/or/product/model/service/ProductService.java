package kr.or.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.vo.Board;
import kr.or.product.model.dao.ProductDao;
import kr.or.product.model.vo.Product;
import kr.or.product.model.vo.ProductFileVO;
import kr.or.product.model.vo.ProductPageData;
import kr.or.product.model.vo.ProductReview;

@Service
public class ProductService {
	@Autowired
	private ProductDao dao;

	public ProductPageData allProduct(int reqPage) {
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		
		ArrayList<Product> list = dao.allProduct(map);
		
		for(Product p : list) {
			ArrayList<ProductFileVO> flist = dao.allProductFile(p.getProductNo());
			p.setProductFileVO(flist);
		}
		
		
		int totalCount = dao.selectProductCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/productList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i = 0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/productList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/productList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		ProductPageData ppd = new ProductPageData(list,pageNavi);
		return ppd;
	}

	public int insertProduct(Product p) {
		int result = dao.insertProduct(p);
		if(result > 0) {
			for(ProductFileVO pfv : p.getProductFileVO()) {
				pfv.setProductNo(p.getProductNo());
				result += dao.insertProductFile(pfv);
			}
		}
		return result;
	}

	public Product productView(int productNo) {
		Product p = dao.productView(productNo);
		ArrayList<ProductFileVO> pf = dao.allProductFile(productNo);
		p.setProductFileVO(pf);
		return p;
	}

	public ArrayList<ProductFileVO> deleteProduct(int productNo) {
		ArrayList<ProductFileVO> fileList = dao.allProductFile(productNo);
		
		int result = dao.deleteProduct(productNo);
		if(result>0) {
			return fileList;
		} else {
			return null;
		}
	}

	public int productUpdate(Product p, ArrayList<ProductFileVO> flist) {
		int result = dao.productUpdate(p);
		if(result > 0) {
			for(ProductFileVO pfv : flist) {
				pfv.setProductNo(p.getProductNo());
				result += dao.deleteProductFile(p.getProductNo());
				result += dao.insertProductFile(pfv);
			}
		}
		return result;
	}

	public int insertReview(ProductReview pr) {
		
		return dao.insertReview(pr);
	}

	public ArrayList<ProductReview> productReviewList(int productNo) {
		ArrayList<ProductReview> prlist = dao.productReviewList(productNo);
		return prlist;
	}

	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

}
