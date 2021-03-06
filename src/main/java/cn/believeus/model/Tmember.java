package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Tmember extends TbaseEntity {

	private static final long serialVersionUID = 1L;
	
	// 昵称
	private String nickName;
	// 真实姓名
	private  String username;
	// 性别
	private Character sex;
	// 身份证号码
	private String idCard;
	// 邮箱
	private  String email;
	// 年龄
	private int age;
	// 电话号码
	private String phoneNum;
	// 密码
	private String password;
	// 身高
	private int height;
	// 省
	private String province;
	// 市
	private String city;
	// 生日
	private long birthday;
	// 婚姻情况
	private String marriageCase;
	// 学历
	private String degree;
	// 职业类型
	private String career;
	// 年薪
	private String yearSalary;
	// 资产
	private String asset;
	// 购车情况
	private String carCase;
	// 购房情况
	private String houseCase;
	// 艺术照
	private String artImage;
	// 生活照
	private String lifeImage;
	// 工作照
	private String workImage;
	//单位性质
	private String unitNature ;
	//头像
	private String headerImg;
	
	
	public String getHeaderImg() {
		return headerImg;
	}
	public void setHeaderImg(String headerImg) {
		this.headerImg = headerImg;
	}
	public String getArtImage() {
		return artImage;
	}
	public String getAsset() {
		return asset;
	}
	public long getBirthday() {
		return birthday;
	}
	public String getCarCase() {
		return carCase;
	}
	public String getCareer() {
		return career;
	}
	public String getHouseCase() {
		return houseCase;
	}
	public String getIdCard() {
		return idCard;
	}
	public String getLifeImage() {
		return lifeImage;
	}
	public String getMarriageCase() {
		return marriageCase;
	}
	public String getNickName() {
		return nickName;
	}
	public String getPassword() {
		return password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public Character getSex() {
		return sex;
	}
	public String getUsername() {
		return username;
	}
	public String getWorkImage() {
		return workImage;
	}
	public String getYearSalary() {
		return yearSalary;
	}
	public void setArtImage(String artImage) {
		this.artImage = artImage;
	}
	public void setAsset(String asset) {
		this.asset = asset;
	}
	public void setBirthday(long birthday) {
		this.birthday = birthday;
	}
	public void setCarCase(String carCase) {
		this.carCase = carCase;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public void setHouseCase(String houseCase) {
		this.houseCase = houseCase;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public void setLifeImage(String lifeImage) {
		this.lifeImage = lifeImage;
	}
	public void setMarriageCase(String marriageCase) {
		this.marriageCase = marriageCase;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setSex(Character sex) {
		this.sex = sex;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setWorkImage(String workImage) {
		this.workImage = workImage;
	}
	public void setYearSalary(String yearSalary) {
		this.yearSalary = yearSalary;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUnitNature() {
		return unitNature;
	}
	public void setUnitNature(String unitNature) {
		this.unitNature = unitNature;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
}
