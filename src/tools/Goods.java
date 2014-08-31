package tools;

public class Goods {
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public float getCurrprice() {
		return currprice;
	}
	public void setCurrprice(float currprice) {
		this.currprice = currprice;
	}
	public float getLstavgprice() {
		return lstavgprice;
	}
	public void setLstavgprice(float lstavgprice) {
		this.lstavgprice = lstavgprice;
	}
	public String getPlaceString() {
		return placeString;
	}
	public void setPlaceString(String placeString) {
		this.placeString = placeString;
	}
	String goodsname;
	float currprice;
	float lstavgprice;
	String placeString;
}
