import 'address.dart';

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      address: json['address'] != null
          ? new Address.fromJson(json['address'])
          : null,
      department: json['department'],
      name: json['name'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['department'] = this.department;
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}
