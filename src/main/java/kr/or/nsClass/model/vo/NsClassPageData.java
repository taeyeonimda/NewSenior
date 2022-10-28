package kr.or.nsClass.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NsClassPageData {
	private ArrayList<NsClass>list;
	private String pageNavi;
	private int reqPage;
	private int numPerPage;
}
