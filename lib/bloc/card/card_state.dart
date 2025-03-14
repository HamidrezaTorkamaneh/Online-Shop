import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/card_item.dart';

abstract class CardState {}

class CardInitState extends CardState {}

class CardDataFetchedState extends CardState {
  Either<String, List<CardItem>> cardItemList;
  int basketFinalPrice;
  CardDataFetchedState(this.cardItemList,this.basketFinalPrice);
}
