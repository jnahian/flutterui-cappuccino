class Statistic {
  String? count;
  String? label;
  String? icon;

  Statistic({this.count, this.label, this.icon});

  Statistic.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    label = json['label'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = count;
    data['label'] = label;
    data['icon'] = icon;
    return data;
  }
}
