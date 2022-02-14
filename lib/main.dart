import 'package:flutter/material.dart';
import 'package:productos_app/Screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(AppState());
} 

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService()),
        ChangeNotifierProvider(create: ( _ ) => ProductsService()),
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Froductos APP',
      initialRoute: 'checking',
      routes: {
        'login'     : ( _ ) => LoginScreen(),
        'register'  : ( _ ) => RegisterScreen(),
        'home'      : ( _ ) => HomeScreen(),
        'product'   : ( _ ) => ProductScreen(),
        'checking'  : ( _ ) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo[800],
          centerTitle: true
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}