import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_cubit.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_states.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

import 'package:shop_abdullah_mansour/view/widgets/text_field.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = LoginCubit.get(context);
                return Form(
                  key: cubit.registerFormkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      const Text(
                        'Hatly',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Any time...Any where',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20.0),
                      ),
                      const SizedBox(height: 40.0),
                      buildTextFormField(
                        labelText: 'User Name',
                        name: 'Name',
                        controller: cubit.registerUserNameController,
                        prefixIcon: Icons.person_outline,
                        type: TextInputType.name,
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        labelText: 'Email Address',
                        name: 'Email',
                        controller: cubit.registerEmailController,
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        labelText: 'Password',
                        name: 'Strong Password',
                        controller: cubit.registerPasswordController,
                        prefixIcon: Icons.lock_outline,
                        type: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        labelText: 'Phone',
                        name: 'PHone Number',
                        controller: cubit.registerPhoneController,
                        prefixIcon: Icons.phone,
                        type: TextInputType.phone,
                      ),
                      buildRegisterButton(context),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Container buildRegisterButton(BuildContext context) {
    return Container(
      color: Colors.blue.shade400,
      height: 50.0,
      width: double.infinity,
      child: TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterScreen())),
        child: const Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
