import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Constance/const_variable.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import '../../../Views/Screens/AgoraScreen/agora_screen.dart';


class DefaultGridView extends StatelessWidget {
  const DefaultGridView({Key? key}) : super(key: key);

  @override
  LayoutBuilder build(BuildContext context) {
    return LayoutBuilder(
      builder:(context, constraints) => GridView.builder(
          key: const PageStorageKey<String>('DefaultGridViewKey'),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 24,
          itemBuilder: (context,i){
            return InkWell(
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AgoraVideoCallScreen(
                   role: ClientRole.Broadcaster,
                   channel: 'test'
               )));
              },
              child: Container(
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: colorGrey.shade400 ,
                  image: const DecorationImage(
                      image: AssetImage('$assetsPath/test.jpg'),
                      fit: BoxFit.cover
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: constraints.maxHeight * 0.08,width: constraints.maxWidth * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: colorGrey.withOpacity(0.7) ,
                              border: Border.all(
                                  color: mainWhiteColor
                              )
                          ),
                          child: Row(
                            children: const [
                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.local_fire_department_sharp ,
                                    color: mainWhiteColor,
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: CustomText(
                                    text: '5000',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: mainWhiteColor,
                                  )),
                            ],
                          )
                      ),
                    ),

                    const Spacer(),


                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: constraints.maxHeight * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0.0,
                                    blurRadius: 0.0 ,
                                    color: colorGrey.withOpacity(0.4)
                                )
                              ]
                          ) ,
                          child: const CustomText(
                            text: 'Mohamed Ahmed',
                            color: mainWhiteColor,
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
