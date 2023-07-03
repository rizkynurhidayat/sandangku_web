import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OurPartner extends StatelessWidget {
  OurPartner({super.key, this.image, this.partner, this.ontap});
  String? image, partner;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.amber,
        onTap: ontap,
        child: Card(
          child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 180,
                      height: 100,
                      color:
                          (image != null) ? Colors.transparent : Colors.amber,
                      child: (image != null)
                          ? Image.network(
                              image!,
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text("Our Partner"),
                            )),
                  Text(
                    (partner != null) ? partner! : "Comming Soon",
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
