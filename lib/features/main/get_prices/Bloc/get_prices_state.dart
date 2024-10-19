part of 'get_prices_bloc.dart';

@immutable
sealed class GetPricesState {}

// Абстрактный класс состояния
abstract class PricesState {}

// Начальное состояние
class PricesInitial extends PricesState {}

// Состояние загрузки
class PricesLoading extends PricesState {}

// Состояние успешной загрузки данных
class PricesLoaded extends PricesState {
  final Map<String, dynamic> prices;

  PricesLoaded({required this.prices});
}

// Состояние ошибки
class PricesError extends PricesState {
  final String message;

  PricesError({required this.message});
}