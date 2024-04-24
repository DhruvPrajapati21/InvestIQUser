import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LongTermModel {// Add the id field
  final String id;
  final String status;
  final String stockName;
  final String cmp;
  final String target;
  final String sl;
  final String remark;
  final String date;



  LongTermModel(
      {required this.id,required this.status ,required this.stockName,required this.cmp,required this.target,required this.sl,required this.remark,required this.date,});

  factory LongTermModel.fromSnapshot(DocumentSnapshot snapshot) {
    return LongTermModel(// Assign the document ID to the id field
      id: snapshot.id,
      status: snapshot['status'],
      stockName: snapshot['stockName'],
      cmp: snapshot['cmp'],
      target: snapshot['target'],
      sl: snapshot['sl'],
      remark: snapshot['remark'],
      date: snapshot['date'],



    );
  }
}
