import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:productos_app/Screens/screens.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    final products = productsService.products;

    if( productsService.isLoading ) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: Icon(Icons.login_outlined, color: Colors.redAccent, size: 35,)
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder:(context, int index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = products[index];
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: products[index],)
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          productsService.selectedProduct = new Product(
            available: false,
            name: '', 
            price: 0
          );

          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}