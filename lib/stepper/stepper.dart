import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/stepper/categoryForm.dart';
import 'package:myapp/stepper/confirm.dart';
import 'package:myapp/stepper/selectImage.dart';
import 'package:myapp/stepper/selectStore.dart';
import 'package:myapp/stepper/tagForm.dart';

class MyStepper extends StatefulWidget {
  const MyStepper(
      {super.key,
      this.store,
      this.postalCode,
      this.city,
      this.province,
      this.frontImage,
      this.ingredientImage,
      this.nutrientImage,
      this.category,
      this.productCategory,
      this.productSubcategory,
      this.packageSurvey,
      this.packageColour});

  final store;
  final postalCode;
  final city;
  final province;
  final category;

  final frontImage;
  final ingredientImage;
  final nutrientImage;

  final productCategory;
  final productSubcategory;

  final packageSurvey;
  final packageColour;

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;
  bool disabled = true;

  TextEditingController storeController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String provinceController = "";
  String categoryController = "";

  String frontImage = "";
  String nutrientImage = "";
  String ingredientImage = "";

  String storeCategory = "";

  String productCategoryController = "";
  String productSubcategoryController = "";

  String packageSurvey = "";
  String packageColour = "";

  @override
  void initState() {
    super.initState();

    storeController.addListener(() {
      setState(() {
        disabled = storeController.text.isEmpty ||
            postalCodeController.text.isEmpty ||
            cityController.text.isEmpty;
      });
    });

    postalCodeController.addListener(() {
      setState(() {
        disabled = storeController.text.isEmpty ||
            postalCodeController.text.isEmpty ||
            cityController.text.isEmpty;
      });
    });
    cityController.addListener(() {
      setState(() {
        disabled = storeController.text.isEmpty ||
            postalCodeController.text.isEmpty ||
            cityController.text.isEmpty;
      });
    });

    if (widget.store != null) {
      storeController.text = widget.store;
    }

    if (widget.postalCode != null) {
      postalCodeController.text = widget.postalCode;
    }

    if (widget.city != null) {
      cityController.text = widget.city;
    }

    if (widget.province != null) {
      provinceController = widget.province;
    }

    if (widget.category != null) {
      setState(() {
        categoryController = widget.category;
      });
    }

    if (widget.frontImage != null) {
      setState(() {
        frontImage = widget.frontImage;
      });
    }

    if (widget.nutrientImage != null) {
      setState(() {
        nutrientImage = widget.nutrientImage;
      });
    }

    if (widget.ingredientImage != null) {
      setState(() {
        ingredientImage = widget.ingredientImage;
      });
    }

    if (widget.productCategory != null) {
      setState(() {
        productCategoryController = widget.productCategory;
      });
    }

    if (widget.productSubcategory != null) {
      setState(() {
        productSubcategoryController = widget.productSubcategory;
      });
    }

    if (widget.packageSurvey != null) {
      setState(() {
        packageSurvey = widget.packageSurvey;
      });
    }

    if (widget.packageColour != null) {
      setState(() {
        packageColour = widget.packageColour;
      });
    }
  }

  Future pickImage(src, myImage) async {
    final image = await ImagePicker().pickImage(source: src);
    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    setState(() {
      frontImage = base64Image;
      disabled = false;
    });
  }

  Future pickImageNutrients(src, myImage) async {
    final image = await ImagePicker().pickImage(source: src);
    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    setState(() {
      nutrientImage = base64Image;
      disabled = false;
    });
  }

  Future pickImageIngredients(src, myImage) async {
    final image = await ImagePicker().pickImage(source: src);
    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    setState(() {
      ingredientImage = base64Image;
      disabled = false;
    });
  }

  void pickCategory(category) {
    setState(() {
      categoryController = category;
    });
  }

  void pickProvince(province) {
    setState(() {
      provinceController = province;
    });
  }

  void pickProductCategory(category) {
    setState(() {
      productCategoryController = category;
    });
  }

  void pickProductSubcategory(category) {
    setState(() {
      productSubcategoryController = category;
    });
  }

  void pickPackageSurvey(category) {
    setState(() {
      packageSurvey = category;
    });
  }

  void pickPackageColour(category) {
    setState(() {
      packageColour = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step ${currentStep + 1}')),
      body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            setState(() {
              final isLastStep = currentStep == getSteps().length - 1;

              if (currentStep == 1 && frontImage == "") {
                disabled = true;
              }

              if (currentStep == 2 && nutrientImage == "") {
                disabled = true;
              }
              if (currentStep == 3 && ingredientImage == "") {
                disabled = true;
              }

              if (isLastStep) {
                var data = {
                  "location": {
                    "store": storeController.text,
                    "postalCode": postalCodeController.text,
                    "city": cityController.text,
                    "province": provinceController,
                    "category": categoryController,
                  },
                  "survey": {
                    "packageSurvey": packageSurvey,
                    "packageColour": packageColour
                  },
                  "product": {
                    "category": productCategoryController,
                    "subcategory": productSubcategoryController
                  },
                  "images": {
                    "frontImage": frontImage,
                    "nutrientImage": nutrientImage,
                    "ingredientImage": ingredientImage
                  }
                };
                print(data);
              } else {
                currentStep += 1;
              }
            });
          },
          onStepCancel: (() {
            setState(() {
              disabled = false;

              if (currentStep == 0) {
              } else {
                currentStep -= 1;
              }
            });
          }),
          controlsBuilder: (context, details) {
            return Column(children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      onPressed: disabled ? null : details.onStepContinue,
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
              if (currentStep != 0)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff000000),
                      backgroundColor: Colors.transparent,
                      elevation: 0),
                  onPressed: details.onStepCancel,
                  child: const Text("Back"),
                )
            ]);
          }),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text(''),
          content: SelectStore(
            store: storeController,
            postalCode: postalCodeController,
            city: cityController,
            province: provinceController,
            category: categoryController,
            pickCategory: pickCategory,
            pickProvince: pickProvince,
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          content: CategoryForm(
              productCategory: productCategoryController,
              productSubcategory: productSubcategoryController,
              pickProductCategory: pickProductCategory,
              pickProductSubcategory: pickProductSubcategory),
          title: const Text(''),
        ),
        Step(
          isActive: currentStep >= 2,
          content: SelectImage(
            imageTitle: 'Front packaging',
            image: frontImage,
            pickImage: pickImage,
          ),
          title: const Text(''),
        ),
        Step(
          isActive: currentStep >= 3,
          content: SelectImage(
            imageTitle: 'Nutrition Facts',
            image: nutrientImage,
            pickImage: pickImageNutrients,
          ),
          title: const Text(''),
        ),
        Step(
          isActive: currentStep >= 4,
          content: SelectImage(
            imageTitle: 'Ingredients List',
            image: ingredientImage,
            pickImage: pickImageIngredients,
          ),
          title: const Text(''),
        ),
        Step(
          isActive: currentStep >= 5,
          content: TagForm(
            packageSurvey: packageSurvey,
            packageColour: packageColour,
            pickPackageSurvey: pickPackageSurvey,
            pickPackageColour: pickPackageColour,
          ),
          title: const Text(''),
        ),
        Step(
          isActive: currentStep >= 6,
          content: Confirm(
            frontImage: frontImage,
            nutrientImage: nutrientImage,
            ingredientImage: ingredientImage,
            location: storeController.text,
            category: productCategoryController,
            subcategory: productSubcategoryController,
          ),
          title: const Text(''),
        )
      ];
}
