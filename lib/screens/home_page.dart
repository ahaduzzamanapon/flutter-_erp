import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text(
          "HR SHEBA",
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTopSummaryCard(
              icon: Icons.group,
              iconBgColor: Colors.cyan,
              title1: "Total Staff",
              value1: "234",
              title2: "Total Worker",
              value2: "16",
            ),
            _buildTopSummaryCard(
              icon: Icons.account_balance_sharp,
              iconBgColor: Colors.orange,
              title1: "Department",
              value1: "40",
              title2: "Line",
              value2: "12",
            ),
            _buildTopSummaryCard(
              icon: Icons.credit_card,
              iconBgColor: Colors.blue,
              title1: "Section",
              value1: "40",
              title2: "Designation",
              value2: "12",
            ),
            const SizedBox(height: 10),
            _buildCardWithList(
              title: "Total Manpower",
              color: Colors.red.shade900,
              items: {
                "Total Employee": "1200",
                "Total Male": "700",
                "Total Female": "400",
                "Total Common": "0",
              },
            ),
            _buildCardWithList(
              title: "Today Attendance",
              color: Colors.purple,
              items: {
                "Present": "1170",
                "Absent": "30",
                "Leave": "20",
                "Late": "18",
              },
            ),
            _buildCardWithList(
              title: "Current Month Status",
              color: Colors.indigo,
              items: {
                "New Join": "370",
                "Resign": "28",
                "Lefty": "75",
                "New to Regular": "75",
              },
            ),
            _buildCardWithList(
              title: "Previous Month Summary",
              color: Colors.green,
              items: {
                "Salary": "10000000",
                "Overtime": "200000",
                "Ext. Overtime": "500000",
                "Attn. Bonus": "500000",
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSummaryCard({
    required IconData icon,
    required Color iconBgColor,
    required String title1,
    required String value1,
    required String title2,
    required String value2,
  }) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            color: iconBgColor,
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          VerticalDivider(width: 0, color: Colors.grey[300]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title1, style: TextStyle(fontSize: 16)),
                      Text(value1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title2, style: TextStyle(fontSize: 16)),
                      Text(value2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithList({
    required String title,
    required Color color,
    required Map<String, String> items,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: items.entries.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.key),
                      Text(e.value, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
