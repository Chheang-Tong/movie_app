import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '/core/core.dart';

class MylistScreen extends StatefulWidget {
  const MylistScreen({super.key});
  @override
  State<MylistScreen> createState() => _MylistScreenState();
}

class _MylistScreenState extends State<MylistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              tapWidget(
                  lead: FontAwesomeIcons.download,
                  title: 'Download',
                  trail: Icons.arrow_forward_ios_sharp,
                  onTap: () {
                    Get.toNamed(RouteHelper.download);
                  }),
              tapWidget(
                  lead: MdiIcons.bookmarkMinusOutline,
                  title: 'Favorite Movie',
                  trail: Icons.arrow_forward_ios_sharp,
                  onTap: () {
                    Get.toNamed(RouteHelper.favoriteMovie);
                  }),
              SizedBox(height: 10),
              Text(
                'History',
                style: semiBoldOverLarge,
              ),
              Text('''The last 10 movies you will watch will be here.'''),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amber,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tapWidget({
    required IconData lead,
    required String title,
    required IconData trail,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          color: ColorResources.cardColorDark,
          child: ListTile(
            leading: Icon(
              lead,
              color: ColorResources.borderColor,
            ),
            title: Text(
              title,
              style: semiBoldMediumLarge.copyWith(
                color: ColorResources.borderColor,
              ),
            ),
            trailing: Icon(
              trail,
              color: ColorResources.borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
