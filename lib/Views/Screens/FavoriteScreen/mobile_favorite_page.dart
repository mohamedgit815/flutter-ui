import 'package:flutter/material.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/Helper/Widgets/Default/default_grid_view.dart';
import 'package:tests/constants.dart';


class MobileFavoritePage extends StatefulWidget {
  const MobileFavoritePage({Key? key}) : super(key: key);

  @override
  _MobileFavoritePageState createState() => _MobileFavoritePageState();
}

class _MobileFavoritePageState extends State<MobileFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context,inner){
            return [
              SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  // expandedHeight: _mediaQ.height * 0.15,
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  title: const CustomText(
                    text: 'Follow',
                    fontSize: 20.0,
                  ),
                  flexibleSpace: Container(decoration: const BoxDecoration(gradient: constGradient),)
              )
            ];
          },
          body: const DefaultGridView()
      ),
    );
  }
}
