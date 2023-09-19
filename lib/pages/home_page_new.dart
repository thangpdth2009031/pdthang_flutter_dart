import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/core/hepper/ImageHelper.dart';
import 'package:pdthang/core/hepper/TextStyles.dart';
import 'package:pdthang/widgets/app_bar_container.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  final List<Map<String, String>> listImageLeft = [
    {'name': 'Korea', 'image': "assets/images/korea.png"},
    {'name': 'Dubai', 'image': "assets/images/dubai.png"},
    {'name': 'Turkey', 'image': "assets/images/turkey.png"},
    {'name': 'Japan', 'image': "assets/images/japan.png"},
    {'name': 'Korea', 'image': "assets/images/korea.png"},
    {'name': 'Korea', 'image': "assets/images/korea.png"},
  ];

  Widget _buildImageHomeScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultPage()))*/
      },
      child: Container(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.start,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: AppBarContainer(
          titleString: 'home',
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Guy',
                      style: TextStyles
                          .defaultStyle.fontHeader.whiteTextColor.bold,
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    Text(
                      'Where are you going next ?',
                      style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                    )
                  ],
                )
              ],
            ),
          ),
          implementLeading: false,
          child: Column(
            children: [
              TextField(
                enabled: true,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Search you destination',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0.8),
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        kItemPadding,
                      ),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: kItemPadding),
                ),
                style: TextStyles.defaultStyle,
                onChanged: (value) {},
                onSubmitted: (String submitValue) {},
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Row(
                children: [
                  Text(
                    'Popular Destinations',
                    style: TextStyles.defaultStyle.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Expanded(
                  child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(0),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: listImageLeft
                          .map(
                            (e) => _buildImageHomeScreen(
                              e['name']!,
                              e['image']!,
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
