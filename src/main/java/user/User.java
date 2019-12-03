package user;

public class User {

private int id;
private String name;
private String phone;
private String email;
private String password;
private String ConfirmPassword;
private int active;
private String role;



public String getConfirmPassword() {
return ConfirmPassword;
}
public void setConfirmPassword(String confirmPassword) {
ConfirmPassword = confirmPassword;
}
public String getPassword() {
return password;
}
public void setPassword(String password) {
this.password = password;
}
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
public String getEmail() {
return email;
}
public void setEmail(String email) {
this.email = email;
}
public int getActive() {
return active;
}
public void setActive(int active) {
this.active = active;
}
public String getRole() {
return role;
}
public void setRole(String role) {
this.role = role;
}


public User() {
super();
}
public User(int id, String name, String phone, String email, String password, String confirmPassword, int active,
String role) {
super();
this.id = id;
this.name = name;
this.phone = phone;
this.email = email;
this.password = password;
ConfirmPassword = confirmPassword;
this.active = active;
this.role = role;
}
public User(String name, String phone, String email, String password, String confirmPassword, int active,
String role) {
super();
this.name = name;
this.phone = phone;
this.email = email;
this.password = password;
this.ConfirmPassword = confirmPassword;
this.active = active;
this.role = role;
}


public User(String name, String phone, String email, String password, String confirmPassword) {
super();
this.name = name;
this.phone = phone;
this.email = email;
this.password = password;
ConfirmPassword = confirmPassword;
}




public User(int id, String name, String phone, String email, String password) {
super();
this.id = id;
this.name = name;
this.phone = phone;
this.email = email;
this.password = password;
}

public User(int id, String name, String phone, String email, String password, int active) {
	super();
	this.id = id;
	this.name = name;
	this.phone = phone;
	this.email = email;
	this.password = password;
	this.active = active;
}

public User(String name, String phone, String email, String password, String confirmPassword, int active) {
	super();
	this.name = name;
	this.phone = phone;
	this.email = email;
	this.password = password;
	ConfirmPassword = confirmPassword;
	this.active = active;
}
public User(String name) {
super();
this.name = name;
}

@Override
public String toString() {
return "SignUp [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", password="
+ password + ", ConfirmPassword=" + ConfirmPassword + ", active=" + active + ", role=" + role + "]";
}





}



