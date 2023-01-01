import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Provider/scan_data.dart';
import '../../components/box.dart';
import '../../constants.dart';
import '../../model/create.dart';
import '../../sava_qr_code.dart';

class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  GlobalKey globalKey = GlobalKey();
  late String _dataString;

  TextEditingController controller = TextEditingController();
  late String controller1;
  Color primaryColor = Colors.grey;
  late List<bool> isSelected;
  String hinttext = "Please enter channel name";
  int? defaultChoiceIndex;
  List<String> _choicesList = ['Channel Name', 'URL'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    defaultChoiceIndex = 0;
  }

  bool ispress = true;
  Future<void> deviceInfo() async {
    if (ispress == true) {
      // _dataString = "https://youtu.be/${controller.text}";
      // _dataString = "https://www.youtube.com/watch?v=${controller.text}";
      _dataString = "https://www.youtube.com/c/${controller.text}";
    } else {
      _dataString = "${controller.text}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Boxy(text: "Youtube", image: "youtube"),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Wrap(
                        spacing: 5.w,
                        children: List.generate(_choicesList.length, (index) {
                          return ChoiceChip(
                            labelPadding: EdgeInsets.all(5.0.w),
                            backgroundColor: Colors.white,
                            label: Text(
                              _choicesList[index],
                              style: TextStyle(
                                color: defaultChoiceIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            selected: defaultChoiceIndex == index,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    topRight: Radius.circular(5.r),
                                    bottomLeft: Radius.circular(5.r),
                                    bottomRight: Radius.circular(5.r))),
                            selectedColor: Constants.primaryColor,

                            onSelected: (value) {
                              setState(() {
                                defaultChoiceIndex =
                                    value ? index : defaultChoiceIndex;
                                controller1 = _choicesList[index];
                                if (_choicesList[index] == "URL") {
                                  hinttext = "Please enter URL";
                                  ispress = false;
                                }

                                if (_choicesList[index] == "Channel Name") {
                                  hinttext = "Please enter Channel name";
                                  ispress = true;
                                }
                              });
                            },
                            // backgroundColor: color,
                            pressElevation: 0,
                            side: BorderSide(
                              color: Colors.grey.shade200,
                              width: 0.9.h,
                            ),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      _formKey.currentState!.validate();

                      setState(() {
                        primaryColor = val.isNotEmpty
                            ? Constants.primaryColor
                            : Colors.grey;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the value first';
                      }
                      return null;
                    },

                    // maxLines: null,
                    minLines: 1,
                    controller: controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      // hintText:  "Please enter Facebook ID",
                      hintText: hinttext,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      hintStyle: Constants.hintStyle,
                      focusedBorder: Constants.border,
                      enabledBorder: Constants.border,
                      focusedErrorBorder: Constants.border,
                      border: Constants.border,
                      errorBorder: Constants.border,
                      errorStyle: Constants.errroStyle,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    style: Constants.buttonStyle(primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        deviceInfo();
                        var createDb =
                            Provider.of<ScanData>(context, listen: false);
                        createDb.addItemC(CreateQr(_dataString, "youtube"));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SaveQrCode(
                                      dataString: _dataString,
                                    )));
                      }
                    },
                    child: Text(
                      "Create",
                      style: Constants.buttonText,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
                // children: [_contentWidget()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
