class AdminUserModel {
  AdminUserModel({
    required this.userid,
    required this.userrole,
    required this.regdate,
    required this.firstname,
    required this.lastname,
    required this.contactnum,
    required this.address,
    required this.birthdate,
    required this.birthplace,
    required this.email,
    required this.password,
    required this.profile,
  });

  String userid;
  String userrole;
  DateTime regdate;
  String firstname;
  String lastname;
  String contactnum;
  String address;
  DateTime birthdate;
  String birthplace;
  String email;
  String password;
  String profile;

  toJson() {
    return {
      "User Id": userid,
      "User Role": userrole,
      "Registration Date": regdate,
      "First Name": firstname,
      "Last Name": lastname,
      "Address": address,
      "Contact Number": contactnum,
      "Birth Date": birthdate,
      "Birth Place": birthplace,
      "Email Address": email,
      "Password": password,
      "profileUrl": profile,
    };
  }
}
