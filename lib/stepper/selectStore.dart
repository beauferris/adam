import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/stepper/tagForm.dart';

class SelectStore extends StatefulWidget {
  const SelectStore(
      {super.key,
      this.store,
      this.postalCode,
      this.city,
      this.province,
      this.category,
      required this.pickCategory,
      required this.pickProvince});

  final Function pickCategory;
  final Function pickProvince;

  final store;
  final postalCode;
  final city;
  final province;
  final category;

  @override
  State<SelectStore> createState() => _SelectStoreState();
}

class _SelectStoreState extends State<SelectStore> {
  final storeCategories = [
    "Grocery Store",
    "Drug Store",
    "Retail Warehouse",
    "Department Store",
    "Convenience Store"
  ];

  final provinces = [
    "Alberta",
    "British Columbia",
    "Manitoba",
    "New Brunswick",
    "Northwest Territories",
    "Nova Scotia",
    "Nunavut",
    "Ontario",
    "Prince Edward Island",
    "Quebec",
    "Saskatchewan",
    "Yukon"
  ];
  var value;
  @override
  void initState() {
    value =
        widget.category != null ? storeCategories.indexOf(widget.category) : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Enter New Location',
            style: TextStyle(fontSize: 20),
          ),
        ),
        buildStore(),
        buildPostalCode(),
        buildCity(),
        buildProvince(),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Store Category',
            style: TextStyle(fontSize: 15),
          ),
        ),
        buildStoreCategory(),
      ],
    );
  }

  Widget buildStore() => Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: widget.store,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Store',
            fillColor: const Color.fromRGBO(255, 255, 255, 1),
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      );
  Widget buildPostalCode() => Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: widget.postalCode,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Postal Code',
            fillColor: const Color.fromRGBO(255, 255, 255, 1),
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      );
  Widget buildCity() => Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: widget.city,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'City',
            fillColor: const Color.fromRGBO(255, 255, 255, 1),
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      );
  Widget buildProvince() => Column(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 2,
            child: Text(
              'Province',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 100,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                  initialItem: provinces.indexOf(widget.province)),
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                widget.pickProvince(provinces[index]);
              },
              children:
                  provinces.map((item) => Center(child: Text(item))).toList(),
            ),
          )
        ],
      );
  Widget buildStoreCategory() => Wrap(
      children: storeCategories
          .map((item) => Padding(
                padding: const EdgeInsets.only(right: 2),
                child: ChoiceChip(
                  label: Text(
                    item,
                    style: const TextStyle(fontSize: 12),
                  ),
                  selected: (value == storeCategories.indexOf(item)),
                  onSelected: (bool selected) {
                    setState(() {
                      value =
                          (selected ? storeCategories.indexOf(item) : null)!;
                      widget.pickCategory(
                          storeCategories[storeCategories.indexOf(item)]);
                    });
                  },
                ),
              ))
          .toList());
}