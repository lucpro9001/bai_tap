import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'data_bai3.dart';

class Edit extends StatelessWidget {
  Edit(this.o, {Key? key}) : super(key: key);
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Item o;
  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai3>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ten mat hang',
                ),
                validator: (value) => fieldEmty(value),
                onSaved: (newValue) => o.m.ten = newValue!,
                initialValue: o.m.ten,
              ),
              SizedBox(height: 10,),
              DropdownButtonFormField(
                items: loaiMH.map((e) =>
                    DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,)
                ).toList(),
                onChanged: (value) {
                  o.m.loai = value.toString();
                },
                value: o.m.loai,
                decoration: InputDecoration(
                  labelText: 'Loai mat hang',
                ),
                validator: (value) => fieldEmty(value.toString()),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'So luong',
                ),
                validator: (value) => isNumber(value.toString()),
                onSaved: (newValue) => o.sl = int.parse(newValue.toString()),
                keyboardType: TextInputType.number,
                initialValue: o.sl.toString(),
              ),
            ],
          ),
        ),
      ),

      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              if(_formState.currentState!.validate()) {
                _formState.currentState!.save();
                data.edit(o);
                Navigator.pop(context);
              }
            }, icon: Icon(Icons.save, color: Colors.blue,),
          ),
          IconButton(
            onPressed: () {
                data.remove(o);
                Navigator.pop(context);
            }, icon: Icon(Icons.delete, color: Colors.red,),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancle'),
          )
        ],
      ),
      );
  }
  String? fieldEmty(String? value) {
    return value!.isEmpty ? 'Khong duoc de trong truong nay' : null;
  }
  String? isNumber(String? value) {
    if(fieldEmty(value) != null) return fieldEmty(value);
    int t;
    try {
      t = int.parse(value!);
    } catch(e) {
      return 'Bat buoc la so > 0';
    }
    if(t <= 0) return 'so nguyen > 0';
    return null;
  }
}
