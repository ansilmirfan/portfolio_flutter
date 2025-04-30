import 'package:flutter/material.dart';

class BorderedTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool dark;
  const BorderedTextButton({
    super.key,
    required this.onTap,
    this.dark = false,
    required this.text,
  });
  //factor constructor dark for grey look
  factory BorderedTextButton.dark({
    required VoidCallback onTap,
    required String text,
  }) {
    return BorderedTextButton(onTap: onTap, text: text, dark: true);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          //if the dark is true then the border color will be grey otherwise it will be primary color
          BeveledRectangleBorder(
            side: BorderSide(
              color:
                  dark
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      onPressed: () {},
      //if the dark is true then the text will be in grey with lesser weight otherwise white color whith more fontweight
      child: Text(
        text,
        style:
            dark
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
