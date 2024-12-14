import 'package:flutter/material.dart';
import 'package:flutter_mars_visitation/core/utils/extentions/app_media_query_extensions.dart';

class PageMoveButton extends StatelessWidget {
  final String buttonText;
  final bool isValid;
  final Function()? onPressed;
  const PageMoveButton({
    super.key,
    required this.buttonText, required this.isValid, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
      child: ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        style: ElevatedButton.styleFrom(
            backgroundColor:  Theme.of(context).colorScheme.primary,
          ),
        onPressed: isValid
            ? onPressed
            : null,
        child: Text(buttonText, style: TextStyle(color: isValid
            ?  Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary),),
      ),
    );
  }
}
