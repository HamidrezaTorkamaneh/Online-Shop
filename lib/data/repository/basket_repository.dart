
import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/basket_datasource.dart';
import 'package:online_shop/data/model/card_item.dart';
import 'package:online_shop/di/di.dart';

abstract class IBasketRepository {
  Future<Either<String,String>> addProductToBasket(CardItem cardItem);
  Future<Either<String,List<CardItem>>> getAllCardItems();
  Future<int> getBasketFinalPrice();
}

class BasketRepository extends IBasketRepository{
  final IBasketDatasource datasource = locator.get();
  @override
  Future<Either<String, String>> addProductToBasket(CardItem cardItem) async{
    try{
      datasource.addProduct(cardItem);
      return right('محصول به سبد خرید اضافه شد');
    }catch(ex){
      return left('خطا در افزودن محصول به سبد خرید');
    }
  }

  @override
  Future<Either<String, List<CardItem>>> getAllCardItems() async{
    try{
      var cardItemList=await datasource.getAllCardItems();
      return right(cardItemList);
    }catch(ex){
      return left('خطا در نمایش محصولات');
    }
  }

  @override
  Future<int> getBasketFinalPrice()async {
    return  datasource.getBasketFinalPrice();
  }

  
}