import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tests/screens/chat%20screen/chat_screen.dart';
import '../../../constants.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.13,
          decoration: const BoxDecoration(
            gradient: constGradient,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Message',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),


        Expanded(
          child: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(5),
            itemBuilder: (contect, index) {
              return InkWell(
                onTap: (){
                 Get.to(()=> const ChatScreen());
                },
                child: Column(
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25.sp,
                          backgroundColor: Colors.grey[300],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mohamed Abdelbasit',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: constGradient,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.solidStar,
                                        color: Color.fromARGB(255, 255, 230, 0),
                                        size: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'new message from user',
                              style: TextStyle(
                                color: const Color(0xffC1C0C9),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            '12:44',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xffC1C0C9),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),


                    const Divider()

                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
