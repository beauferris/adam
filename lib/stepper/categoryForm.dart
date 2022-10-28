import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm(
      {super.key, this.productCategory, this.productSubcategory});
  final productCategory;
  final productSubcategory;

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
              itemExtent: 50,
              onSelectedItemChanged: (index) {},
              children: const [
                Center(child: Text("Dry Goods")),
                Center(child: Text("Wet Goods")),
                Center(child: Text("Candy Goods")),
              ]),
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
              itemExtent: 50,
              onSelectedItemChanged: (index) {},
              children: const [
                Center(child: Text("Cereal")),
                Center(child: Text("Rice")),
                Center(child: Text("Coffee"))
              ]),
        ),
        // itemCategory(),
        // itemSubcategory()
      ],
    );
  }

  Widget itemCategory() => TextFormField(
        controller: productCategory,
        decoration: const InputDecoration(labelText: 'Select Product Category'),
      );
  Widget itemSubcategory() => TextFormField(
        controller: productSubcategory,
        decoration:
            const InputDecoration(labelText: 'Select Product Subcategory'),
      );
}
