import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_bai2.dart';
import 'giai_cuu_nong_san.dart';

class Info extends StatelessWidget {
  Info(this.o, {Key? key}) : super(key: key);
  Product o;
  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai2>();
    return Scaffold(
      appBar: AppBar(
          title: Text('Chi tiet'),
          actions: [ShopCart()],

      ),
      body: Column(
        children: [
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          Text(o.name),
          Text(o.des),
          Text('Gia: ${o.cost}/kg'),
          Divider(),
          IconButton(
            onPressed: () {
              data.add(o);
            },
            icon: Icon(Icons.add_shopping_cart), color: Colors.red,)
        ],
      ),
    );
  }
}
