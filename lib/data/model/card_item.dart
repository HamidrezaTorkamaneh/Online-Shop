import 'package:hive/hive.dart';
part 'card_item.g.dart';


@HiveType(typeId: 0)
class CardItem {
  @HiveField(0)
  String id;

  @HiveField(1)
  String collectionId;

  @HiveField(2)
  String thumbnail;

  @HiveField(3)
  int discountPrice;

  @HiveField(4)
  int price;

  @HiveField(5)
  String name;

  @HiveField(6)
  String category;

  @HiveField(7)
  int? realPrice;

  @HiveField(8)
  num? percent;

  CardItem(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.discountPrice,
    this.price,
    this.name,
    this.category,
  ) {
    realPrice = price + discountPrice;
    percent = ((price - realPrice!) / price) * 100;
    // this.thumbnail= 'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
  }
}
