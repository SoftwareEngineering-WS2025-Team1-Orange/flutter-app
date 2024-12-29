import 'package:bright_impact/view/custom_widgets/rotating_circle_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.5),
                _buildDonationBoxStatusSection(context),
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
                SizedBox(height: width * 0.25),
              ],
            ),
          ),
        ]));
  }

  Widget _buildDonationBoxStatusSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Donation Box',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 8),
          Text(
            'active',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child:
                      _buildStatusItem("27 Watt", null, Icons.bolt, context)),
              SizedBox(width: 10),
              Expanded(
                  child:
                      _buildStatusItem("0,05 €", "Ø/Tag", Icons.euro, context, animationReversed: true)),
              SizedBox(width: 10),
              Expanded(
                  child: _buildStatusItem(
                      "17%", "Active Time", Icons.timer, context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(
      String label, String? subtitle, IconData icon, BuildContext context, {bool animationReversed = false}) {
    final theme = Theme.of(context);
    return Stack(children: [
      AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Container(
                  color: theme.secondaryHeaderColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      if (subtitle != null)
                        Text(subtitle,
                            style: TextStyle(
                                fontSize: 10, color: theme.primaryColor),
                            textAlign: TextAlign.center),
                      SizedBox(height: 4),
                      Icon(icon, color: theme.primaryColor, size: 32),
                    ],
                  )))),
      Padding(
          padding: EdgeInsets.all(5),
          child: RotatingCircle(gaps: 3, color: theme.primaryColor, reversed: animationReversed,))
    ]);
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
