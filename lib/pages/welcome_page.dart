import 'package:flutter/material.dart';
import 'package:pdthang/core/constant/color_palatte.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/model/Welcome.dart';
import 'package:pdthang/pages/main_page.dart';
import 'package:pdthang/widgets/app_text.dart';
import 'package:pdthang/widgets/button_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = ["welcome-1.jpg", "welcome-2.jpg", "welcome-3.jpg"];

  Future<List<WelcomeModel>> fetchData() async {
    try {
      final String url = 'http://192.168.137.1:8888/api/v1/welcome';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Giải mã dữ liệu nhận được từ server bằng UTF-8
        final utf8DecodedData = utf8.decode(response.bodyBytes);

        // Chuyển đổi dữ liệu UTF-8 sang JSON
        List<dynamic> jsonResponse = json.decode(utf8DecodedData);
        print(jsonResponse);
        return jsonResponse.map((data) => WelcomeModel.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }

  late Future<List<WelcomeModel>> welcomes;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    welcomes = fetchData();
  }
  void nextPage(int maxPage) {
    if (currentPage < maxPage) {
      setState(() {
        currentPage++;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: FutureBuilder<List<WelcomeModel>>(
            future: welcomes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No data available'),
                );
              } else {
                // Dữ liệu đã được tải thành công từ API
                List<WelcomeModel> data = snapshot.data!;
                int maxPage = data.length - 1;
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final WelcomeModel welcome = data[index];
                    return Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(welcome.image),
                          // Sử dụng URL hình ảnh từ API
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                          margin: const EdgeInsets.only(
                            top: 100,
                            left: kDefaultPadding,
                            right: kDefaultPadding,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: welcome.title,
                                      // Sử dụng tiêu đề từ API
                                      size: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    AppText(
                                      text: welcome.subTitle,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: AppText(
                                        text: welcome.description,
                                        // Sử dụng mô tả từ API
                                        size: 16,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        nextPage(maxPage);
                                      },
                                      child: ButtonNext(
                                        width: 100,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                    children: List.generate(4, (indexDots) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    width: 8,
                                    height: index == indexDots ? 25 : 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index == indexDots
                                            ? ColorPalette.primaryColor
                                            : ColorPalette.primaryColor
                                                .withOpacity(0.5)),
                                  );
                                }))
                              ])),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
