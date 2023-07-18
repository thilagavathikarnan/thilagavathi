class DataModel {
  final int id;
  final String userId;
  final String amount;
  final String remark;
  final String date;
  final String category;
  final String contact;
  final String paymentMode;
  final String cashType;
  final String createdAt;
  final String updatedAt;

  DataModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.remark,
    required this.date,
    required this.category,
    required this.contact,
    required this.paymentMode,
    required this.cashType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id']??"",
      userId: json['user_id']??"",
      amount: json['amount']??"",
      remark: json['remark']??"",
      date: json['date']??'',
      category: json['category']??"",
      contact: json['contact']??"",
      paymentMode: json['payment_mode']??"",
      cashType: json['cash_type']??"",
      createdAt: json['created_at']??"",
      updatedAt: json['updated_at']??"",
    );
  }
}
