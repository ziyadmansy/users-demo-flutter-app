import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'hair.dart';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  // boolean to decide whether the user is picked or not
  bool isUserPicked;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    required this.isUserPicked,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      birthDate: json['birthDate'],
      image: json['image'],
      bloodGroup: json['bloodGroup'],
      height: json['height'],
      weight: double.tryParse(json['weight'].toString()),
      eyeColor: json['eyeColor'],
      hair: json['hair'] != null ? Hair.fromJson(json['hair']) : null,
      domain: json['domain'],
      ip: json['ip'],
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      macAddress: json['macAddress'],
      university: json['university'],
      bank: json['bank'] != null ? Bank.fromJson(json['bank']) : null,
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
      ein: json['ein'],
      ssn: json['ssn'],
      userAgent: json['userAgent'],
      isUserPicked: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['maidenName'] = this.maidenName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['birthDate'] = this.birthDate;
    data['image'] = this.image;
    data['bloodGroup'] = this.bloodGroup;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eyeColor'] = this.eyeColor;
    if (this.hair != null) {
      data['hair'] = this.hair!.toJson();
    }
    data['domain'] = this.domain;
    data['ip'] = this.ip;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['macAddress'] = this.macAddress;
    data['university'] = this.university;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['ein'] = this.ein;
    data['ssn'] = this.ssn;
    data['userAgent'] = this.userAgent;
    return data;
  }
}
