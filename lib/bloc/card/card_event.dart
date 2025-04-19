abstract class CardEvent{

}

class CardFetchFromHiveEvent extends CardEvent{

}

class CardRemoveProductEvent extends CardEvent{
  int index;
  CardRemoveProductEvent(this.index);
}