import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'chi_tiet.dart';
import 'data_bai2.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataBai2(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Giai cuu nong san',
        home: GCNS(),
      ),
    );
  }
}

class GCNS extends StatelessWidget {
  const GCNS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Giai cuu nong san'),
        actions: [
          ShopCart(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          children: List.generate(
              products.length, (i) => ProductContainer(products[i])),
        ),
      ),

    );
  }
}

class ProductContainer extends StatelessWidget {
  ProductContainer(this.o, {Key? key}) : super(key: key);
  Product o;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Info(o),
          )),
      child: Column(
        children: [
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            height: 130,
          ),
          Center(
            child: Column(
              children: [
                Text(o.name),
                Text('Gia: ${o.cost}/kg'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShopCart extends StatelessWidget {
  const ShopCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai2>();
    return Stack(
      children: [
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                )),
            icon: Icon(Icons.shopping_cart, size: 30)),
        Text(data.total().toString(), style: TextStyle(color: Colors.red, fontSize: 18),)
      ],
    );
  }
}
