import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tests/constants.dart';
import 'package:tests/screens/leader_board_screen/widgets/list_divider.dart';
import 'package:tests/screens/leader_board_screen/widgets/list_item.dart';


class LeaderBoard extends StatelessWidget {
  static String id = '/leaderboard';

  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: constGradient,
            ),
            child: SingleChildScrollView(
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
                          margin: EdgeInsets.only(left: Get.width / 4),
                          child: Text(
                            'Leaderboard',
                            style: Get.theme.textTheme.headline5
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Daily',
                                style: Get.theme.textTheme.subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),

                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Weekly',
                                style: Get.theme.textTheme.subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),

                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Monthly',
                                style: Get.theme.textTheme.subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Totaly',
                                style: Get.theme.textTheme.subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'),
                            radius: 50,
                          ),
                          Text(
                            'user name',
                            style: Get.theme.textTheme.headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/coin.svg'),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1654646165',
                                style: Get.theme.textTheme.subtitle2
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'),
                            radius: 60,
                          ),
                          Text(
                            'user name',
                            style: Get.theme.textTheme.headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/coin.svg'),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1654646165',
                                style: Get.theme.textTheme.subtitle2
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'),
                            radius: 55,
                          ),
                          Text(
                            'user name',
                            style: Get.theme.textTheme.headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/coin.svg'),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1654646165',
                                style: Get.theme.textTheme.subtitle2
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: Get.size.height / 1.5,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          ListItemWidget(index: index),
                      separatorBuilder: (context, indext) => const ListDivider(),
                      itemCount: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
