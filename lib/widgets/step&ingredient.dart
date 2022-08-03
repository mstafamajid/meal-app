// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Box_Step_ingredient extends StatelessWidget {
  final EdgeInsets padding;
  final List<String> data;
  final Alignment alignment;

  final Color mealColor;
  final MediaQueryData media;
  const Box_Step_ingredient(
      {Key? key,
      required this.padding,
      required this.data,
      required this.alignment,
      required this.mealColor,
      required this.media})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: padding,
        width: media.size.width * 0.9,
        height: media.size.height * 0.2,
        decoration: BoxDecoration(
            color: mealColor,
            borderRadius: alignment == Alignment.centerLeft
                ? const BorderRadius.horizontal(right: Radius.circular(10))
                : const BorderRadius.horizontal(left: Radius.circular(10))),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${index + 1}.  ${data[index]}',
                  style: TextStyle(
                      color: mealColor,
                      fontSize: 20,
                     ),
                ),
              ),
            );
          }),
          itemCount: data.length,
        ),
      ),
    );
  }
}
