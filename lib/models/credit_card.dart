class CreditCard {
  String number;
  String date;
  String cvv;

  CreditCard({required this.number, required this.date, required this.cvv});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      number: json['number'],
      date: json['date'],
      cvv: json['cvv'],
    );
  }
}
