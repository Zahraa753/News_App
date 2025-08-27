import 'package:appone/core/widgets/custom_button.dart';
import 'package:appone/core/widgets/custom_text_field.dart';
import 'package:appone/features/update_profile/logic/update_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateProfileProvider(),
      builder: (context, child) {
        final provider = context.read<UpdateProfileProvider>();
        return Scaffold(
          appBar: AppBar(title: Text('Update profile')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: provider.formKey,
              child: Column(
                spacing: 16,
                children: [
                  CustomTextField(
                    controller: provider.nameController,
                    hintText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller: provider.phoneController,
                    hintText: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: provider.ageController,
                    hintText: 'Age',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),

                  Consumer<UpdateProfileProvider>(
                    builder: (context, _, _) {
                      if (provider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return CustomButton(
                        onPressed: () {
                          provider.updateProfile(context);
                        },
                        text: 'Update',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
