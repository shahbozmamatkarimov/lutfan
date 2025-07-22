import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerceapp/config/routes/router.gr.dart';
import 'package:ecommerceapp/core/resources/app_colors.dart';
import 'package:ecommerceapp/core/util/responsive.dart';
import 'package:ecommerceapp/core/widgets/w_bottom_bar_item.dart';
import 'package:ecommerceapp/core/widgets/w_button.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<List<String>> bottonNavItems = [
    ["home", "Home"],
    ["search", "Search"],
    ["timer", "Timer"],
    ["history", "History"],
    ["profile", "Profile"],
  ];

  int activeBottomNav = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return AutoTabsRouter(
      routes: [
        CartRoute(),
        HomeRoute(),
        OrdersRoute(),
        OrdersRoute(),
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
          backgroundColor: AppColors.backgroundColor,
          key: _scaffoldKey,
          drawer: !isDesktop
              ? const Drawer(
                  width: 270,
                  backgroundColor: AppColors.white,
                  // child: SideMenuWidget(),
                )
              : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              isDesktop ? 84 : 72,
            ), // Set your preferred height here
            child: AppBar(
              titleSpacing: 0,
              backgroundColor: AppColors.transparent,
              centerTitle: true,
              actions: [Container()],
              automaticallyImplyLeading: false,
              toolbarHeight: isDesktop ? 84 : 72,
              title: Container(
                height: isDesktop ? 84 : 72,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHywH-8kSRUXaxo5mdJ4vixbNXOyrTybV5OQ&s',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Good Morning ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text('👋'),
                                ],
                              ),
                              const Text(
                                'John Doe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.notifications_outlined),
                          SizedBox(width: 16),
                          Icon(Icons.favorite_outline),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isDesktop)
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: 270,
                    child: const SizedBox(
                        // child: SideMenuWidget(),
                        ),
                  ),
                Expanded(
                  // flex: 7,
                  child: Container(
                    margin: isDesktop
                        ? const EdgeInsets.only(top: 16, bottom: 16, right: 16)
                        : null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: isDesktop ? AppColors.white : null,
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
          // bottomNavigationBar: Container(
          //   height: 80,
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadiusDirectional.only(
          //       topStart: Radius.circular(25),
          //       topEnd: Radius.circular(25),
          //     ),
          //     color: AppColors.white,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // for (List<String> i, index in bottonNavItems)
          //       for (int index = 0; index < bottonNavItems.length; index++)
          //         WBottomBarItem(
          //           icon:
          //               "assets/svg/bottomnav/${bottonNavItems[index][0]}.svg",
          //           label: bottonNavItems[index][1],
          //           isActive: index == activeBottomNav,
          //           onTap: () => {
          //             if (index == 0)
          //               {context.router.pushNamed("/")}
          //             else if (index == 1)
          //               {context.router.pushNamed("/reyting")}
          //             else if (index == 3)
          //               {context.router.pushNamed("/news")},
          //             // activeBottomNav = index
          //             setState(() {
          //               activeBottomNav = index;
          //             })
          //           },
          //         ),
          //     ],
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                // _selectedIndex = index;
                print(index);
                if (index == 0) {
                  context.navigateTo(HomeRoute());
                } else if (index == 1) {
                  context.navigateTo(CartRoute());
                } else if (index == 2) {
                  context.navigateTo(OrdersRoute());
                }
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Orders'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
