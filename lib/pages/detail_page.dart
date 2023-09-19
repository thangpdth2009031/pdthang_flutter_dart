import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/pages/check_out_screen.dart';
import 'package:pdthang/widgets/app_text.dart';
import 'package:pdthang/widgets/heart_widget.dart';
import 'package:pdthang/widgets/item_button_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const routeName = "/main_page";

  @override
  State<DetailPage> createState() => _TestPageState();
}

class _TestPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/welcome-1.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(kItemPadding),
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: kDefaultPadding,
                      color: Colors.black,
                    ),
                  ),
                )),
            Positioned(
                top: 180,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding * 1.5,
                          right: kDefaultPadding * 1.5),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 180,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(kDefaultPadding * 3),
                            topLeft: Radius.circular(kDefaultPadding * 3),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: kDefaultPadding * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Chua Thay",
                                fontWeight: FontWeight.bold,
                                size: 25,
                              ),
                              AppText(
                                text: "\$123",
                                size: 20,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationDot,
                                size: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              AppText(
                                text: "Ha Noi",
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.start,
                                    color: (index < 3)
                                        ? Colors.orange
                                        : Colors.grey,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              AppText(
                                text: "(3})",
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                            text: "Description",
                            fontWeight: FontWeight.bold,
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text:
                                "Chùa Thầy được xây dựng từ thời nhà Lý, gắn liền với giai thoại cuộc đời "
                                "Thiền sư Từ Đạo Hạnh. Lúc đầu chùa chỉ là một am nhỏ gọi là Hương Hải am. "
                                "Sau đó, vua Lý Nhân Tông cho xây dựng lại gồm 2 cụm chùa là chùa Cao trên "
                                "núi (Đỉnh Sơn Tự) và chùa Dưới (Thiên Phúc Tự). Chùa Thầy là nơi tu hành "
                                "của Thiền sư Từ Đạo Hạnh – người có những đóng góp to lớn cho nhân dân và "
                                "ông tổ của bộ môn múa rối nước. Năm 1997, Bưu điện Việt Nam phát hành bộ "
                                "tem “Thắng Cảnh Việt Nam” gồm 3 mẫu, trong đó có mẫu (3-1) giá mặt 400 đồng "
                                "đưa hình ảnh “Phong Cảnh Chùa Thầy” do họa sĩ Trần Thế Vinh thiết kế (xem "
                                "ảnh), và bưu ảnh về phong cảnh hữu tình này, là mẫu tem đẹp mà người sưu "
                                "tập tem về đề tài “văn hóa nghệ thuật” không thể không có.",
                            color: Colors.grey,
                            size: 16,
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Positioned(
                bottom: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding * 1.5,
                      right: kDefaultPadding * 1.5),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: HeartWidget(),
                      ),
                      Spacer(),
                      ItemButtonWidget(
                        data: "Book trip now",
                        width: 270,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CheckOutPage()));
                        },
                      )
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
