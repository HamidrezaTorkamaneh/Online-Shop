import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/bloc/card/card_bloc.dart';
import 'package:online_shop/bloc/card/card_state.dart';
import 'package:online_shop/widgets/cart_item.dart';
import 'package:online_shop/widgets/custom_app_bar1.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/my_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';
import '../data/model/card_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  PaymentRequest _paymentRequest = PaymentRequest();

  @override
  void initState() {
    super.initState();
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(1000);
    _paymentRequest.setDescription('This is for testing application apple shop');
    _paymentRequest.setMerchantID('fa087dea-31f5-427f-b8cb-d5371fd04187');
    _paymentRequest.setCallbackURL('nozadikala.ir/home');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var box = Hive.box<CardItem>('CardBox');
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomAppBar1(text: 'سبد خرید'),
                  ),
                  if (state is CardDataFetchedState) ...{
                    state.cardItemList.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (cardItemList) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cardItemList.length,
                          (context, index) {
                            return CartItem(
                              storage: '۲۵۶ گیگابایت',
                              color: 'EC407A',
                              colorName: 'آبی',
                              cardItem: cardItemList[index],
                            );
                          },
                        ),
                      );
                    }),
                  },
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 80),
                  ),
                ],
              ),
              if (state is CardDataFetchedState) ...{
                MyButton(
                  text: (state.basketFinalPrice == 0)
                      ? 'سبد خرید شما خالی است!'
                      : '${state.basketFinalPrice}  تومان',
                  color: CustomColor.blueColor,
                  onTap: (){
                    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
                      if(status==100){
                       launchUrl(Uri.parse(paymentGatewayUri!),mode: LaunchMode.externalApplication);
                      }
                    });
                  },
                )
              }
            ],
          );
        },
      )),
    );
  }
}
