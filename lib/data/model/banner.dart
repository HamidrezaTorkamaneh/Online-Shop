class BannerCampaign {
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;

  //http://127.0.0.1:8090/api//files/COLLECTION_ID_OR_NAME/RECORD_ID/FILENAME
  BannerCampaign(this.id, this.collectionId, this.thumbnail, this.categoryId);

  factory BannerCampaign.fromMapJson(Map<String, dynamic> jsonObject) {
    return BannerCampaign(
      jsonObject['id'],
      jsonObject['collectionId'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['categoryId'],
    );
  }
}
