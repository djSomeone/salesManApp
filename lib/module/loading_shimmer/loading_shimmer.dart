import 'package:flutter/material.dart';

import 'loading_card.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder( padding: EdgeInsets.zero,itemBuilder: (conext,index)=>LoadingCard(),itemCount: 6,);
  }
}
