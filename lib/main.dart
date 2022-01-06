import 'package:cozy_mart_0/Providers/favorites_provider.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:cozy_mart_0/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/user_provider.dart';
import 'Screens/welcome_page.dart';
import 'Providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String url1 = 'http://192.168.43.94:8000/api/';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      // You can wrap multiple providers
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (_) {
            return ThemeProvider(isDarkTheme);
          }),
          ChangeNotifierProvider<FavoriteItemsProvider>(create: (_) {
            return FavoriteItemsProvider();
          }),
          ChangeNotifierProvider<Product>(create: (_) {
            return Product();
          }),
          ChangeNotifierProvider<Products>(create: (_) {
            return Products();
          }),
          ChangeNotifierProvider<User>(create: (_) {
            return User();
          }),
          ChangeNotifierProvider<User>(create: (_) => User())
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
        theme: value.getTheme(),
        routes: {AddProduct.routeName: (ctx) => const AddProduct()},
      );
    });
  }
}
