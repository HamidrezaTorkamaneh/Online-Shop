class Variant {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  Variant(
    this.id,
    this.name,
    this.value,
    this.priceChange,
    this.typeId,
  );

  factory Variant.fromMapJson(Map<String, dynamic> jsonObject) {
    return Variant(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['value'],
      jsonObject['price_change'],
      jsonObject['type_id'],
    );
  }
}
