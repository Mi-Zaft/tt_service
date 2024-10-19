part of 'get_prices_bloc.dart';

// Абстрактный класс события
abstract class PricesEvent {}

// Событие для получения цен
class GetPricesEvent extends PricesEvent {}