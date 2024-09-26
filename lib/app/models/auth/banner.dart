class BannerModel {
  int id;
  String title;
  String text;
  String pic;
  int priority;

  BannerModel(
      {required this.id,
      required this.pic,
      required this.text,
      required this.priority,
      required this.title});

  static BannerModel fromJson(Map<String, dynamic> json) => BannerModel(
      id: json['id'],
      pic: json['pic'],
      text: json['text'],
      priority: json['priority'],
      title: json['title']);
}
