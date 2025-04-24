import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/feature/my_list/controller/list_controller.dart';

class Download extends StatefulWidget {
  const Download({super.key});
  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  final ListController controller = Get.put(ListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ListController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Download',
            style: semiBoldExtraLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
                width: size.width,
                child: Card(
                  color: ColorResources.cardColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Dungeons &Dragons: Honor Among Thieves',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: semiBoldLarge.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            controller.isDownload
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '457.2/968.2 MB',
                                                style: semiBoldDefault.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 8,
                                                ),
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  value: 0.5,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    ColorResources.blueColor,
                                                  ),
                                                  minHeight: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '47%',
                                              style: semiBoldDefault.copyWith(
                                                color: ColorResources.blueColor,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.download();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                child: Icon(Icons.close),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controller.download();
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Color(0xFF8197E5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        child: Text(
                                          '2.6gb',
                                          style: semiBoldDefault,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              height: size.height * 0.5,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: ColorResources.cardColorDark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 40,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: ColorResources.colorGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Delete',
                                    style: semiBoldExtraLarge.copyWith(
                                      color: ColorResources.redColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Are you sure you want to delete this download?',
                                    style: semiBoldLarge.copyWith(
                                      // color: ColorResources.redColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: size.height * 0.15,
                                        width: size.width * 0.4,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Avatar: The Way of Water'),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.download();
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              color: Color(0xFF8197E5),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                child: Text(
                                                  '2.6gb',
                                                  style: semiBoldDefault,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        width: size.width * 0.45,
                                        height: size.height * 0.06,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorResources.blueGreyColor,
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: semiBoldDefault.copyWith(
                                              color: ColorResources.colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        width: size.width * 0.45,
                                        height: size.height * 0.06,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorResources.blueColor,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Yes, Delete',
                                            style: semiBoldDefault.copyWith(
                                              color: ColorResources.colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(FontAwesomeIcons.trash),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
