import 'package:flutter/material.dart';
import 'package:practiceflutter/Services/ApiServices.dart';

import '../Model/TrainingModel.dart';

class TraingScreen extends StatefulWidget {
  const TraingScreen({Key? key}) : super(key: key);

  @override
  State<TraingScreen> createState() => _TraingScreenState();
}

class _TraingScreenState extends State<TraingScreen> {
  TrainingModel? trainingModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Services().getTrainingData();
   
    getData();
  }

  getData() {
    trainingModel = Services().getTrainingData();
    print(trainingModel == null ? "" : trainingModel!.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
