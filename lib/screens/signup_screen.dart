import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/authentication/auth_bloc.dart';
import 'package:online_shop/bloc/authentication/auth_event.dart';
import 'package:online_shop/bloc/authentication/auth_state.dart';
import 'package:online_shop/screens/dashboard_screen.dart';
import 'package:online_shop/screens/login_screen.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/my_button.dart';
import 'package:online_shop/widgets/pass_text_field.dart';
import 'package:online_shop/widgets/user_text_field.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final usernameTextController = TextEditingController(text: '');
  final passwordTextController = TextEditingController(text: '');
  final passwordConfirmTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
    );
    final ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ViewContainer(
          usernameTextController: usernameTextController,
          passwordTextController: passwordTextController,
          passwordConfirmTextController: passwordConfirmTextController,
          theme: theme),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
    required this.usernameTextController,
    required this.passwordTextController,
    required this.passwordConfirmTextController,
    required this.theme,
  });

  final TextEditingController usernameTextController;
  final TextEditingController passwordTextController;
  final TextEditingController passwordConfirmTextController;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/signup.jpg',
                      width: double.infinity,
                    ),
                    SizedBox(height: 20),
                    // Text(
                    //   'اپل شاپ',
                    //   style: theme.textTheme.headline1?.apply(
                    //     color: Colors.white,
                    //     fontSizeDelta: 14,
                    //   ),
                    // ),
                  ],
                ),
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
                      UserTextField(
                        icon: Icon(Icons.person),
                          text: 'نام کاربری',
                          controller: usernameTextController),
                      SizedBox(height: 20),
                      PassTextField(controller: passwordTextController, text: 'رمز عبور'),
                      SizedBox(height: 20),
                      PassTextField(controller: passwordConfirmTextController, text: 'تکرار رمز عبور'),
                      SizedBox(height: 10),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {

                          if (state is AuthResponseState) {
                            state.response.fold((l) {
                              final snackBar = SnackBar(
                                content: Text(
                                  l,
                                  style: theme.textTheme.headline1!.apply(
                                    color: Colors.white,
                                  ),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: CustomColor.blueColor2,
                                duration: Duration(seconds: 2),
                              );
                              Duration(seconds: 2);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              usernameTextController.text='';
                              passwordTextController.text='';
                              passwordConfirmTextController.text='';
                            }, (r) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => DashBoardScreen(usernameTextController.text)));
                            });
                          }
                        },

                        builder: (context, state) {
                          if (state is AuthInitiateState) {
                            return MyButton(
                              text: 'ثبت نام',
                              color: Colors.blue,
                              onTap: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthRegisterRequest(
                                      usernameTextController.text,
                                      passwordTextController.text,
                                      passwordConfirmTextController.text),
                                );
                              },
                            );
                          }
                          if (state is AuthLoadingState) {
                            return CircularProgressIndicator();
                          }

                          if (state is AuthResponseState) {
                            Widget widget = Text('');
                            state.response.fold((l) {
                              widget = MyButton(
                                text: 'ثبت نام',
                                color: Colors.blue,
                                onTap: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    AuthLoginRequest(
                                        usernameTextController.text,
                                        passwordTextController.text),
                                  );
                                },
                              );
                            }, (r) {
                              widget = Text(r);
                            });
                            return widget;
                          }
                          return Text('خطا نامشخص');
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }),
                          );
                        },
                        child: Text('حساب کاربری دارم!',
                            style: theme.textTheme.headline1!
                                .apply(color: CustomColor.blueColor1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
