import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {super.key,
      required this.label,
      required this.price,
      required this.onTap,
      required this.index,
      required this.menuIsVisible,
      required this.onEdit,
      required this.onDelete});
  final String label;
  final String price;
  final VoidCallback onTap;
  final int index;
  final bool menuIsVisible;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: widget.label,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: widget.price,
                      color: Colors.white,
                      fontSize: 20,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                )
              ],
            ),
            Visibility(
              visible: widget.menuIsVisible,
              child: Positioned(
                top: -10,
                left: 120,
                child: Container(
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 2),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: widget.onEdit,
                          child: const TextWidget(
                            text: "Edit SKU",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: widget.onDelete,
                          child: const TextWidget(
                            text: "Delete SKU",
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
