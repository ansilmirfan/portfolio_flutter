import 'package:flutter/material.dart';

//custom text that displays a hash (#) followed by text
class HashText extends StatelessWidget {
  final String text;
  //if the title is true then a larger text style
  final bool title;
  //id the selected is true then a non bold grey text style
  final bool selected;
  const HashText({
    super.key,
    required this.text,
    this.title = false,
    this.selected = false,
  });
  factory HashText.title({required String text}) {
    return HashText(text: text, title: true);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? hashTextStyle;
    TextStyle? textStyle;
    //if the title is true then a larger text style
    if (title) {
      //text style for the hash text with primary color
      hashTextStyle = Theme.of(context).textTheme.headlineMedium;
      //text style for the following text
      textStyle = Theme.of(context).textTheme.headlineSmall;
    } else {
      //text style for the hash text with primary color
      hashTextStyle = Theme.of(context).textTheme.bodySmall;
      //text style for the following text
      textStyle = Theme.of(context).textTheme.bodyMedium;
    }
    //if selected is true then the text is grey color with small font weight
    if (selected) {
      textStyle = Theme.of(context).textTheme.bodyLarge;
    }
    return RichText(
      text: TextSpan(
        text: '#',
        style: hashTextStyle,
        children: [TextSpan(text: text, style: textStyle)],
      ),
    );
  }
}
