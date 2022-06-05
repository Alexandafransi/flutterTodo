import 'dart:convert';
import 'package:collection/collection.dart';

List<Map<String, dynamic>> datajson = [
  {'id':1,'name':'alexanda'},
  {'id':2,'name':'alexanda'},
  {'id':3,'name':'alexanda'},
  {'id':4,'name':'alexanda'},
];

void display(){
  // var l= groupBy(datajson, (Map,object)=>object['id']);
  // var newMap = groupBy(datajson, (obj) => obj['id']);

  for(var i=0;i<datajson.length;i++){
    print(datajson[i]['name']);
  }
}