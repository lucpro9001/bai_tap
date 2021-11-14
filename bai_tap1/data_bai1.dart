import 'package:flutter/foundation.dart';

class Diary {
  String id, date, mood, note;
  Diary(this.id, this.date, this.mood, this.note);
}

class DataBai1 extends ChangeNotifier {
  List<Diary> _list = [
    Diary('01', 'Dec 7, 2020', 'Happy', 'Tet nguyen dang'),
    Diary('02', 'Dec 8, 2020', 'Happy', 'Tet nguyen dang'),
    Diary('03', 'Dec 8, 2020', 'Poor', 'Tet nguyen dang'),
    Diary('04', 'Dec 9, 2021', 'Sad', 'Tet nguyen dang'),
  ];
  List<Diary> _res = [];

  List<Diary> get list => _list;
  List<Diary> get res => _res;
  add(Diary o) {
    _list.add(o);
    notifyListeners();
  }

  edit(Diary o) {
    _list.forEach((e) {
      if (e.id == o.id) {
        e = o;
        notifyListeners();
        return;
      }
    });

  }
  List<Diary> _filter(List<Diary> l, String c, String t) {
    if(c.isEmpty) return l;
    switch(t) {
      case 'mood': return l.where((element) => element.mood.contains(c)).toList();
      case 'date': return l.where((element) => element.date.contains(c)).toList();
      default:     return l;
    }
  }
  search(String date, String mood) {
    _res = _filter(_list, date, 'date');
    _res = _filter(_res, mood, 'mood');
    notifyListeners();
  }

  remove(Diary o) {
    _list.remove(o);
    _res.remove(o);
    notifyListeners();
  }
}
