class ResponseModel {
  final String income;
  final String expenses;

  ResponseModel({required this.income, required this.expenses});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      income: json['income']??"",
      expenses: json['expenses']??"",
    );
  }
}
