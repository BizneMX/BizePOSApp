class ScanQr {
  int userId;
  String userName;
  int bzCoins;
  double total;

  ScanQr(
      {required this.bzCoins,
      required this.total,
      required this.userId,
      required this.userName});

  static ScanQr fromJson(Map<String, dynamic> json) => ScanQr(
      bzCoins: json['bzcoins'],
      total: double.parse(json['total'].toString()),
      userId: json['user_id'],
      userName: json['user_name']);
}
