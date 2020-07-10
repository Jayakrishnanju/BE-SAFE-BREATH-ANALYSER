import 'package:flutter/material.dart';
import 'package:instant_location/btDeviceConnectPage.dart';

void main() => runApp(ILoginPage());

class ILoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B-Safe',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ILoginHomePage(title: 'B-Safe'),
    );
  }
}

class ILoginHomePage extends StatefulWidget {
  ILoginHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  ILoginHomePageState createState() => ILoginHomePageState();
}

class ILoginHomePageState extends State<ILoginHomePage> {
  final rmControl1 = TextEditingController();
  final rmControl2 = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.indigo,
        appBar: new AppBar(
          title: new Text("B-Safe Login"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: new Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: AssetImage("assets/images/check2.jpg"),
            fit: BoxFit.cover,
            // color: Colors.indigo,
            // colorBlendMode: BlendMode.color,
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Form(
                    child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.blue,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.pink, fontSize: 17.0))),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        controller: rmControl1,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        decoration: const InputDecoration(
                            labelText: 'User Name',
                            icon: const Padding(
                                padding: const EdgeInsets.symmetric(),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.pink,
                                ))),
                      ),
                      new TextFormField(
                        controller: rmControl2,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            icon: const Padding(
                                padding: const EdgeInsets.symmetric(),
                                child: const Icon(
                                  Icons.lock,
                                  color: Colors.pink,
                                ))),
                        obscureText: true,
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 22.0)),
                      new ButtonTheme(
                        minWidth: 230.0,
                        //height: 100.0,
                        child: RaisedButton(
                          child: Text('Login'),
                          color: Colors.purple,
                          textColor: Colors.white70,
                          onPressed: () {
                            if (rmControl1.text == "admin" &&
                                rmControl2.text == "1234") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BluetoothMasterHome(),
                                  ));
                            } else {
                              show("Invalid Login");
                            }
                          },
                        ),
                      ),
                    ],
               ),
          ),
        ]));
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 2),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 800));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.indigo,
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instant_location/finalDataSelectionPage.dart';

class ImageCapturePage extends StatefulWidget {
  final String textFromBTDevice;

  ImageCapturePage({Key key, @required this.textFromBTDevice})
      : super(key: key);



  @override
  ImageCapturePageState createState() => ImageCapturePageState();
}

class ImageCapturePageState extends State<ImageCapturePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final picker = ImagePicker();
  String captureText, image;
  var picture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    captureText = this.widget.textFromBTDevice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(
              child: Text(
            "Capture Image",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          )),
          backgroundColor: Colors.purple,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            color: Colors.white70,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      capturePicFromCam();
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Capture\n Image",
                              style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 110,
                  ),
                  ButtonTheme(
                    minWidth: 160.0,
                    height: 45.0,
                    //width:2,
                    child: RaisedButton(
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {

                        if (picture != null) {
                          show("Please Wait");
                          Future.delayed(const Duration(milliseconds: 2000),
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FinalDataSelectionPage(
                                      image: picture, deviceData: captureText)),
                            );
                          });
                        } else {
                          show("Please capture the image to proceed");
                        }
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future capturePicFromCam() async {
    picture = await picker.getImage(source: ImageSource.camera);
    if (picture != null) {
      show("Image Captured");
    } else {
      show("Please select Ok to capture image");
    }
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 2),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.indigo,
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:instant_location/textFromBTDevice.dart';

class BluetoothMasterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Instant Location',
      home: new BluetoothMaster(),
      theme: new ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}

class BluetoothMaster extends StatefulWidget {
  @override
  BluetoothMasterState createState() => BluetoothMasterState();
}

class BluetoothMasterState extends State<BluetoothMaster> {
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Get the instance of the Bluetooth
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  BluetoothConnection connection;
  BluetoothDevice _device;

  // Define some variables, which will be required later
  String asciiData;
  int deviceState;
  int count = 0;
  bool isDisconnecting = false;

  bool submitting = false;
  bool _connected = false;
  bool _isButtonUnavailable = false;
  // To track whether the device is still connected to Bluetooth
  bool get isConnected => connection != null && connection.isConnected;

  List<BluetoothDevice> _devicesList = new List<BluetoothDevice>();
  List<String> dataList = new List<String>();
  List<BluetoothDevice> devices = [];

  ////////////////////////////////

  @override
  void initState() {
    super.initState();

    // Get current state
    _bluetooth.state.then((state) {
      setState(() {
        bluetoothState = state;
      });
    });
    deviceState = 0; // neutral

    // If the bluetooth of the device is not enabled
    enableBluetooth();

    // Listen for further state changes
    _bluetooth.onStateChanged().listen((BluetoothState state) {
      setState(() {
        bluetoothState = state;
        if (bluetoothState == BluetoothState.STATE_OFF) {
          _isButtonUnavailable = true;
        }
        getPairedDevices();
      });
    });
  }

  // Request Bluetooth permission from the user

  // For retrieving and storing the paired devices
  // in a list.

  // Request Bluetooth permission from the user
  Future<void> enableBluetooth() async {
    bluetoothState = await FlutterBluetoothSerial.instance.state;

    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  // For retrieving and storing the paired devices
  // in a list.
  Future<void> getPairedDevices() async {
    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [__devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  //ADHEESH CODE CHANGES FROM HERE

  void connect() async {
    if (_device == null) {
      show('No device selected');
    } else {
      if (!isConnected) {
        setState(() => submitting = !submitting);

        await BluetoothConnection.toAddress(_device.address)
            .then((_connection) {
          setState(() => _isButtonUnavailable = true);

          print('Connected to the device');
          connection = _connection;
          show('Device connected');
        }).catchError((error) {
          print('Cannot connect, exception occurred');
          print(error);
          submitting = true;
          show('Device not Active');
        });
        setState(() => submitting = !submitting);
      } else {
        show('Device not Active');
      }
      displayDeviceData();
    }
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devicesList.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

  void disconnect() async {
    setState(() {
      _isButtonUnavailable = true;
      deviceState = 0;
    });

    print(connection.toString());
    await connection.close();

    if (!connection.isConnected) {
      setState(() {
        _connected = false;
        _isButtonUnavailable = false;
      });
    }
    print("Disconnected");
  }

  void displayDeviceData() {
    DateTime currentPhoneDate = DateTime.now();
    if (connection != null) {
      connection.input.listen((Uint8List data) async {
        //Data entry point
        asciiData = ascii.decode(data);
        print("Inside display Device");
        asciiData = asciiData + currentPhoneDate.toString();
        dataList.add(asciiData);
        var dataListSize = dataList.length;
        print(dataListSize.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,

        appBar: AppBar(
          title: Center(
              child: Text(
            "Connect Bluetooth Device",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          )),
          backgroundColor: Colors.purple,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            color: Colors.white70,
            onPressed: () {
              showAlertDialog();
            },
          ),
        ),
        body: new Container(
          padding: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Column(
            children: <Widget>[
              new SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        "PAIRED DEVICES",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          //fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          DropdownButton(
                            items: _getDeviceItems(),
                            onChanged: (value) =>
                                setState(() => _device = value),
                            value: _devicesList.isNotEmpty ? _device : null,
                          ),
                          GestureDetector(
                            onTap: () {
                              connect();
                              setState(() {
                                /* if(_isButtonUnavailable)
                                 Element(this.widget).deactivate();
                                 _isButtonUnavailable
                                  ? null
                                  : _connected ? disconnect : connect;*/
                              });
                            },
                            child: Container(
                              height: 55,
                              width: 120,
                              child: new Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Connect \n Device",
                                      style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                boxShadow: [
                                  BoxShadow(blurRadius: 2.0),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new SizedBox(
                height: 110,
              ),
              GestureDetector(

                onTap: () {
                  onProceedActions(context);
                  setState(() {

                  });
                },
                child: Container(
                  height: 55,
                  width: 120,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Display\n  Data',
                          style: TextStyle(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    boxShadow: [
                      BoxShadow(blurRadius: 2.0),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              submitting
                  ? new Container(
                      color: Colors.transparent,
                      height: 40,
                      width: 40,
                      child: const CircularProgressIndicator(
                        backgroundColor: Colors.amber,
                      ))
                  : new Container(
                      color: Colors.transparent,
                      height: 3,
                    ),
            ],
          ),
        ),

        //resizeToAvoidBottomPadding: true,
      ),
    );
  }

  void onProceedActions(BuildContext context) {
    if (_device == null && _connected) {
      print('No device selected');
      show('Device Not Selected or Active');
    } else {
      String hc05Data;
      if (dataList.length > 0) {
        setState(() {
          submitting = !submitting;
          hc05Data = dataList.first;
        });
        disconnect();
        dataList.clear();

        Future.delayed(const Duration(milliseconds: 2200), () {
          setState(() {
            submitting = !submitting;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DisplayBTText(textFromBTDevice: hc05Data)),
          );
        });
      } else {
        show("Please connect Device to Proceed");
      }
    }
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 1),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.indigo,
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }

  Future<void> showAlertDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Exit Application?',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.cyan,
                )),
            content: Text('Accept',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown[900],
                )),
            actions: <Widget>[
              FlatButton(
                child: Text('No',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.cyan,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Yes',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.cyan,
                    )),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
            elevation: 10,
            backgroundColor: Colors.indigo[400],
          );
        });
  }
}


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instant_location/displayFinalPdf.dart';
import 'package:path_provider/path_provider.dart';



import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdw;

class FinalDataSelectionPage extends StatefulWidget {
  final PickedFile image;
  final String deviceData;

  FinalDataSelectionPage(
      {Key key, @required this.image, @required this.deviceData})
      : super(key: key);

  @override
  FinalDataSelectionPageState createState() =>
      new FinalDataSelectionPageState();
}

class FinalDataSelectionPageState extends State<FinalDataSelectionPage> {
  PickedFile imageFile;
  File pdfFile;
  String latitude, longitude;
  String docsPath, bleDeviceData;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final rmControl1 = TextEditingController();
  final rmControl2 = TextEditingController();
  final picker = ImagePicker();
  pdw.Document pdf;

  @override
  void initState() {
    print("Inside Init");
    // TODO: implement initState
    super.initState();
    setState(() {
      imageFile = this.widget.image;
      bleDeviceData = this.widget.deviceData;
      latitude = "";
      longitude = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Container(
            height: 210,
            width: 400,
            child: new Image.file(File(imageFile.path), fit: BoxFit.fitWidth),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 5.0),
            child: new Column(children: <Widget>[
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 30.0)),
                  new Row(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          showAlertDialog();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          new Positioned(
            bottom: 40,
            left: 10,
            right: 20,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            showLocation();
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 120,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.gps_fixed,
                                  color: Colors.purple,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  "Fetch GPS \n      Data",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            boxShadow: [
                              BoxShadow(blurRadius: 2.0),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {});
                          show(bleDeviceData);
                        },
                        child: Container(
                          height: 70,
                          width: 120,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.bluetooth,
                                  color: Colors.indigo[800],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  "Display Device \n        Data",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            boxShadow: [
                              BoxShadow(blurRadius: 2.0),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Form(
                              child: new Theme(
                            data: new ThemeData(
                                brightness: Brightness.dark,
                                primarySwatch: Colors.green,
                                inputDecorationTheme: new InputDecorationTheme(
                                    labelStyle: new TextStyle(
                                        color: Colors.indigo[700],
                                        fontSize: 15.0))),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new TextFormField(
                                  controller: rmControl1,
                                  decoration: const InputDecoration(
                                      //labelText: 'Remarks1 here',
                                      hintText: 'Remarks1 here',
                                      icon: const Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: const Icon(
                                              Icons.insert_comment))),
                                ),
                                new TextFormField(
                                  controller: rmControl2,
                                  decoration: const InputDecoration(
                                      hintText: 'Remarks2 here',
                                      icon: const Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: const Icon(
                                              Icons.insert_comment))),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () async {
                      await generatePDFActivity(context);
                    },
                    child: Container(
                      height: 65,
                      width: 140,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              "Generate \n    PDF",
                              style: TextStyle(
                                color: Colors.indigo[700],
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   generatePDFActivity(BuildContext context) async {

    if (latitude.isNotEmpty && longitude.isNotEmpty) {
      createPdf();
      await savePdf();

      Future.delayed(const Duration(milliseconds: 2000), () {
        show("Please wait for PDF...");
        clearContents();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DisplayPdf(
                    pdfFile1: pdfFile,
                  )),
        );

        pdf = pdw.Document();
      });
    } else {
      show("Please Fetch GPS Data");
    }
  }

   void clearContents() {
     rmControl1.clear();
     rmControl2.clear();
     latitude = "";
     longitude = "";

   }

  //Methods from here

  void createPdf() {
    //Adding pages for PDF
    pdf = pdw.Document();
    pdf.addPage(
      pdw.Page(
        pageFormat: PdfPageFormat.a5,
        margin: pdw.EdgeInsets.all(32),
        build: (pdw.Context context) {
          return pdw.Center(
            child: pdw.Image(getImageFileForPDF()),
          );
        },
      ),
    );
    pdf.addPage(
      pdw.Page(
        pageFormat: PdfPageFormat.a5,
        margin: pdw.EdgeInsets.all(32),
        build: (pdw.Context context) {
          return pdw.Center(
            child: pdw.Container(
              child: pdw.Column(
                  mainAxisAlignment: pdw.MainAxisAlignment.center,
                  children: <pdw.Widget>[
                    pdw.Header(
                        level: 3,
                        textStyle: pdw.TextStyle(
                            color: PdfColors.blue,
                            fontSize: 18,
                            fontWeight: pdw.FontWeight.bold),
                        //,
                        child: pdw.Text("Present location:")),
                    pdw.Paragraph(
                        style:
                            pdw.TextStyle(color: PdfColors.blue, fontSize: 12),
                        textAlign: pdw.TextAlign.left,
                        text: "Latitude is:   $latitude"
                                "\n" +
                            "Longitude is:    $longitude" +
                            "\n"),
                    pdw.Header(
                        level: 3,
                        textStyle: pdw.TextStyle(
                          color: PdfColors.blue,
                          fontSize: 18,
                          //fontWeight: pdw.FontWeight.bold
                        ),
                        //,
                        child: pdw.Text("Data from Device: ")),
                    pdw.Paragraph(
                        style:
                            pdw.TextStyle(color: PdfColors.blue, fontSize: 12),
                        textAlign: pdw.TextAlign.left,
                        text: bleDeviceData),
                    pdw.Header(
                        level: 3,
                        textStyle: pdw.TextStyle(
                          color: PdfColors.blue,
                          fontSize: 18,
                          //fontWeight: pdw.FontWeight.bold
                        ),
                        //,
                        child: pdw.Text("Remarks:")),
                    pdw.Paragraph(
                        style:
                            pdw.TextStyle(color: PdfColors.blue, fontSize: 12),
                        textAlign: pdw.TextAlign.left,
                        text: rmControl1.text + "\n" + rmControl2.text),
                  ]),
            ),
          );
        },
      ),
    );
  }

  PdfImage getImageFileForPDF() {
    //Getting image as pdw.image file
    final image = PdfImage.file(
      pdf.document,
      bytes: File("${imageFile.path}").readAsBytesSync(),
    );
    return image;
  }

  Future savePdf() async {
    //Saving pdf file

   Directory documentDirectory = await getExternalStorageDirectory();
    docsPath = documentDirectory.path;
    print(docsPath);
    pdfFile = File("$docsPath/sample2.pdf");
    pdfFile.writeAsBytesSync(pdf.save());

    if (pdfFile != null) {
      print(pdfFile.toString());
    }
  }

//Method to capture GPS Location
  void showLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (position == null) print("object null");

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    show("Latitude is :$latitude\nLongitude is: $longitude");

    print("Latitude is \n $latitude ");
    print("Longitude is \n $longitude");
  }

  Future<void> showAlertDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Exit Application?',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.cyan,
                )),
            content: Text('Accept',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown[900],
                )),
            actions: <Widget>[
              FlatButton(
                child: Text('No',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.cyan,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Yes',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.cyan,
                    )),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
            elevation: 10,
            backgroundColor: Colors.indigo[400],
          );
        });
  }




  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.indigo,
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}



********************************************************************************************************************************************************


