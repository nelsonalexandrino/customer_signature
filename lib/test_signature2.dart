import 'package:customer_signature/test_signature1.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signature2 extends StatefulWidget {
  @override
  _Signature2State createState() => _Signature2State();
}

class _Signature2State extends State<Signature2> {
  var _signatureCanvas = Signature(
    penStrokeWidth: 10,
    penColor: Colors.amber,
    width: 300,
    height: 300,
    backgroundColor: Colors.white,
  );

  clearSignature() {
    setState(() {
      _signatureCanvas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEEE4),
      appBar: AppBar(
        title: Text('Customer singature 2'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.signature),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signature1()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: _signatureCanvas,
      ),
    );
  }
}
