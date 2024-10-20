part of 'bag_prices_bloc.dart';

abstract class BagPricesState extends Equatable {
  const BagPricesState();

  @override
  List<Object?> get props => [];
}

class BagPricesInitial extends BagPricesState {}

class BagPricesLoading extends BagPricesState {}

class BagPricesLoaded extends BagPricesState {
  final BagPrices bagPrices;

  const BagPricesLoaded(this.bagPrices);

  @override
  List<Object?> get props => [bagPrices];
}

class BagPricesError extends BagPricesState {
  final String message;

  const BagPricesError(this.message);

  @override
  List<Object?> get props => [message];
}