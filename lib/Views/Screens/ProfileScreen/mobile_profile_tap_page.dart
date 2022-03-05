import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/widgets/profile_item.dart';


class MobileProfileTabPage extends StatefulWidget {
  const MobileProfileTabPage({Key? key}) : super(key: key);

  @override
  _MobileProfileTabPageState createState() => _MobileProfileTabPageState();
}

class _MobileProfileTabPageState extends State<MobileProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity ,
        width: double.infinity ,
        child: LayoutBuilder(
          builder:(context, constraints) => Stack(
            children: [

              Positioned(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxHeight * 0.4,
                left: constraints.maxWidth * 0.1,
                top: constraints.maxHeight * 0.12,
                child: Container(
                  decoration: BoxDecoration(
                      color: mainWhiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0.0,
                            blurRadius: 5.0,
                            color: colorGrey
                        )
                      ]
                  ),
                  child: Column(
                    children: [

                      const Spacer(flex: 12,) ,


                      Expanded(
                           flex: 7,
                           child: Column(
                        children: const [
                          CustomText(
                            text: 'Mohamed Omar' ,
                            fontSize: 18.0,
                          ),

                          CustomText(
                              text: 'ID: 4567874787' ,
                            fontSize: 14.0,
                          )
                        ],
                      )) ,


                      const Divider(thickness: 1,) ,


                      Expanded(
                        flex: 7,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: const [

                                    CustomText(
                                  text: 'Friends',
                                  color: colorGrey,
                                  fontSize: 20.0,
                                ) ,


                                    CustomText(
                                      text: '200',
                                      fontSize: 20.0,
                                    )
                                  ],
                                ),


                                Column(
                                  children: const [
                                    CustomText(
                                      text: 'Following', color: colorGrey,
                                      fontSize: 20.0,
                                    ) ,
                                    CustomText(
                                      text: '200',
                                      fontSize: 20.0,
                                    )
                                  ],
                                ),


                                Column(
                                  children: const [
                                    CustomText(
                                      text: 'Fans',
                                      color: colorGrey,
                                      fontSize: 20.0,
                                    ) ,


                                    CustomText(
                                      text: '10000',
                                      fontSize: 20.0,
                                    )
                                  ],),

                              ],
                      ),
                          )) ,


                      const Spacer(flex: 1,)
                    ],
                  ),
                ),
              ),

              Positioned(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxHeight * 0.4,
                left: constraints.maxWidth * 0.1,
                bottom: constraints.maxHeight * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                      color: mainWhiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.0,
                        blurRadius: 10.0,
                        color: colorGrey
                      )
                    ]
                  ),
                  child: ListView(
                    key: const PageStorageKey<String>('ProfileItemKey'),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileItem(
                        title: 'Diamonds',
                        iconColor: Colors.blue[300],
                        icon: FontAwesomeIcons.coins,
                      ),
                      ProfileItem(
                          title: 'Level',
                          iconColor: Colors.blue[800],
                          icon: FontAwesomeIcons.chartLine),
                      ProfileItem(
                        title: 'Income',
                        iconColor: Colors.yellow[700],
                        icon: FontAwesomeIcons.solidGem,
                      ),
                      ProfileItem(
                        title: 'Customer Service',
                        iconColor: Colors.red[300],
                        icon: FontAwesomeIcons.headset,
                      ),
                      ProfileItem(
                        title: 'Settings',
                        iconColor: colorGrey.shade800,
                        icon: FontAwesomeIcons.cog,
                      ),
                      ProfileItem(
                        title: 'Logout',
                        iconColor: Colors.red[900],
                        icon: FontAwesomeIcons.signOutAlt,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                  width: constraints.maxWidth * 0.5,
                  height: constraints.maxHeight * 0.2,
                  right: constraints.maxWidth * 0.25,
                  top: constraints.maxHeight * 0.04,
                  child: CircleAvatar(
                    backgroundColor: colorGrey.shade500,
                  )),
            ],
          ),
        ),
      )
    );
  }
}
