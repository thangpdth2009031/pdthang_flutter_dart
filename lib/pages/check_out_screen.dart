import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/widgets/app_bar_container.dart';
import 'package:pdthang/widgets/item_button_widget.dart';
import 'package:pdthang/widgets/item_trip_widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  static const routeName = "/main_page";

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _formKey = GlobalKey<FormState>();

  bool emailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  late TextEditingController _textEditingController;
  int initNumber = 0;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: initNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppBarContainer(
        titleString: 'Book a trip',
        child: Column(
          children: [
            SizedBox(
              height: kMinPadding,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemTrip(),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 1.2 / 3,
                              child: TextFormField(
                                enabled: true,
                                autocorrect: false,
                                controller: _textEditingController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Number of adult';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Adult',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      FontAwesomeIcons.user,
                                      color: Colors.black,
                                      size: 14,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(kItemPadding))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: kItemPadding),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  height: 16 / 14,
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 1.2 / 3,
                              child: TextFormField(
                                enabled: true,
                                autocorrect: false,
                                controller: _textEditingController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Number of child';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Child',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      FontAwesomeIcons.child,
                                      color: Colors.black,
                                      size: 14,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(kItemPadding))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: kItemPadding),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  height: 16 / 14,
                                ),
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TextFormField(
                        enabled: true,
                        autocorrect: false,
                        validator: (value) {
                          if (!emailValid(value!)) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Please enter your phone',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(kItemPadding),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: kItemPadding)),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 16 / 14),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TextFormField(
                        enabled: true,
                        autocorrect: false,
                        validator: (value) {
                          if (!emailValid(value!)) {
                            return 'Please enter email valid';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Please enter your email',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(
                                kItemPadding,
                              ))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: kItemPadding),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height: 16 / 14,
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      ItemButtonWidget(
                        data: "Book trip now",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      )
                    ],
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
