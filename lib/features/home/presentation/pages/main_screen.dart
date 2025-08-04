import 'package:auto_route/auto_route.dart';
import 'package:lutfan/core/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:lutfan/config/routes/router.gr.dart';
import 'package:lutfan/core/resources/app_colors.dart';
import 'package:lutfan/core/util/responsive.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final List<List<String>> bottonNavItems = [
  //   ["home", "Home"],
  //   ["search", "Search"],
  //   ["timer", "Timer"],
  //   ["history", "History"],
  //   ["profile", "Profile"],
  // ];

  int activeBottomNav = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (_overlayEntry == null) {
      _showMenu();
    } else {
      _hideMenu();
    }
  }

  void _showMenu() {
    final double topOffset = 80;
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideMenu, // 🔁 boshqa joyni bosganda yopiladi
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              top: topOffset,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  color: const Color(0xFF6A00B6), // Purple background
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSocialItem(
                          "assets/svg/icon/uz.png", "O'zbekcha", 'png'),
                      const SizedBox(height: 16),
                      _buildSocialItem("assets/svg/icon/telegram.svg",
                          '@lutfan_gullar', 'svg'),
                      const SizedBox(height: 8),
                      _buildSocialItem("assets/svg/icon/instagram.svg",
                          '@lutfan_gullar', 'svg'), // instagram
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuItem(String text) {
    return GestureDetector(
      onTap: () {
        debugPrint('Selected: $text');
        _hideMenu();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildSocialItem(String assetName, String username, String type) {
    return Row(
      children: [
        if (type == 'svg')
          SvgPicture.asset(assetName, width: 24)
        else
          Image.asset(assetName, width: 24),
        const SizedBox(width: 8),
        Text(username,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(width: 8),
        if (type != 'svg')
          SvgPicture.asset("assets/svg/icon/langarrow.svg")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return AutoTabsRouter(
      routes: [
        // CartRoute(),
        HomeRoute(),
        // OrdersRoute(),
        // OrdersRoute(),
        // ProductDetailRoute(id: 1),
        // SearchRoute(),
        // NotificationRoute(),
        // ChatRoute(),
        // MyProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          key: _scaffoldKey,
          drawer: !isDesktop
              ? const Drawer(
                  width: 270,
                  backgroundColor: AppColors.primaryColor,
                  // child: SideMenuWidget(),
                )
              : null,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(80), // Set your preferred height here
            child: AppBar(
              titleSpacing: 0,
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
              // actions: [],
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    SvgPicture.asset("assets/svg/icon/logo.svg"),
                    GestureDetector(
                      key: _scaffoldKey,
                      onTap: _toggleMenu,
                      child: SvgPicture.asset('assets/svg/icon/menu.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: child,
                  ),
                ),
                // if (isDesktop)
                //   Expanded(
                //     flex: 3,
                //     child: child,
                //   ),
              ],
            ),
          ),
        );
      },
    );
  }
}
