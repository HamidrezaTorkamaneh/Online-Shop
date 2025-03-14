import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/data/model/card_item.dart';

abstract class IBasketDatasource{
  Future<void> addProduct(CardItem cardItem);
  Future<List<CardItem>> getAllCardItems();
  Future<int> getBasketFinalPrice();
}

class BasketLocalDatasource extends IBasketDatasource{
  var box= Hive.box<CardItem>('CardBox');
  @override
  Future<void> addProduct(CardItem cardItem)async {
    box.add(cardItem);
  }

  @override
  Future<List<CardItem>> getAllCardItems() async{
    return box.values.toList();
  }

  @override
  Future<int> getBasketFinalPrice() async{
    var productList= box.values.toList();
    var finalPrice= productList.fold(0, (accumulator, product) =>
    accumulator + product.price!);

    return finalPrice;
  }
  
}