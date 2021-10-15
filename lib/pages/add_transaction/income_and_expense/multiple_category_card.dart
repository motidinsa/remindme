import 'package:flutter/material.dart';

class MultipleCategoryCard extends StatelessWidget {
  final List<Widget> cardList;

  MultipleCategoryCard({this.cardList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: cardList.isNotEmpty
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => cardList[index],
      // separatorBuilder: (context, index) => const SizedBox(height: 0,),
      itemCount: cardList.length,
    );
  }
}
