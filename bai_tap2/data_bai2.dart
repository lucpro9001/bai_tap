
import 'dart:math';

import 'package:flutter/foundation.dart';

class Product {
  String id, name, des;
  double cost;
  Product(this.id, this.name, this.cost, this.des);
}

List<Product> products = [
  Product('01', 'cam', 300,'cam la 1 loai xuat xu Phan Thiet'),
  Product('02', 'hanh', 220,'cam la 1 loai xuat xu Phan Thiet'),
  Product('03', 'man', 200,'cam la 1 loai xuat xu Phan Thiet'),
  Product('04', 'chuoi', 230,'cam la 1 loai xuat xu Phan Thiet'),
  Product('05', 'quyt', 500,'cam la 1 loai xuat xu Phan Thiet'),
  Product('06', 'tom', 250,'cam la 1 loai xuat xu Phan Thiet'),
  Product('07', 'thanh long', 100,'cam la 1 loai xuat xu Phan Thiet'),
  Product('08', 'ca', 300,'cam la 1 loai xuat xu Phan Thiet'),
  Product('09', 'chom chom', 220,'cam la 1 loai xuat xu Phan Thiet'),
  Product('10', 'chim', 200,'cam la 1 loai xuat xu Phan Thiet'),
  Product('11', 'buoi', 240,'cam la 1 loai xuat xu Phan Thiet'),
  Product('12', 'ga', 203,'cam la 1 loai xuat xu Phan Thiet'),
  Product('13', 'mang', 250,'cam la 1 loai xuat xu Phan Thiet'),
  Product('14', 'vv', 250,'cam la 1 loai xuat xu Phan Thiet'),
];

class Item {
  Product p;
  int sl = 1;
  Item(this.p);
  add() {
    sl++;
  }
  bool remove() {
    return --sl > 0 ? true : false;
  }
}

class DataBai2 extends ChangeNotifier {
  List<Item> _products = [
    Item(products[0]),
  ];

  List<Item> get product => _products;


  add(Product o) {
    for(int i = 0; i < _products.length; i++) {
      if(_products[i].p.id == o.id) {
        _products[i].add();
        notifyListeners();
        return;
      }
    }
    _products.add(Item(o));
    notifyListeners();
  }

  remove(Product o) {
    _products.forEach((e) {
      if(e.p.id == o.id) {
        bool f = e.remove();
        if(!f) _products.remove(e);
        notifyListeners();
        return;
      }
    });

  }
  eliminate(Item o) {
    _products.remove(o);
    notifyListeners();
  }

  int total() {
    int s = 0;
    _products.forEach((element) {
      s += element.sl;
    });
    return s;
  }

  double cost() {
    double c = 0;
    _products.forEach((element) {
      c += element.p.cost * element.sl;
    });
    return c;
  }















}