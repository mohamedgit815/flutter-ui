import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class SearchScreen extends StatelessWidget {
  static String id = '/searchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(

        height: Get.height * 0.13,
        decoration: const BoxDecoration(
          gradient: constGradient,
        ),

        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: Container(

                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextFormField(

                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 15.0),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        hintText: 'Search for name ',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: (){},
                  child: const Icon(Icons.search,size: 30,color: Colors.white,),
                )
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
