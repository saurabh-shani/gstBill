import 'package:flutter/material.dart';
import 'package:gstvat/widgets/formbox_widget.dart';

class BillSubmissionScreen extends StatefulWidget {
  @override
  _BillSubmissionScreenState createState() => _BillSubmissionScreenState();
}

class _BillSubmissionScreenState extends State<BillSubmissionScreen> {
  Widget _logo() {
    //This widget is used to load  design and load logo
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 50), //To give some space form above
          child: Text(
            'Bill Banvao, Inaam Pao',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        //To remove status bar
        child: Scaffold(
      backgroundColor: Color(0xfff2f3f7),
      body: Stack(
        // To stack widgets on one another
        children: <Widget>[
          // For the blue background
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  )),
            ),
          ),
          // Form design
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _logo(), //To implement logo design
              FormBoxWidget(), //Directed to an Widget which contains all inputs
            ],
          )
        ],
      ),
    ));
  }
}
