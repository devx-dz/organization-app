import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_circular_loader.dart';
import '../../shared/widgets/custom_textfield.dart';
import '../../shared/widgets/password_text_field.dart';
import 'forgetpassword.dart';
import 'login_bloc/login_bloc.dart';

part 'widgets/authwidgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static String routeName = '/auth';
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Map<String, String> loginData = {};
  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<LoginBloc>().add(LoginEvent.login(
          email: loginData['email']!, password: loginData['password']!));
    }
  }

  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BackGroundImage(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(40),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        '$images/brainy.png',
                      ),
                      Column(
                        children: [
                          Text(
                            'Log In',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Please Fill the Form below to Continue',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black.withOpacity(0.5))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            hintText: 'Enter your Email',
                            data: loginData,
                            mapKey: 'email',
                          ),
                          PasswordTextField(
                            hintText: 'Enter your Password',
                            data: loginData,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    ConfirmEmail.routeName,
                                  );
                                },
                                child: Text('Forgot Password?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: kBlue)),
                              ),
                            ],
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return state.maybeMap(
                                orElse: () => const SizedBox(),
                                failure: (value) {
                                  return Row(
                                    children: [
                                      const Spacer(),
                                      const Icon(
                                        IconlyLight.danger,
                                        color: kRed,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        value.message,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: kRed),
                                      ),
                                      const Spacer(),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const Center(child: CustomLoader()),
                            orElse: () => LoginButton(
                              onPressed: () => login(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
