import 'package:flutter/material.dart';

class CanliMuzayede extends StatelessWidget {
  int muzayede_id;
  CanliMuzayede(int muzayede_id){
    this.muzayede_id = muzayede_id;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(muzayede_id.toString() + ". Muzayede Devam Ediyor"),
    );
  }

}