import 'package:ecommerceapp/core/resources/app_colors.dart';
import 'package:ecommerceapp/core/widgets/w_textfield.dart';
import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Filter extends StatefulWidget {
  final List<CategoryEntity> category;
  const Filter({super.key, required this.category});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int? selectedBrand; // Tanlangan brandni saqlash
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller
        .dispose(); // ✅ Memory leak oldini olish uchun controllerni tozalash
    super.dispose();
  }

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
        // onTap: _hideMenu, // 🔁 boshqa joyni bosganda yopiladi
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              top: topOffset,
              left: 0,
              // right: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                    width: MediaQuery.of(context).size.width * 80 / 100,
                    height: MediaQuery.of(context).size.height - 72,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    color: AppColors.white, // Purple background
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kategoriya
                          const Text("Kategoriya",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.all(0),
                              childrenPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              title: Text('Guldastalar'),
                              children: <Widget>[
                                ...[
                                  "Barchasi",
                                  "Bukletlar",
                                  "Atirgullar",
                                  "Lolagullar",
                                  "Aralash buketlar"
                                ].map(
                                  (e) => ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    tileColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    title: Text(
                                      e,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppColors.c_a12.withOpacity(0.3)),
                          // Narhi
                          const SizedBox(height: 16),
                          const Text("Narhi",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          _buildPriceField("10\$", "dan"),
                          const SizedBox(height: 12),
                          _buildPriceField("300\$", "gacha"),
                          const SizedBox(height: 24),
                          Divider(color: AppColors.c_a12.withOpacity(0.3)),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildPriceField(String value, String suffix) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF9C27B0)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: TextStyle(color: Color(0xFF9C27B0)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(suffix),
      ],
    );
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            // key: _scaffoldKey,
            onTap: () => showModalBottomSheet<void>(
              context: context,
              clipBehavior: Clip.hardEdge,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-80,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategoriya
                        const Text("Kategoriya",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.all(0),
                            childrenPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            title: Text('Guldastalar'),
                            children: <Widget>[
                              ...[
                                "Barchasi",
                                "Bukletlar",
                                "Atirgullar",
                                "Lolagullar",
                                "Aralash buketlar"
                              ].map(
                                (e) => ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity.compact,
                                  tileColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  title: Text(
                                    e,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: AppColors.c_a12.withOpacity(0.3)),
                        // Narhi
                        const SizedBox(height: 16),
                        const Text("Narhi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        _buildPriceField("10\$", "dan"),
                        const SizedBox(height: 12),
                        _buildPriceField("300\$", "gacha"),
                        const SizedBox(height: 24),
                        Divider(color: AppColors.c_a12.withOpacity(0.3)),
                      ],
                    ),
                  ),
                );
              },
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/icon/filter.svg"),
                  Text("Filter"),
                ],
              ),
            ),
          ),
          SizedBox(width: 14),
          SizedBox(
            width: MediaQuery.of(context).size.width - 94,
            child: WTextField(
              controller: controller,
              borderRadius: 26,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              borderColor: AppColors.primaryColor,
              suffixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset("assets/svg/icon/search.svg",
                    width: 24, height: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
}
