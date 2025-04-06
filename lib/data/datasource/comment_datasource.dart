import 'package:dio/dio.dart';
import 'package:online_shop/data/model/comment.dart';
import 'package:online_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class ICommentDatasource{
  Future<List<Comment>> getComments(String productId);
}

class CommentRemoteDatasource extends ICommentDatasource{

  @override
  Future<List<Comment>> getComments(String productId)async {
    final Dio _dio= locator.get();
    Map<String, String> qParams={
      'filter':'product_id="$productId"'
    };
    try {
      var response = await _dio.get('collections/comment/records',queryParameters: qParams);
      return response.data['items']
          .map<Comment>((jsonObject) => Comment.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }

  }
  
}
