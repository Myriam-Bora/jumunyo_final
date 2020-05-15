package com.finalp.jumunyo;

import java.util.ArrayList;
import java.util.List;

class MenuVO {
	private String manuId;
	private String manuName;
	
	public MenuVO(String manuId, String manuName) {
		super();
		this.manuId = manuId;
		this.manuName = manuName;
	}
	
	public String getManuId() {
		return manuId;
	}
	public void setManuId(String manuId) {
		this.manuId = manuId;
	}
	public String getManuName() {
		return manuName;
	}
	public void setManuName(String manuName) {
		this.manuName = manuName;
	}
	
	
}

public class Test {

	public static void main(String[] args) {
		String[] menu = {"", "치킨버거", "불고기버거", "치즈버거"};
		List menus = new ArrayList();
		menus.add(new MenuVO("1", "치킨버거"));
		menus.add(new MenuVO("2", "불고기버거"));
		menus.add(new MenuVO("3", "치즈버거"));
		String orderList = "3x3,1x1,2x2";
		
		String result = orders(orderList, menus);
		System.out.println(result);

	}
	
	public static String orders(String orderList, List menus) {
		String result = "";
		String[] first = orderList.split(","); //[3x3][1x1][2x2]
		
		for(int i = 0; i < first.length; i++) {
			String[] second = first[i].split("x");   // [3][3][1][1][2][2]
			
			for(int j = 0; j < menus.size(); j++) {
				MenuVO menu = (MenuVO)menus.get(j); //"1","치킨"    "2","불고기"    "3","치즈"
				if(menu.getManuId().equals(second[0])) { //[3][3] 이    "3""치즈" 가 맞으면
					result += menu.getManuName() + "/" + second[1] + " ";
				}
			}
		}
		
		return result;
	}

}
