import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class IntradayModel {// Add the id field
  final String status;
  final String stockName;
  final String cmp;
  final String target;
  final String sl;
  final String remark;
  final String date;



  IntradayModel(
      {required this.status ,required this.stockName,required this.cmp,required this.target,required this.sl,required this.remark,required this.date,});

  factory IntradayModel.fromSnapshot(DocumentSnapshot snapshot) {
    return IntradayModel(// Assign the document ID to the id field
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
