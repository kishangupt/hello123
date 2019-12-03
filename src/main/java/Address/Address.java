package Address;

public class Address {
	private int id;
	private String name,phone;
	private int pincode;
	private String locality,address,city,state,landmark,alalternate_Phone ; 
	private int userid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getAlalternate_Phone() {
		return alalternate_Phone;
	}
	public void setAlalternate_Phone(String alalternate_Phone) {
		this.alalternate_Phone = alalternate_Phone;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Address(String name, String phone, int pincode, String locality, String address, String city, String state,
			String landmark, String alalternate_Phone, int userid) {
		
		this.name = name;
		this.phone = phone;
		this.pincode = pincode;
		this.locality = locality;
		this.address = address;
		this.city = city;
		this.state = state;
		this.landmark = landmark;
		this.alalternate_Phone = alalternate_Phone;
		this.userid = userid;
	}
	

		
		public Address(int id, String name, String phone, int pincode, String locality, String address, String city,
			String state, String landmark, String alalternate_Phone, int userid) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.pincode = pincode;
		this.locality = locality;
		this.address = address;
		this.city = city;
		this.state = state;
		this.landmark = landmark;
		this.alalternate_Phone = alalternate_Phone;
		this.userid = userid;
	}
		
		public Address() {
			
		}
		
		
		
		@Override
	public String toString() {
		return "Address [id=" + id + ", name=" + name + ", phone=" + phone + ", pincode=" + pincode + ", locality="
				+ locality + ", address=" + address + ", city=" + city + ", state=" + state + ", landmark=" + landmark
				+ ", alalternate_Phone=" + alalternate_Phone + ", userid=" + userid + "]";
	}
	
		

}
