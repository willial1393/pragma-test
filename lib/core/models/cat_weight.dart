class CatWeight {
  String? imperial;
  String? metric;

  CatWeight({this.imperial, this.metric});

  CatWeight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}
