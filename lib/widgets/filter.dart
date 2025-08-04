import 'package:lutfan/core/resources/app_colors.dart';
import 'package:lutfan/core/widgets/w_textfield.dart';
import 'package:lutfan/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Filter extends StatefulWidget {
  final List<CategoryEntity>? category;
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

  Widget _buildPriceField(String value, String suffix) {
    return Row(
      children: [
        Container(
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF9C27B0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(color: Color(0xFF9C27B0)),
          ),
        ),
        const SizedBox(width: 8),
        Text(suffix),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
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
          ),
          SizedBox(width: 14),
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
                  height: MediaQuery.of(context).size.height - 80,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategoriya
                        const Text("Kategoriya",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        // Theme(
                        //   data: Theme.of(context)
                        //       .copyWith(dividerColor: Colors.transparent),
                        //   child: ExpansionTile(
                        //     tilePadding: EdgeInsets.all(0),
                        //     childrenPadding:
                        //         EdgeInsets.symmetric(horizontal: 20),
                        //     title: Text('Guldastalar'),
                        //     children: <Widget>[
                        //       ...[
                        //         "Barchasi",
                        //         "Bukletlar",
                        //         "Atirgullar",
                        //         "Lolagullar",
                        //         "Aralash buketlar"
                        //       ].map(
                        //         (e) => ListTile(
                        //           dense: true,
                        //           visualDensity: VisualDensity.compact,
                        //           tileColor: Colors.transparent,
                        //           splashColor: Colors.transparent,
                        //           title: Text(
                        //             e,
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Theme(
                        //   data: Theme.of(context)
                        //       .copyWith(dividerColor: Colors.transparent),
                        //   child: Column(
                        //     children: widget.category != null ? widget.category?.map(
                        //           (category) => ExpansionTile(
                        //             tilePadding: EdgeInsets.all(0),
                        //             childrenPadding:
                        //                 EdgeInsets.symmetric(horizontal: 20),
                        //             title: Text(category.icon +
                        //                 ' ' +
                        //                 category.title), // Dinamik title
                        //             children: category.subcategories
                        //                 .map(
                        //                   // subkategoriya bo‘lsa
                        //                   (sub) => ListTile(
                        //                     dense: true,
                        //                     visualDensity:
                        //                         VisualDensity.compact,
                        //                     tileColor: Colors.transparent,
                        //                     splashColor: Colors.transparent,
                        //                     title: Text(
                        //                       sub.title,
                        //                       style: TextStyle(fontSize: 18),
                        //                     ),
                        //                   ),
                        //                 )
                        //                 .toList(),
                        //           ),
                        //         )
                        //         .toList()
                        //   ),
                        // ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: Column(
                            children: widget.category?.map<Widget>((category) {
                                  return ExpansionTile(
                                    tilePadding: EdgeInsets.all(0),
                                    childrenPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    title: Row(
                                      children: [
                                        Text(category.icon +
                                            ' ' +
                                            category
                                                .title), // Directly use the icon as a widget
                                        SizedBox(width: 8),
                                        Text(category.title), // Dinamik title
                                      ],
                                    ),
                                    children: category.subcategories
                                        .map<Widget>((sub) {
                                      return ListTile(
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        tileColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        title: Text(
                                          sub.title,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }).toList() ??
                                [],
                          ),
                        ),

                        Divider(color: AppColors.c_a12.withOpacity(0.3)),
                        // Narxi
                        const SizedBox(height: 16),
                        const Text("Narxi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        _buildPriceField("10", "so'mdan"),
                        const SizedBox(height: 12),
                        _buildPriceField("300", "so'mgacha"),
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
        ],
      ),
    );
  }
}
