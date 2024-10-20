import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_service/models/prices.dart';
import 'package:tt_service/features/main/get_prices/get_prices.dart';

part 'bag_prices_event.dart';
part 'bag_prices_state.dart';

class BagPricesBloc extends Bloc<BagPricesEvent, BagPricesState> {
  BagPricesBloc() : super(BagPricesInitial()) {
    on<LoadBagPricesEvent>(_onLoadBagPrices);
    on<RefreshBagPricesEvent>(_onRefreshBagPrices);
  }

  Future<void> _onLoadBagPrices(
      LoadBagPricesEvent event, Emitter<BagPricesState> emit) async {
    await _fetchAndEmitBagPrices(emit);
  }

  Future<void> _onRefreshBagPrices(
      RefreshBagPricesEvent event, Emitter<BagPricesState> emit) async {
    await _fetchAndEmitBagPrices(emit, forceRefresh: event.forceRefresh);
  }

  Future<void> _fetchAndEmitBagPrices(Emitter<BagPricesState> emit,
      {bool forceRefresh = false}) async {
    emit(BagPricesLoading());
    try {
      final BagPrices? bagPrices =
      await fetchBagPrices(forceRefresh: forceRefresh);
      if (bagPrices != null) {
        emit(BagPricesLoaded(bagPrices));
      } else {
        emit(const BagPricesError('Не удалось загрузить цены'));
      }
    } catch (e) {
      emit(BagPricesError('Ошибка: $e'));
    }
  }
}