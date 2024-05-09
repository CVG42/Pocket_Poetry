class Patient {
  String firstName;
  String lastName;
  String contact;

  Patient({required this.firstName, required this.lastName, required this.contact});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    firstName: json["firstName"],
    lastName: json["lastName"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "contact": contact,
  };

}