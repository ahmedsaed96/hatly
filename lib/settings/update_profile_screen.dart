import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';
import 'package:shop_abdullah_mansour/view/widgets/text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Update Profile', context, centerTitle: true),
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final profileInfo = HomeCubit.get(context).profileInfo;
            HomeCubit.get(context).profilenameController.text =
                profileInfo!.data!.name!;
            HomeCubit.get(context).profileEmailController.text =
                profileInfo.data!.email!;
            HomeCubit.get(context).profilePhoneController.text =
                profileInfo.data!.phone!;
            return HomeCubit.get(context).profileInfo == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (state is UpdateLoadingState)
                            const LinearProgressIndicator(),
                          const SizedBox(height: 15.0),
                          buildTextFormField(
                            type: TextInputType.name,
                            prefixIcon: Icons.person,
                            name: 'name',
                            controller:
                                HomeCubit.get(context).profilenameController,
                          ),
                          const SizedBox(height: 15.0),
                          buildTextFormField(
                            type: TextInputType.phone,
                            prefixIcon: Icons.phone,
                            name: 'phone',
                            controller:
                                HomeCubit.get(context).profilePhoneController,
                          ),
                          const SizedBox(height: 15.0),
                          buildTextFormField(
                            type: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            name: 'email',
                            controller:
                                HomeCubit.get(context).profileEmailController,
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            height: 45.0,
                            child: ElevatedButton(
                              onPressed: () => HomeCubit.get(context)
                                  .updateUserInfo(
                                      name: HomeCubit.get(context)
                                          .profilenameController
                                          .text,
                                      email: HomeCubit.get(context)
                                          .profileEmailController
                                          .text,
                                      phone: HomeCubit.get(context)
                                          .profilePhoneController
                                          .text),
                              child: const Text('Update'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
//email