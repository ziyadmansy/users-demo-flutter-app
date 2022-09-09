class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  factory Hair.fromJson(Map<String, dynamic> json) {
    return Hair(
      color: json['color'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['type'] = this.type;
    return data;
  }
}
