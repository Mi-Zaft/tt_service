part of 'bag_prices_bloc.dart';


abstract class BagPricesEvent extends Equatable {
  const BagPricesEvent();

  @override
  List<Object?> get props => [];
}

class LoadBagPricesEvent extends BagPricesEvent {}

class RefreshBagPricesEvent extends BagPricesEvent {
  final bool forceRefresh;

  const RefreshBagPricesEvent({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}