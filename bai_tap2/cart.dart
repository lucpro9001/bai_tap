import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_bai2.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai2>();
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, i) => ClickBar(data.product[i]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: data.product.length),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Total cost: ${data.cost()}\$'),
          TextButton(
            onPressed: null,
            child: Text(
              'Thanh toan',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class ClickBar extends StatelessWidget {
  ClickBar(this.o, {Key? key}) : super(key: key);
  Item o;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Column(
          children: [Text(o.p.name), Text('Gia: ${o.p.cost}/kg')],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  var data = context.read<DataBai2>();
                  data.add(o.p);
                },
                icon: Icon(Icons.add),
              ),
              Text(o.sl.toString()),
              IconButton(
                onPressed: () {
                  var data = context.read<DataBai2>();
                  data.remove(o.p);
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  var data = context.read<DataBai2>();
                  data.eliminate(o);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
