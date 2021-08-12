import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class FormBoxWidget extends StatefulWidget {
  @override
  _FormBoxWidgetState createState() => _FormBoxWidgetState();
}

class _FormBoxWidgetState extends State<FormBoxWidget> {
  // To get all the details from the textEditor
  final _purchaserNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailIdController = TextEditingController();
  final _gstNumberController = TextEditingController();
  final _taxInvoiceNumberController = TextEditingController();
  final _billAmountController = TextEditingController();
  final _gstRateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  // late File _storedImage;

  void _submitData() {
    //To get all details and convert them to string
    final purschaserName = _purchaserNameController.text;
    final mobileNumber = _mobileNumberController.text;
    final emailId = _emailIdController.text;
    final gstNumber = _gstNumberController.text;
    final taxInvoice = _taxInvoiceNumberController.text;
    final billAmount = _billAmountController.text;
    final gstRate = _gstRateController.text;

    //Validation which are implement on all the inputs

    if (purschaserName.isEmpty || purschaserName.length >= 20) {
      //TO check is name box is empty or name is too long
      Fluttertoast.showToast(msg: 'Please enter correct name');
    } else if (mobileNumber.isEmpty || mobileNumber.length == 11) {
      // To check if mobile number entered is correct or not
      Fluttertoast.showToast(msg: 'Please enter the correct mobile number');
    } else if (gstNumber[0] != '0' &&
        gstNumber[1] != '7' &&
        gstNumber.length == 15) {
      //To check if gst number starting letter contains 07 or not and also if gst number lenght is equal to 15.
      Fluttertoast.showToast(msg: 'Please enter the correct GST number');
    } else if (taxInvoice.isEmpty) {
      //To check Tax Invoice number
      Fluttertoast.showToast(
          msg: 'Please enter the correct Tax Invoice number');
    } else if (billAmount.isEmpty) {
      //To check Bill Amount
      Fluttertoast.showToast(msg: 'Please enter the correct Bill Amount');
    } else if (gstRate.isEmpty) {
      //To check GST Rate
      Fluttertoast.showToast(msg: 'Please enter the correct GST Rate');
    } else {
      // To generate Beneficiary ID
      Fluttertoast.showToast(
          msg:
              '$purschaserName \n $mobileNumber \n $emailId \n $gstNumber \n $taxInvoice \n $billAmount \n $gstRate \n ${DateFormat('dd/MM/yyyy').format(_selectedDate)}');

      // To generate random alphanumeric for benficiary id
      String beneficiaryid = randomAlphaNumeric(10);
      Fluttertoast.showToast(msg: beneficiaryid);
    }
  }

  //To desing Name input
  Widget _wigName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(labelText: 'Name of Purchaser'),
        controller: _purchaserNameController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To desing Mobile input
  Widget _wigMobileNUmber() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(labelText: 'Enter Mobile number'),
        controller: _mobileNumberController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To desing Email ID input
  Widget _wigEmailId() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Enter Email Id (optional)'),
        controller: _emailIdController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To desing Gst Number input
  Widget _wigGstNumber() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(labelText: 'Enter GST number'),
        controller: _gstNumberController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To desing Tax Invoice Number input
  Widget _wigTaxInvoiceNumber() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(labelText: 'Enter Tax invoice/Book number'),
        controller: _taxInvoiceNumberController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To implement Date Picker
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return print('not date picked');
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  //To desing Bill Amount input
  Widget _wigBillAmount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Enter Bill Amount/Taxable value (excluding GST)'),
        controller: _billAmountController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  //To desing Gst Rae input input
  Widget _wigGstRate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(labelText: 'Enter GST Rate'),
        controller: _gstRateController,
        onSubmitted: (_) => _submitData(),
      ),
    );
  }

  // //To add Bill photo

  // Future<XFile?> _takePicture() async {
  //   // final imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 600,maxWidth: 600,preferredCameraDevice: CameraDevice.rear, imageQuality: lowerAlphaEnd );
  //   final picker = ImagePicker();
  //   final imageFile = await picker.getImage(
  //       source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
  //       _storedImage = File(imageFile.path);
  // }

  Widget _wigtoAddBillPhoto() {
    // return Row(children: <Widget>[
    //   Container(
    //     width: 100,
    //     height: 100,
    //     decoration:
    //         BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
    //     child: _storedImage == null
    //         ? Image.file(
    //             _storedImage,
    //             fit: BoxFit.cover,
    //             width: double.infinity,
    //           )
    //         : Text('No Image taken'),
    //     alignment: Alignment.center,
    //   ),
    //   SizedBox(
    //     width: 10,
    //   ),
    //   Expanded(
    //     child: FlatButton.icon(
    //       icon: Icon(Icons.camera),
    //       label: Text(
    //         'Take Bill Picture',
    //         textAlign: TextAlign.center,
    //       ),
    //       textColor: Colors.blue,
    //       onPressed: _takePicture,
    //     ),
    //   )
    // ]);

    return Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Center(
            child: Text(
              'No Image taken',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(Icons.camera_alt),
        label: Text('Bill Photo'),
        textColor: Colors.blue,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          //This to put red box
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
            ),
            child: SingleChildScrollView(
              //To make form scrollable
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        //Fill form logo
                        'Please fill the deails',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    //Form design added here
                    children: <Widget>[
                      _wigName(),
                      _wigMobileNUmber(),
                      _wigEmailId(),
                      _wigGstNumber(),
                      _wigTaxInvoiceNumber(),
                      Container(
                        //To set Date picker
                        height: 70,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(_selectedDate == null
                                  ? 'No date choosen!'
                                  : 'Picked Date : ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
                            ),
                            FlatButton(
                              onPressed: _showDatePicker,
                              textColor: Theme.of(context).primaryColor,
                              child: Text(
                                'Choose Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _wigBillAmount(),
                      _wigGstRate(),
                      _wigtoAddBillPhoto(),
                    ],
                  ),
                  RaisedButton(
                    //Button to call submit method and validate enteries
                    child: Text(
                      'Upload Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: _submitData,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
