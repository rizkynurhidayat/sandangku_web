import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// ignore: must_be_immutable
class orderContainer extends StatelessWidget {
  orderContainer(
      {super.key,
      required this.page,
      required this.onTap,
      required this.linkphoto});

  String page;
  String linkphoto;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              linkphoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54,
              ),
              child: Center(
                child: Text(
                  page,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
