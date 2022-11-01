import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm(
      {super.key,
      this.productCategory,
      this.productSubcategory,
      required this.pickProductCategory,
      required this.pickProductSubcategory});
  final productCategory;
  final productSubcategory;

  final Function pickProductCategory;
  final Function pickProductSubcategory;

  final categories = const ["Dry Goods", "Wet Goods", "Candy Goods"];
  final subcategories = const ["Cereal", "Rice", "Coffee"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 2,
          child: Text(
            'Select Category',
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 100,
          child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                  initialItem: categories.indexOf(productCategory)),
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                pickProductCategory(categories[index]);
              },
              children:
                  categories.map((item) => Center(child: Text(item))).toList()),
        ),
        const Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 2,
          child: Text(
            'Product Subcategory',
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 100,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
                initialItem: subcategories.indexOf(productSubcategory)),
            itemExtent: 50,
            onSelectedItemChanged: (index) {
              pickProductSubcategory(subcategories[index]);
            },
            children:
                subcategories.map((item) => Center(child: Text(item))).toList(),
          ),
        )
      ],
    );
  }
}
