import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Confirm extends StatefulWidget {
  const Confirm(
      {super.key,
      this.frontImage,
      this.nutrientImage,
      this.ingredientImage,
      this.location,
      this.category,
      this.subcategory});

  final frontImage;
  final nutrientImage;
  final ingredientImage;
  final location;
  final category;
  final subcategory;

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Packaging",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 500,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              children: [
                widget.frontImage != ""
                    ? Column(
                        children: [
                          Expanded(
                            child: Image.memory(
                              base64Decode(widget.frontImage.split(',').last!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text("Front of Box")
                        ],
                      )
                    : Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(250, 0, 0, 0)),
                        height: 300,
                      ),
                widget.nutrientImage != ""
                    ? Column(
                        children: [
                          Expanded(
                            child: Image.memory(
                              base64Decode(
                                  widget.nutrientImage.split(',').last!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text("Nurition Facts")
                        ],
                      )
                    : Container(
                        decoration:
                            BoxDecoration(color: Color.fromARGB(250, 0, 0, 0)),
                        height: 300,
                      ),
                widget.ingredientImage != ""
                    ? Column(
                        children: [
                          Expanded(
                            child: Image.memory(
                              base64Decode(
                                  widget.ingredientImage.split(',').last!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text("Ingredients List")
                        ],
                      )
                    : Container(
                        decoration:
                            BoxDecoration(color: Color.fromARGB(250, 0, 0, 0)),
                        height: 300,
                      ),
              ],
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Location Taken: ${widget.location}',
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Category: ${widget.category}',
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Subcategory: ${widget.subcategory}',
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
