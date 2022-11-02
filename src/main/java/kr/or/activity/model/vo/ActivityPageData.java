package kr.or.activity.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivityPageData {
	private ArrayList<Activity>list;
	private String pageNavi;
	private int reqPage;
	private int numPerPage;
}
