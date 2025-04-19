import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/card/card_event.dart';
import 'package:online_shop/bloc/card/card_state.dart';
import 'package:online_shop/data/repository/basket_repository.dart';
import 'package:online_shop/di/di.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final IBasketRepository _basketRepository = locator.get();

  CardBloc() : super(CardInitState()) {
    on<CardFetchFromHiveEvent>(
      (event, emit) async {
        var cardItemList = await _basketRepository.getAllCardItems();
        var finalPrice = await _basketRepository.getBasketFinalPrice();
        emit(CardDataFetchedState(cardItemList, finalPrice));
      },
    );

    on<CardRemoveProductEvent> ((event, emit) async{
      _basketRepository.removeProduct(event.index);
      var cardItemList = await _basketRepository.getAllCardItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(CardDataFetchedState(cardItemList, finalPrice));
    },);
  }
}
