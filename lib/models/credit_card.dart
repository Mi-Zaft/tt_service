class CreditCard {
  String? number;
  String? date;
  String? cvv;

  CreditCard({this.number, this.date, this.cvv});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      number: json['number'],
      date: json['date'],
      cvv: json['cvv'],
    );
  }
}
