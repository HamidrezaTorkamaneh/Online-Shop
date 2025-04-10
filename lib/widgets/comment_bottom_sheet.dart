import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/comment/comment_bloc.dart';
import 'package:online_shop/bloc/comment/comment_state.dart';
import 'package:online_shop/widgets/loading_animation.dart';

class CommentBottomSheet extends StatelessWidget {
  ScrollController controller;

  CommentBottomSheet(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentLoading) {
          return Center(
            child: LoadingAnimation(),
          );
        }
        return CustomScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          controller: controller,
          slivers: [
            if (state is CommentResponse) ...{
              state.response.fold((l) {
                return SliverToBoxAdapter(
                  child: Text('is loading...'),
                );
              }, (commentList) {
                if (commentList.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text('نظری برای این محصول ثبت نشده'),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Text(commentList[index].text);
                    },
                    childCount: commentList.length,
                  ),
                );
              })
            }
          ],
        );
      },
    );
  }
}
