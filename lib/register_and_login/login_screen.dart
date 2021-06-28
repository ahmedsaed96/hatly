import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../register_and_login/login_cubit.dart';
import '../register_and_login/login_states.dart';
import '../share/constant.dart';
import '../view/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocProvider(
              create: (context) => LoginCubit(),
              child: BlocConsumer<LoginCubit, LoginStates>(
                listener: (context, state) {},
                builder: (context, state) => Form(
                  key: LoginCubit.get(context).formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: titleStyle(context),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Login in to browse our hot offers',
                        style: descrebtionStyle(context),
                      ),
                      const SizedBox(height: 40.0),
                      buildTextFormField(
                          controller: LoginCubit.get(context).emailController,
                          name: 'Email',
                          type: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined),
                      const SizedBox(height: 25.0),
                      buildTextFormField(
                        onSavedFunction: () {
                          //need to check him
                          if (LoginCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).userLogin(
                                email: LoginCubit.get(context)
                                    .emailController
                                    .text,
                                password: LoginCubit.get(context)
                                    .passwordController
                                    .text);
                          }
                          return;
                        },
                        controller: LoginCubit.get(context).passwordController,
                        name: 'Password',
                        type: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock_outlined,
                        suffexIcon: IconButton(
                            onPressed: () =>
                                LoginCubit.get(context).changevisibilty(),
                            icon: Icon(LoginCubit.get(context).suffixIcon)),
                        obsecureText: LoginCubit.get(context).obsecureText,
                      ),
                      const SizedBox(height: 25.0),
                      // this button not working perfectly
                      buildLoginButton(context, state),
                      const SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an acount ?  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: defaultColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle descrebtionStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Colors.grey.shade500);
  }

  TextStyle titleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 45.0);
  }

  ElevatedButton buildLoginButton(BuildContext context, LoginStates state) {
    if (state != LoginLoadingState()) {
      return ElevatedButton(
        onPressed: () {
          if (LoginCubit.get(context).formkey.currentState!.validate()) {
            LoginCubit.get(context).userLogin(
                email: LoginCubit.get(context).emailController.text,
                password: LoginCubit.get(context).passwordController.text);
          }
          return;
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50.0),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50.0),
        primary: Colors.blueGrey.shade100,
        side: BorderSide(color: defaultColor.shade200),
        elevation: 0.0,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}