import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Icon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
