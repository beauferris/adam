import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TagForm extends StatefulWidget {
  const TagForm(
      {super.key,
      this.packageSurvey,
      this.packageColour,
      required this.pickPackageSurvey,
      required this.pickPackageColour});

  final packageSurvey;
  final packageColour;

  final Function pickPackageSurvey;
  final Function pickPackageColour;

  @override
  State<TagForm> createState() => _TagFormState();
}

class _TagFormState extends State<TagForm> {
  var survey = [
    "Cartoon",
    "Brand Mascot",
    "Cartoon Character from a TV show or movie",
    "Celebrity/Athlete",
    "Special Offer",
    "Picture of Food",
    "Colour of Package",
    "Movement",
    "Lettering(Font)",
    "Words on Package",
    "Shape of Food",
    "Flavour of food",
    "Colour of Food",
    "Shape of Package",
    "Other"
  ];

  var colours = ["Red", "Green", "Blue", "Yellow", "Orange", "Rainbow"];

  var value;
  var colourValue;

  @override
  void initState() {
    if (widget.packageSurvey != "") {
      value = survey.indexOf(widget.packageSurvey);
    } else {
      value = 0;
      widget.pickPackageSurvey(survey[0]);
    }

    if (widget.packageColour != "") {
      colourValue = colours.indexOf(widget.packageColour);
    } else {
      colourValue = 0;
      widget.pickPackageColour(colours[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const Text(
              'What is the main reason that you think this packaging  is marketed towards kids?'),
          myChip(),
          const Text('What Colour is the Package?'),
          colourChip()
        ],
      ),
    );
  }

  Widget myChip() => Wrap(
      spacing: 0,
      runSpacing: 0,
      children: survey
          .map((item) => Padding(
                padding: const EdgeInsets.only(right: 2),
                child: ChoiceChip(
                  label: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  selected: (value == survey.indexOf(item)),
                  onSelected: (bool selected) {
                    setState(() {
                      value = (selected ? survey.indexOf(item) : null)!;
                      widget.pickPackageSurvey(survey[survey.indexOf(item)]);
                    });
                  },
                ),
              ))
          .toList());
  Widget colourChip() => Wrap(
      children: colours
          .map((item) => Padding(
                padding: const EdgeInsets.only(right: 2),
                child: ChoiceChip(
                  label: Text(
                    item,
                    style: const TextStyle(fontSize: 11),
                  ),
                  selected: (colourValue == colours.indexOf(item)),
                  onSelected: (bool selected) {
                    setState(() {
                      colourValue = (selected ? colours.indexOf(item) : null)!;
                      widget.pickPackageColour(colours[colours.indexOf(item)]);
                    });
                  },
                ),
              ))
          .toList());
}
