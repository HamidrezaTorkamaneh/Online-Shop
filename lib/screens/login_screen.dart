import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/authentication/auth_bloc.dart';
import 'package:online_shop/bloc/authentication/auth_event.dart';
import 'package:online_shop/bloc/authentication/auth_state.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/my_button.dart';
import 'package:online_shop/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameTextController = TextEditingController(text: 'hamid12345');
  final passwordTextController = TextEditingController(text: 'hamid1234');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.blueColor2,
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/iphone1.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'اپل شاپ',
                  style: theme.textTheme.headline1?.apply(
                    color: Colors.white,
                    fontSizeDelta: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(
                        text: 'نام کاربری', controller: usernameTextController),
                    SizedBox(height: 20),
                    MyTextField(
                        text: 'رمز عبور', controller: passwordTextController),
                    SizedBox(height: 20),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthInitiateState) {
                          return MyButton(
                            text: 'ورود به حساب کاربری',
                            color: Colors.blue,
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequest(usernameTextController.text,
                                    passwordTextController.text),
                              );
                            },
                          );
                        }
                        if (state is AuthLoadingState) {
                          return CircularProgressIndicator();
                        }

                        if (state is AuthResponseState) {
                          Text widget = Text('');
                          state.response.fold((l) {
                            widget = Text(l);
                          }, (r) {
                            widget = Text(r);
                          });
                          return widget;
                        }
                        return Text('خطا نامشخص');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
