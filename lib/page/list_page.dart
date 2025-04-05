import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget{
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: testAmbulanceDataList.length,
      itemBuilder: (context, index) {
        var it = testAmbulanceDataList[index];
        String active = it.active ? "值勤中" : "未出勤";
        Color showColor = it.active ? Colors.green : Colors.grey;
        return Card(
          child: ListTile(
            title: Text(it.id, style: TextStyle(color: showColor),),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(active, style: TextStyle(color: showColor),)),
                Expanded(child: Text('分隊: ${it.team}', style: TextStyle(color: it.active ? Colors.black : Colors.grey),)),
                Expanded(child: Text('經度: ${it.longitude}', style: TextStyle(color: it.active ? Colors.black : Colors.grey),)),
                Expanded(child: Text('緯度: ${it.latitude}', style: TextStyle(color: it.active ? Colors.black : Colors.grey),)),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              /* TODO: */
            },
          ),
        );
      },
    );
  }
}

class TestAmbulanceData {
  final String id;
  final String team;
  final double longitude;
  final double latitude;
  final bool active;
  const TestAmbulanceData(this.id, this.team, this.latitude, this.longitude, this.active);
}

const List<TestAmbulanceData> testAmbulanceDataList = <TestAmbulanceData> [
  TestAmbulanceData("AMB001", "Alpha1", 25.032, 121.5654, true),
  TestAmbulanceData("AMB002", "Beta1", 25.034, 121.5667, false),
  TestAmbulanceData("AMB003", "Alpha2", 24.034, 122.5667, true),
  TestAmbulanceData("AMB004", "Beta2", 23.034, 120.5667, true),
  TestAmbulanceData("AMB005", "Alpha3", 25.034, 121.5667, true),
  TestAmbulanceData("AMB006", "Beta2", 25.134, 121.5667, true),
  TestAmbulanceData("AMB007", "Beta2", 25.334, 122.53, false),
  TestAmbulanceData("AMB008", "Beta2", 25.034, 120.1221, true),
  TestAmbulanceData("AMB009", "Alpha3", 25.22, 121.5667, true),
  TestAmbulanceData("AMB010", "Alpha3", 24.1, 121.5667, false),
  TestAmbulanceData("AMB011", "Beta1", 25.03, 120.5667, true),
  TestAmbulanceData("AMB012", "Alpha2", 25.034, 121.567, false),
  TestAmbulanceData("AMB013", "Alpha2", 22.035, 122.5617, false),
  TestAmbulanceData("AMB014", "Alpha3", 23.734, 121.23, false),
  TestAmbulanceData("AMB015", "Alpha1", 24.137, 120.2, true),
  TestAmbulanceData("AMB016", "Beta1", 25.931, 121.5, true),
  TestAmbulanceData("AMB017", "Alpha1", 22.034, 122.663, true),
  TestAmbulanceData("AMB018", "Alpha2", 23.034, 120.567, false),
];