import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tests/constants.dart';

class FansScreen extends StatelessWidget {
  static const String id = '/fansscreen';

  const FansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments as String;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 35),
        height: Get.height * 0.13,
        decoration: const BoxDecoration(
          gradient: constGradient,
        ),

        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Get.width / 3),
                    child: Text(
                      title,
                      style: Get.theme.textTheme.headline5
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(
              height: Get.height ,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                children: List.generate(
                  15,
                      (index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${index + 1}',
                            style: Get.theme.textTheme.headline6),
                        const SizedBox(
                          width: 8,
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'),
                          radius: 25,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'username',
                                  style: Get.theme.textTheme.headline6,
                                ),
                                Text(
                                  'ID: 12345',
                                  style: Get.theme.textTheme.caption,
                                ),
                              ],
                            )),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              color: const Color(0xffB83AF3),
                              width: 44,
                              height: 30,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
