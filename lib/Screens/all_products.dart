import 'dart:io';

import 'package:cozy_mart_0/Providers/user_provider.dart';
import 'package:cozy_mart_0/Screens/edit_profile.dart';
import 'package:cozy_mart_0/Screens/user_products.dart';
import 'package:cozy_mart_0/Screens/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user_controller.dart';
import 'DetailsScreen/product_details.dart';
import 'add_product.dart';
import 'edit_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllProducts extends StatefulWidget {
  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  var Shared;

  Future<void> logout() async {
    UserHttpService service = UserHttpService();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final result =
          await service.logoutUser(sharedPreferences.getString('token') ?? '');
      sharedPreferences.remove('token');
    } catch (e) {
      print(e.toString());
      //}
    }
  }

  @override
  void initState() {
    Provider.of<Products>(context, listen: false).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return ChangeNotifierProvider<Product>(
      create: (BuildContext context) {
        return Product();
      },
      child: Scaffold(
        drawer: AppDrawer(
          user: user,
        ),
        appBar: customAppBar(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            elevation: 1,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddProduct();
              }));
            }),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
        ),
        IconButton(
            //CupertinoIcons.cart
            icon: const Icon(Icons.logout),
            onPressed: () {
              logout();
            }),
        const SizedBox(width: 10.0)
      ],
    );
  }
}

class CustomSearch extends SearchDelegate {
  static List<String> allData = [];
  //List<String> allData = ["tony"];
  static void getName() {
    List<String> loadedData = [];
    http.get(Uri.parse('http://192.168.43.228:8000/api/product/'), headers: {
      'X-USER-TOKEN':
          'eyJlbWFpbCI6InBvQGhvdG1haWwuY29tIiwicGFzc3dvcmQiOiJwYXNzd29yZDIiLCJsb2dnZWRfYXQiOiIwOCAwMSAyMDIyIiwiZXhwaXJlZF9hdCI6IjA4IDAxIDIwMjIiLCJ1c2VyX3JvbGUiOiJ1c2VyIn0=',
    }).then((response1) {
      final decoded = json.decode(response1.body) as List<dynamic>;
      //print(decoded);
      var temp;
      for (int i = 0; i <= decoded.length - 1; i++) {
        print(decoded[i]['product_name']);
        temp = decoded[i]['product_name'];
        loadedData.add(temp);
      }
      allData = loadedData;
      //print(json.decode(response1.body));
    });
    print('done');
    // return loadedData;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
          getName();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //padding: const EdgeInsetsDirectional.all(1),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user.name,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
            accountEmail: Text(
              user.email,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
            onDetailsPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ),
            ),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllProducts(),
                  ))
            },
            title: Text('All Products'),
          ),
          ListTile(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProductsScreen(user: user),
                  ))
            },
            title: Text('My Products'),
          ),
        ],
      ),
    );
  }
}

/* ListTile(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ))
            },
            leading: IconButton(
              //CupertinoIcons.cart
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
            title: Text('Log out'),
          ),*/
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

Future<void> _refreshPage(BuildContext context) async {
  await Provider.of<Products>(context, listen: false).fetchProducts();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List prodList = Provider.of<Products>(context, listen: true).productsList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
            child: Text(
              'All Products',
              style: TextStyle(
                  // color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat'),
            ),
          ),
          Categories(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _refreshPage(context),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: prodList.isEmpty
                      ? const Center(
                          child: Text('There is no products'),
                        )
                      : GridView.builder(
                          itemCount: prodList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (ctx, i) => ItemCard(
                            product: prodList[i],
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                  product: prodList[i],
                                );
                              }));
                            },
                          ),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "Clothes",
    "Electronics",
    "Furnitures",
    "Food",
    "Other"
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  Function press;
  ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: {product.id},
                child: product.image2 != null
                    ? Image.file(File(product.image2!))
                    : const Text('No Image'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              // products is out demo list
              product.title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String number;

  const User({
    required this.name,
    required this.email,
    required this.number,
  });
}

class UserPreferences {
  static const myUser = User(
    name: 'User name',
    email: '    ',
    number: '    ',
  );
}
