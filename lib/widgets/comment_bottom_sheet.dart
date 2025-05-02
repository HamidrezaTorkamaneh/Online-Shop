import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/comment/comment_bloc.dart';
import 'package:online_shop/bloc/comment/comment_event.dart';
import 'package:online_shop/bloc/comment/comment_state.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/cached_image.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/loading_animation.dart';

class CommentBottomSheet extends StatefulWidget {
  final ScrollController controller;
  final String productId;
  final TextEditingController textController=TextEditingController();

  CommentBottomSheet(this.controller, {super.key, required this.productId});

  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 300), () {
          // پیمایش به پایین کامنت‌ها هنگامی که TextField فوکوس شده است
          widget.controller.jumpTo(widget.controller.position.maxScrollExtent);
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentLoading) {
          return Center(
            child: LoadingAnimation(),
          );
        }
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // اضافه کردن پدینگ برای کیبورد
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // اجازه می‌دهد که ستون همان اندازه محتوای خود را بگیرد
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  controller: widget.controller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    ),
                    if (state is CommentResponse) ...{
                      state.response.fold((l) {
                        return SliverToBoxAdapter(
                          child: Text('خطایی در نمایش نظرات به وجود آمده!'),
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
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 8),
                                padding: EdgeInsets.all(8),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child:
                                          (commentList[index].avatar.isNotEmpty)
                                              ? CachedImage(
                                                  imageUrl: commentList[index]
                                                      .userThumbnailUrl)
                                              : Image.asset(
                                                  'assets/images/avatar.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (commentList[index].username.isEmpty)
                                              ? 'کاربر'
                                              : commentList[index].username,
                                          style: theme.textTheme.headline1!
                                              .apply(fontSizeDelta: 1),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          commentList[index].text,
                                          style: theme.textTheme.headline2!
                                              .apply(fontSizeDelta: 3),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            childCount: commentList.length,
                          ),
                        );
                      })
                    }
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child:Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,

                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    onTap: (){
                      if(widget.textController.text.isEmpty){
                        return;
                      }
                      context.read<CommentBloc>().add(CommentPostEvent(widget.productId,widget.textController.text ));
                      widget.textController.clear();
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: CustomColor.blueColor2,
                          maxRadius: 22,
                          child: CustomIcon(
                            icon: 'send',
                            color: Colors.white,
                            size: 15,

                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              focusNode: _focusNode,
                              controller: widget.textController,
                              style: theme.textTheme.headline3
                                  ?.apply(fontSizeDelta: 2),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'پیام خود را اینجا تایپ کنید....',
                                hintStyle: theme.textTheme.headline3
                                    ?.apply(fontSizeDelta: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// تابعی برای نمایش CommentBottomSheet
void showCommentBottomSheet(BuildContext context, ScrollController controller) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return CommentBottomSheet(controller, productId: '',);
    },
  );
}
