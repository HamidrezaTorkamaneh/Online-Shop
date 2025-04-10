import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/comment/comment_event.dart';
import 'package:online_shop/bloc/comment/comment_state.dart';
import 'package:online_shop/data/repository/comment_repository.dart';

class CommentBloc extends Bloc<CommentEvent,CommentState>{
  ICommentRepository repository;
  CommentBloc(this.repository):super(CommentLoading()){
    on<CommentInitializeEvent>((event, emit)async {
    final response= await repository.getComments(event.productId);
    emit(CommentResponse(response));
    },);
  }
}