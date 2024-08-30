class SportsPerson{
  late String firstName;
  late String lastName;
  late int mobileNumber;
  late String gender;
  
  late String email;
  late String _password;
  late int _verificationCode;

  String get password => _password;
  int get verificationCode => _verificationCode;
}