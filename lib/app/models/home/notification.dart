// {
class Notification {
  int id;
  String title;
  String description;
  String date;

  Notification(
      {required this.id,
      required this.date,
      required this.description,
      required this.title});

  static Notification fromJson(Map<String, dynamic> json) => Notification(
      id: json['id'],
      date: json['created_at'],
      description: json['description'],
      title: json['title']);
}
