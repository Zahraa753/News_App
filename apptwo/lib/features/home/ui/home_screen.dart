import 'package:appone/core/widgets/custom_text_field.dart';
import 'package:appone/features/home/logic/home_provider.dart';
import 'package:appone/features/messages/ui/messages_screen.dart';
import 'package:appone/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getUser();
    context.read<HomeProvider>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          final provider = context.read<HomeProvider>();
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              children: [
                CustomTextField(
                  controller: provider.searchController,
                  hintText: 'Search user here...',
                  onSubmit: (value) {
                    if (value.isNotEmpty) {
                      provider.searchForUser();
                    } else {
                      provider.getAllUsers();
                    }
                  },
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MessagesScreen(user: provider.users[index]),
                          ),
                        );
                      },
                      child: Row(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.users[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(provider.users[index].email),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: Colors.grey[400]),
                    ),
                    itemCount: provider.users.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
