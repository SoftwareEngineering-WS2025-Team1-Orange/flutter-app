import 'package:bright_impact/State/AppState.dart';
import 'package:bright_impact/View/CustomWidgets/DonationWalletWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        /*appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text('Hi Tom'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),*/
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.6),
                _buildDonationBoxStatusSection(),
                _buildProjectSection('Recently Added Projects', [
                  _buildProjectCard('Beach Cleaning', 'New Roots e.V.',
                      'assets/images/samples/beach_clean.jpg'),
                  _buildProjectCard('School Materials', 'New Roots e.V.',
                      'assets/images/samples/school.jpg'),
                  _buildProjectCard('Recycling Initiatives', 'EcoLife Org',
                      'assets/images/samples/recycling.jpg'),
                ]),
                _buildProjectSection('Environment and Sustainability', [
                  _buildProjectCard('Tree Planting', 'Green Future',
                      'assets/images/samples/tree_planting.jpg'),
                  _buildProjectCard('Recycling Initiatives', 'EcoLife Org',
                      'assets/images/samples/recycling.jpg'),
                  _buildProjectCard('Beach Cleaning', 'New Roots e.V.',
                      'assets/images/samples/beach_clean.jpg'),
                ]),
              ],
            ),
          ),
          Positioned(
            top: -width * 3.42,
            left: -width * 1.5,
            child: Container(
              width: width * 4,
              height: width * 4,
              decoration: BoxDecoration(
                color: theme.secondaryHeaderColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: width * 0.17),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Text("Hi Tom",
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.left),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.person_outlined),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ])),
            SizedBox(height: width * 0.06),
            Center(
              child: DonationWalletWidget(amount: 4.24),
            )
          ])
        ]));
  }

  Widget _buildDonationBoxStatusSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Donation Box',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'active',
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatusItem('27 Watt', Icons.bolt),
              _buildStatusItem('0,05 € / kWh', Icons.euro),
              _buildStatusItem('17% Active Time', Icons.timer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueGrey, size: 32),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildProjectSection(String title, List<Widget> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: projects,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProjectCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
