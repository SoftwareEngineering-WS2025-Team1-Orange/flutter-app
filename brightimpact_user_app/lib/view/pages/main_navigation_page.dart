import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/custom_widgets/donation_wallet_widget.dart';
import 'package:bright_impact/view/pages/home_page.dart';
import 'package:bright_impact/view/pages/list_pages/ngo_list_page.dart';
import 'package:bright_impact/view/pages/list_pages/project_list_page.dart';
import 'package:bright_impact/view/pages/list_pages/transaction_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Width and Height calculation of NavBar and single Tap
    final double navBarWidth = MediaQuery.of(context).size.width * 0.7;
    final double navBarHeight = navBarWidth * 0.24;
    final double tabWidth = navBarWidth / 4; // 4 tabs
    final double tabHeight = navBarHeight * 0.8;

    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              HomePage(),
              NGOListPage(),
              ProjectListPage(),
              TransactionListPage()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom:
                      navBarHeight / 2), // Distance to bottom is half height
              child: Container(
                height: navBarHeight,
                width: navBarWidth,
                decoration: BoxDecoration(
                  color: Colors.white, // Backgroundcolor navigation bar
                  borderRadius: BorderRadius.circular(navBarHeight / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: (_selectedIndex * tabWidth) +
                          (tabWidth / 2) -
                          tabHeight / 2,
                      top: (navBarHeight - tabHeight) /
                          2, // Center highlight circle in navigation bar
                      child: Container(
                        height: tabHeight,
                        width: tabHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Highlight circle color
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildNavItem(icon: Icons.home, index: 0),
                            _buildNavItem(icon: Icons.group, index: 1),
                            _buildNavItem(icon: Icons.volunteer_activism, index: 2),
                            _buildNavItem(icon: Icons.euro_symbol, index: 3),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          _buildTopBar(
              context: context,
              onUserPressed: () => {appState.logout()},
          )
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        size: 28,
        color: _selectedIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
  
}

Widget _buildTopBar({required context, void Function()? onUserPressed}) {
  final theme = Theme.of(context);
  final width = MediaQuery.of(context).size.width;
  final appState = Provider.of<AppState>(context);

  return Stack(
    children: [
      Positioned(
        top: -width * 3.50,
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
        SizedBox(height: width * 0.13),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Text("Hi ${appState.donator?.firstname ?? ""}",
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.left),
              Spacer(),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.person_outlined),
                  color: Colors.white,
                  iconSize: 27,
                  onPressed: onUserPressed,
                ),
              ))
            ])),
        SizedBox(height: width * 0.03),
        Center(
          child: DonationWalletWidget(amount: appState.donator?.balance ?? 0.0),
        )
      ])
    ],
  );
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page 1',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}