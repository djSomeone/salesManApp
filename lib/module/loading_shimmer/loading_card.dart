
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    var color=Color(0xFFACADAE);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(height: 200,width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),),
              ),
              Expanded(child: Column(
                children: [
                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),),
                  ) ),Expanded(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),),
                  ) ),
                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),),
                  ) ),
                ],
              )
              ),
            ],),
          ),
      ),
    );
  }
}
