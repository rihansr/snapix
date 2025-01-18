import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/constants.dart';

class Button extends StatelessWidget {
  final Color? background;
  final TextStyle? fontStyle;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final String? label;
  final double? fontSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool disable;
  final bool loading;
  final Function()? onPressed;

  const Button({
    super.key,
    this.label,
    this.background,
    this.fontStyle,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding = const EdgeInsets.all(14),
    this.disable = false,
    this.loading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = (fontStyle ?? theme.textTheme.titleSmall)?.copyWith(
      color: disable
          ? theme.disabledColor
          : fontColor ?? fontStyle?.color ?? theme.colorScheme.onPrimary,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

    Color? fillColor =
        disable ? theme.disabledColor : background ?? theme.primaryColor;

    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(fillColor),
          textStyle: WidgetStatePropertyAll(labelStyle),
          padding: WidgetStatePropertyAll(padding),
          shape: const WidgetStatePropertyAll(StadiumBorder()),
        ),
        onPressed: () {
          if (!(disable || loading)) {
            HapticFeedback.selectionClick();
            onPressed?.call();
          }
        },
        child: AnimatedCrossFade(
          firstChild: Text(
            key: const Key('default_state'),
            label!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: labelStyle,
          ),
          secondChild: SizedBox(
            key: const Key('loading_state'),
            height: labelStyle?.fontSize == null
                ? null
                : labelStyle!.fontSize! * 1.5,
            child: CupertinoActivityIndicator(
              color: labelStyle?.color,
            ),
          ),
          crossFadeState:
              loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: kDefaultDuration,
        ),
      ),
    );
  }
}
