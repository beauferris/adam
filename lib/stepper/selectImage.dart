import 'dart:convert';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  const SelectImage(
      {super.key, this.imageTitle, this.image, required this.pickImage});
  final imageTitle;
  final image;
  final Function pickImage;
  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.imageTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          widget.image != ""
              ? Image.memory(
                  base64Decode(widget.image.split(',').last!),
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                )
              : Container(
                  decoration: const BoxDecoration(),
                  height: 400,
                  width: 400,
                  child: const Icon(
                    Icons.photo_camera,
                  ),
                ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    onPressed: () =>
                        widget.pickImage(ImageSource.camera, widget.image),
                    child: const Icon(Icons.camera_alt)),
              ),
              ElevatedButton(
                  onPressed: () =>
                      widget.pickImage(ImageSource.gallery, widget.image),
                  child: const Icon(Icons.image_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
