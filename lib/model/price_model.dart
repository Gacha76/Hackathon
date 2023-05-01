import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  const Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];

  static List<Price> prices = [
    Price(id: 1, price: '3000'),
    Price(id: 2, price: '6000'),
    Price(id: 3, price: '10000'),
  ];
}
