import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/models/provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> articles = [];
  bool isloading = true;
  bool isDarkMode = false;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      queryParameters: {
        'q': 'bitcoin',
        'apiKey': "9a9faf6f5c424e8ca2129844defd93f3",
      },
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      setState(() {
        isloading = true;
      });
      final response = await dio.get('everything');
      if (response.statusCode == 200) {
        // Handle the response data
        print(response.data);
        setState(() {
          isloading = false;
        });
        ApiModel apiModel = ApiModel.fromJson(response.data);
        articles = apiModel.articles;
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

  // Assuming you have Dio set up for API calls

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'News',
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        actions: [
          Consumer(
            builder: (context, ThemeProvider provider, child) {
              return IconButton(
                icon: Icon(
                  Icons.nightlight,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
                onPressed: () {},
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _searchController,
              keyboardType: TextInputType.text,

              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).hintColor,
                  size: 30,
                ),
                hintText: 'Search',

                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              onFieldSubmitted: (value) {
                // Handle search action
                setState(() {
                  dio.options.queryParameters['q'] = value;
                  fetchNews();
                });
              },
            ),
            isloading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Container(
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.network(
                                      articles[index].urlToImage ??
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdTo7e0gCIzO9J8dRakOK0m6hseDquu_RHSw&s",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          articles[index].title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          articles[index].description ??
                                              "No description available",
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      articles[index].author ??
                                          "Unknown Author",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          articles[index].publishedAt,
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Icon(
                                      Icons.notifications_active_outlined,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Divider(color: Theme.of(context).highlightColor),
                      ),
                      itemCount: articles.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
