import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${index + 1}',style: Get.theme.textTheme.headline6),
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
          Expanded(child: Text('username',style: Get.theme.textTheme.headline6,)),
          Row(
            children: [
              SvgPicture.asset(
                  'assets/images/coin.svg'),
              Text('165465',
                  style: Get.theme.textTheme.subtitle2?.copyWith(color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }
}
