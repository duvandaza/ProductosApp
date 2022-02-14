import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {



    final snackBar = new SnackBar(
      elevation: 1,
      backgroundColor: Colors.red,
      content: Container(
        height: 30,
        child: Center(child: Text(message, style: TextStyle( color: Colors.white, fontSize: 20 ),))
      )
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }


}