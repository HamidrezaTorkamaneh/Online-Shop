import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/comment_datasource.dart';
import 'package:online_shop/data/model/comment.dart';
import 'package:online_shop/di/di.dart';
import '../../util/api_exception.dart';

abstract class ICommentRepository {
  Future<Either<String, List<Comment>>> getComments(String productId);
}

class CommentRepository extends ICommentRepository{
  @override
  Future<Either<String, List<Comment>>> getComments(String productId) async{
    final ICommentDatasource _datasource= locator.get();
    try {
      var response = await _datasource.getComments(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }
  
}