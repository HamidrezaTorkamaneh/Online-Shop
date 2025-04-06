import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/product/product_bloc.dart';
import 'package:online_shop/bloc/product/product_event.dart';
import 'package:online_shop/data/model/product.dart';
import 'package:online_shop/widgets/detail_content_widget.dart';


class ProductDetailScreen extends StatefulWidget {
  Product product;

  ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(ProductInitializeEvent(
          widget.product.id,
          widget.product.category,
        ));
        return bloc;
      },
      child: DetailContentWidget(parentWidget: widget),
    );
  }
}
