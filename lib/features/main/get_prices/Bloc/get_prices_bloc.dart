import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:tt_service/services/api_service.dart';
part 'get_prices_event.dart';
part 'get_prices_state.dart';




class PricesBloc extends Bloc<PricesEvent, PricesState> {
  final ApiService apiService;

  PricesBloc({required this.apiService}) : super(PricesInitial()) {
    on<GetPricesEvent>((event, emit) async {

      emit(PricesLoading());
      try {
        Response response = await apiService.fetchData('/api/v1/order/price-list');

        if (response.statusCode == 200) {
          emit(PricesLoaded(prices: response.data));
        } else {
          emit(PricesError(message: 'Ошибка при загрузке данных'));
        }
      } catch (e) {
        emit(PricesError(message: 'Произошла ошибка: $e'));
      }
    });
  }
}