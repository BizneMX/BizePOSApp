// {
//       "id": 1,
//       "title": "prueba",
//       "date": "2022-04-01",
//       "url": null,
//       "file": "https://s3.us-west-2.amazonaws.com/bap-bucket-pre/banners/123.png",
//       "created_at": null,
//       "updated_at": null,
//       "deleted_at": null
//     }

class Training {
  int id;
  String title;
  String date;
  String? url;
  String file;

  Training(
      {required this.date,
      required this.file,
      required this.id,
      required this.title,
      required this.url});

  static Training fromJson(Map<String, dynamic> json) => Training(
      date: json['date'],
      file: json['file'],
      id: json['id'],
      title: json['title'],
      url: json['url']);
}
