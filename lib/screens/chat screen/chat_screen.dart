import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tests/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffB83AF3),
          titleSpacing: 0.0,
          centerTitle: true,
          title: const Text(
            'username',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          actions: const [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage( 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'),
                radius: 20.0,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LayoutBuilder(builder: (context, constraints) {
            var height = constraints.constrainHeight();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height - 48.0,
                  child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: ListView.separated(
                            shrinkWrap: true,
                            //reverse: true,
                            itemBuilder: (context, index) {
                              if(index%2==0) {
                                return Align(
                               alignment: AlignmentDirectional.bottomStart,
                               child: Container(
                                 clipBehavior: Clip.antiAliasWithSaveLayer,
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 decoration: BoxDecoration(
                                   color: Colors.grey[300],
                                   borderRadius: BorderRadius.circular(10.0),
                                 ),
                                 child: const Text('Sender Massage'),
                               ),
                             );
                              } else {
                                return Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                      gradient: constGradient,
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Text('Reciever Massage',style: TextStyle(color: Colors.white),),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 5.0,
                            ),
                            itemCount: 4,),
                  )
    ),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(13.0),
                              topLeft: Radius.circular(13.0),
                            )),
                        child: TextFormField(
                          //controller: messageController,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 15.0),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 5.0),
                            hintText: 'Type a message........ ',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 48,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(13.0),
                            topRight: Radius.circular(13.0),
                          )),
                      child: InkWell(
                        onTap: (){},
                        child: SvgPicture.asset('assets/images/send.svg'),
                      ),
                     ),
                  ],
                ),
              ],

            );
          }
          ),
        ),
      )
    );
  }
}
