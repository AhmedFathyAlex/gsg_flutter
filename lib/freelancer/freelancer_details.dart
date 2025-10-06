import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/freelancer_model.dart';
import 'package:gsg_flutter/widgets/rating.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    FreelancerModel model = 
    ModalRoute.of(context)!.settings.arguments as FreelancerModel;
    return Scaffold(
      appBar: AppBar(title: Text(model.name),),
      body: Center(
        child: Column(
          children: [
            Image.network(
              model.img,
            ) , 
            Text(model.name),
            Text(model.title),
            Rating(rate: model.rate)
          ],
        ),
      ),
    );

  }
}