package kr.or.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.vo.Board;
import kr.or.cart.model.vo.Cart;
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
		String pageNavi = "<nav aria-label=\"Page navigation example\">";
		pageNavi += "<ul class='pagination justify-content-center'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link' tabindex='-1' aria-disabled='true' href='/productList.do?reqPage="+(pageNo-1)+"'>Previous</a></li>";
		}
		for(int i = 0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link active-page' href='/productList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link' href='/productList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<li class='page-item disabled' >";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/productList.do?reqPage=" + pageNo + "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul></nav>";
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

	public int productUpdate(Product p, ArrayList<ProductFileVO> flist, int[] fileNoList) {
		int result = dao.productUpdate(p);
		if(result > 0) {
			for(ProductFileVO pfv : flist) {
				pfv.setProductNo(p.getProductNo());
				result += dao.insertProductFile(pfv);
			}
			if(fileNoList != null) {
				for(int fileNo : fileNoList) {
					result += dao.deleteProductFile(fileNo);
				}
			}
		}
		return result;
	}

	public int insertReview(ProductReview pr) {
		
		return dao.insertReview(pr);
	}

	public ArrayList<ProductReview> productReviewList(int productNo) {
		ArrayList<ProductReview> prlist = dao.productReviewList(productNo);
		int reviewTotalCount = dao.reviewTotalCount(productNo);
		return prlist;
	}

	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

	public int productReviewCount(int productNo) {
		return dao.productReviewCount(productNo);
	}

	public int reviewUpdate(ProductReview pr) {
		return dao.reviewUpdate(pr);
	}

	public int insertCart(Cart c) {
		return dao.insertCart(c);
	}

}
