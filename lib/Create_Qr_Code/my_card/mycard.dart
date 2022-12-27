import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Provider/scan_data.dart';
import '../../../components/box.dart';
import '../../../model/create.dart';
import '../../../sava_qr_code.dart';
import '../../constants.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  GlobalKey globalKey = GlobalKey();
  late String _dataString;
  bool? physicaldevice;
  TextEditingController controller = TextEditingController();
  Color primaryColor = Colors.grey;

  TextEditingController controller2 = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> deviceInfo() async {
    String Name = "Name:${controller.text}";
    String email = "Phone no.: ${controller1.text}";
    String address = "Address:${controller3.text}";
    String birthdate = "BirthDate:$birthDateInString";
    String org = "Org:${controller4.text}";
    String note = "Note:${controller5.text}";
    _dataString = "$Name,\n$email,\n$address,\n$birthDate,\n$org,\n$note";
  }

  String? birthDateInString;
  DateTime? birthDate;
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;

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
                  Boxy(text: "My Card", image: "mycard"),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        minLines: 1,
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter your name",
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
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "Phone number",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        minLines: 1,
                        controller: controller1,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter phone number",
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
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "E-mail",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        minLines: 1,
                        controller: controller2,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter email id",
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
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: controller3,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter your address",
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
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "BirthDate",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0.r),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              onPressed: () async {
                                {
                                  final datePick = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  if (datePick != null &&
                                      datePick != birthDate) {
                                    setState(() {
                                      birthDate = datePick;
                                      isDateSelected = true;

                                      birthDateInString =
                                          "${birthDate!.day}/${birthDate!.month}/${birthDate?.year}"; // 08/14/2019
                                    });
                                  }
                                }
                              },
                              child: Text(
                                isDateSelected
                                    ? "$birthDateInString"
                                    : "initialDate",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "Org",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        minLines: 1,
                        controller: controller4,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter your Org name",
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
                        height: 7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: const Text(
                          "Note",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          _formKey.currentState!.validate();

                          setState(() {
                            primaryColor =
                                val.isNotEmpty ? Colors.blue : Colors.grey;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value first';
                          }
                          return null;
                        },
                        minLines: 5,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: controller5,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Please enter your note",
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
                    ],
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
                          createDb.addItemC(CreateQr(_dataString, "mycard"));
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
                      )),
                  SizedBox(
                    height: 100.h,
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
