import 'package:appone/core/data/app_data.dart';
import 'package:appone/core/widgets/custom_button.dart';
import 'package:appone/features/home/logic/home_provider.dart';
import 'package:appone/features/login/ui/login_screen.dart';
import 'package:appone/features/update_profile/ui/update_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, _, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            actions: [
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  user = null;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout, color: Colors.red),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
            child: Column(
              spacing: 16,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[700]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(user?.name ?? ''),
                        ],
                      ),
                      Divider(color: Colors.grey[400]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(user?.email ?? ''),
                        ],
                      ),
                      Divider(color: Colors.grey[400]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(user?.phone ?? ''),
                        ],
                      ),
                      Divider(color: Colors.grey[400]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(user?.age ?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(),
                      ),
                    );
                  },
                  text: 'Edit Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
