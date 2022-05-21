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
  List<TrainingEvent> _date = []; //
  String? _selectedDate;
  int? selectedDateIndex; // Option 2
  List<String> statusLlist = [];
  int? SelectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() {
    trainingModel = Services().getTrainingData();
    _date = trainingModel!.data.trainings[0].trainingEvents;
  }

  getSelectedDateIndex(String date) {
    for (int i = 0; i < _date.length; i++) {
      if (_date[i].date == date) {
        SelectedIndex = i;
        print(SelectedIndex);
        // break;
      }
    }
    getStatus(SelectedIndex!);
  }

  getStatus(int SelectedIndex) {
    statusLlist.clear();
    List<Event> statusList1 = _date[SelectedIndex].events;
    for (int i = 0; i < statusList1.length; i++) {
      print(statusList1.length.toString());
      if (statusList1[i].status == "High") {
        statusLlist.add("Red");
      } else if (statusList1[i].status == "Mid") {
        statusLlist.add("Yellow");
      } else if (statusList1[i].status == "Low") {
        statusLlist.add("Blue");
      } else if (statusList1[i].status == null) {
        statusLlist.add("");
      }
    }
    setState(() {});
    print(statusLlist.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "FrontLyne Test",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                hint: Text(_selectedDate ??
                    "Please choose a Date"), // Not necessary for Option 1
                value: _selectedDate,

                items: _date.map((date) {
                  return DropdownMenuItem(
                    child: Text(date.date.toString()),
                    value: date.date,
                  );
                }).toList(),
                onChanged: (date) {
                  setState(() {
                    _selectedDate = date as String?;
                    getSelectedDateIndex(_selectedDate!);
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Status :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    statusLlist.length == 0
                        ? Text("-")
                        : Expanded(
                        
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: statusLlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 200,
                                    child: Text("${statusLlist[index]}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  );
                                }))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
