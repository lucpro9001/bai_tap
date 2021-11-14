
import 'package:flutter/foundation.dart';

List<String> loaiMH = ['Dien thoai', 'Laptop', 'Tivi', 'Tu lanh', 'Noi com', 'Dieu hoa'];

class MatHang {
  String id, ten, loai;

  MatHang(this.id, {this.loai='', this.ten=''});
}

class Item {
  MatHang m;
  int sl;
  Item(this.m, {this.sl=1});
}

class DataBai3 extends ChangeNotifier {
  List<Item> _list = [
    Item(MatHang('01', loai: loaiMH[0], ten: 'bbb')),
    Item(MatHang('02', loai: loaiMH[2], ten: 'bsb')),
    Item(MatHang('03', loai: loaiMH[1], ten: 'bgb')),
    Item(MatHang('04', loai: loaiMH[5], ten: 'b4b')),
  ];
  List<Item> _res = [];
  List<Item> get list => _list;
  List<Item> get res => _res;

  add(Item o) {
    _list.add(o);
    notifyListeners();
  }

  edit(Item o) {
    _list.forEach((element) {
      if(element.m.id == o.m.id) {
        element = o;
        notifyListeners();
        return;
      }
    });
  }

  remove(Item o) {
    _list.remove(o);
    _res.remove(o);
    notifyListeners();
  }
  List<Item> _filter(List<Item> l, String c, String t) {
    if(c.isEmpty) return l;
    switch(t) {
      case 'name': return l.where((element) => element.m.ten.contains(c)).toList();
      case 'loai': return l.where((element) => element.m.loai.contains(c)).toList();
      default:     return l;
    }
  }
  search(String name, String loai) {
    _res = _filter(_list, name, 'name');
    _res = _filter(_res, loai, 'loai');
    notifyListeners();
  }
}