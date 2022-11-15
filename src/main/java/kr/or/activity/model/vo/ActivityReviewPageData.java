package kr.or.activity.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivityReviewPageData {
	private ArrayList<ActivityReview>list;
	private String pageNavi;
	private int reqPage;
	private int numPerPage;
}
