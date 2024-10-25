class SportsPerson{
  late String firstName;
  late String lastName;
  late String mobileNumber;
  
  late String email;
  late String _password;
  late int _verificationCode;

  String get password => _password;
  int get verificationCode => _verificationCode;

  SportsPerson({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
  });

  SportsPerson.fromJson(Map <String, Object?> json)
  : this(
      firstName: json['firstName']! as String,
      lastName: json['lastName']! as String,
      mobileNumber: json['mobileNumber']! as String,
      email: json['email']! as String,
  );

  SportsPerson copyWith({
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
  }){
    return SportsPerson(
      firstName: firstName?? this.firstName, 
      lastName: lastName?? this.lastName, 
      mobileNumber: mobileNumber?? this.mobileNumber, 
      email: email?? this.email, 
    );
  }

  Map<String, Object?> toJson(){
    return{
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'email': email
    };
  }
}