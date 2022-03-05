import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/Helper/Widgets/Default/default_grid_view.dart';
import 'package:tests/constants.dart';
import 'package:tests/screens/leader_board_screen/leader_board_screen.dart';
import 'package:tests/screens/search_screen/search_screen.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size _mediaQ = MediaQuery.of(context).size;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context,inner)=>[
          SliverAppBar(
            centerTitle: true,
            floating: true,
            snap: true,
            title: const CustomText(
              text: 'Home',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            flexibleSpace: Container(decoration: const BoxDecoration(gradient: constGradient),),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity,_mediaQ.height * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(LeaderBoard.id);
                      }, icon: const Icon(
                    FontAwesomeIcons.crown,size: 30.0,
                    color: mainWhiteColor,
                  )),

                  ChoiceChip(
                    label: const CustomText(
                      text: 'Feature',
                      color: mainBlackColor,
                    ), selected: true,
                    selectedColor: colorGrey.shade100,
                    disabledColor: colorGrey.shade700,
                  ),

                  ChoiceChip(
                    label: const CustomText(
                      text: 'Nearby',
                      color: mainWhiteColor,
                    ), selected: false,
                    selectedColor: colorGrey.shade100,
                    disabledColor: colorGrey.shade700,
                  ),

                  ChoiceChip(
                    label: const CustomText(
                      text: 'Newest',
                      color: mainWhiteColor,
                    ), selected: false,
                    selectedColor: colorGrey.shade100,
                    disabledColor: colorGrey.shade700,
                  ),

                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(SearchScreen.id);

                      }, icon: const Icon(
                    Icons.search,size: 35.0,
                    color: mainWhiteColor,
                  ))

                ],
              ),
            ),
          )
        ],
        body: const DefaultGridView(),
      ),
    );
  }
}
