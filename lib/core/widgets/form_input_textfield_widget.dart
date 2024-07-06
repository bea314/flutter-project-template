
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles.dart';

class WidgetFormInputTextField extends StatefulWidget {
  const WidgetFormInputTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    required this.isRequired,
    this.keyboardType = TextInputType.none,
    this.cursorColor,
    this.onChange,
    this.onFieldSubmitted,
    this.isDark = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.suffixIcon,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.inputFormatters,
    this.validations,
    this.maxLines,
    this.focusChange,
    this.showLabelOutside = false,
  });
  final FontWeight fontWeight;
  final bool isRequired;
  final TextAlign textAlign;
  final double? fontSize;
  final bool isDark;
  final bool showLabelOutside;
  final bool autoFocus;
  final bool readOnly;
  final Function? onChange;
  final Function(String)? onFieldSubmitted;
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final Color? cursorColor;
  final TextEditingController controller;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validations;
  final int? maxLines;
  final Function? focusChange;
  @override
  State<WidgetFormInputTextField> createState() => _WidgetFormInputTextField();
}

class _WidgetFormInputTextField extends State<WidgetFormInputTextField> {
  final FocusNode _focus = FocusNode();
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      if (widget.focusChange != null) widget.focusChange!();
      formFieldKey.currentState!.validate();
    }
  }

  bool showText = true;
  bool isError = false;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.showLabelOutside ? null : 68,
      child: widget.showLabelOutside
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(widget.label,
                      style: const TextStyle(
                        fontSize: 14,
                        color: SystemColors.bluePrimary,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis),
                ),
                TextFormField(
                  maxLines: widget.maxLines,
                  key: formFieldKey,
                  textAlign: widget.textAlign,
                  enabled: !widget.readOnly,
                  autofocus: widget.autoFocus,
                  inputFormatters: widget.inputFormatters,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  cursorColor: widget.isDark ? SystemColors.bluePrimary : SystemColors.whiteColor,
                  controller: widget.controller,
                  obscureText: (widget.isPassword && showText),
                  focusNode: _focus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? valor) {
                    if ((valor == null || valor.isEmpty) && widget.isRequired) {
                      return "Este campo es requerido ";
                    }

                    if (widget.validations != null && !_focus.hasFocus) {
                      var function = widget.validations!;
                      String? respValid = function(valor);
                      if (respValid != null) {
                        return respValid;
                      }
                    }
                    return null;
                  },
                  onChanged: (valor) {
                    setState(() {
                      isError = (valor.isEmpty);
                    });
                    if (widget.onChange != null) {
                      widget.onChange!(valor);
                    }
                  },
                  style: TextStyle(
                    color: widget.readOnly
                        ? SystemColors.grey60
                        : widget.isDark
                            ? getTheme(context).primary
                            : SystemColors.whiteColor,
                    fontWeight: widget.fontWeight,
                    fontSize: widget.fontSize,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    isDense: true,
                    fillColor: SystemColors.whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 10.0),
                    helperText: " ",
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                    labelText: widget.showLabelOutside ? null : widget.label,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: SystemColors.grey40, fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isDark
                            ? getTheme(context).primary
                            : SystemColors.whiteColor,
                        width: 4,
                      ),
                    ),
                    errorStyle: const TextStyle(height: 0.4),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SystemColors.red,
                        width: 2,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isDark ? SystemColors.grey40 : SystemColors.whiteColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isDark
                            ? getTheme(context).primary
                            : SystemColors.whiteColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isDark ? SystemColors.bluePrimary80 : SystemColors.whiteColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SystemColors.red,
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: widget.readOnly
                          ? SystemColors.grey60
                          : (_focus.hasFocus ||
                                  widget.controller.text.isNotEmpty)
                              ? widget.isDark
                                  ? getTheme(context).primary
                                  : SystemColors.whiteColor
                              : (widget.isDark
                                  ? getTheme(context).primary
                                  : SystemColors.whiteColor),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          : TextFormField(
              key: formFieldKey,
              textAlign: widget.textAlign,
              enabled: !widget.readOnly,
              autofocus: widget.autoFocus,
              inputFormatters: widget.inputFormatters,
              onFieldSubmitted: widget.onFieldSubmitted,
              cursorColor: widget.isDark ? SystemColors.bluePrimary : SystemColors.whiteColor,
              controller: widget.controller,
              obscureText: (widget.isPassword && showText),
              focusNode: _focus,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? valor) {
                if ((valor == null || valor.isEmpty) && widget.isRequired) {
                  return "Este campo es requerido ";
                }

                if (widget.validations != null && !_focus.hasFocus) {
                  var function = widget.validations!;
                  String? respValid = function(valor);
                  if (respValid != null) {
                    return respValid;
                  }
                }
                return null;
              },
              onChanged: (valor) {
                setState(() {
                  isError = (valor.isEmpty);
                });
                if (widget.onChange != null) {
                  widget.onChange!(valor);
                }
              },
              style: TextStyle(
                color: widget.readOnly
                    ? SystemColors.grey60
                    : widget.isDark
                        ? getTheme(context).primary
                        : SystemColors.whiteColor,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: widget.floatingLabelBehavior,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showText = !showText;
                          });
                        },
                        child: showText
                            ? Icon(
                                Icons.visibility_off,
                                color: (_focus.hasFocus ||
                                        widget.controller.text.isNotEmpty)
                                    ? widget.isDark
                                        ? getTheme(context).primary
                                        : SystemColors.whiteColor
                                    : (widget.isDark
                                            ? getTheme(context).primary
                                            : SystemColors.whiteColor)
                                        .withOpacity(0.6),
                              )
                            : Icon(
                                Icons.visibility,
                                color: (_focus.hasFocus ||
                                        widget.controller.text.isNotEmpty)
                                    ? widget.isDark
                                        ? getTheme(context).primary
                                        : SystemColors.whiteColor
                                    : (widget.isDark
                                            ? getTheme(context).primary
                                            : SystemColors.whiteColor)
                                        .withOpacity(0.6),
                              ),
                      )
                    : widget.suffixIcon,
                labelText: widget.showLabelOutside ? null : widget.label,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: SystemColors.grey40, fontSize: 14),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDark
                        ? getTheme(context).primary
                        : SystemColors.whiteColor,
                    width: 4,
                  ),
                ),
                errorStyle: const TextStyle(height: 0.4),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SystemColors.red,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDark ? SystemColors.grey40 : SystemColors.whiteColor,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDark
                        ? getTheme(context).primary
                        : SystemColors.whiteColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isDark
                        ? getTheme(context).primary
                        : SystemColors.whiteColor,
                    width: 2,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SystemColors.red,
                    width: 2,
                  ),
                ),
                labelStyle: TextStyle(
                  color: widget.readOnly
                      ? SystemColors.grey60
                      : (_focus.hasFocus || widget.controller.text.isNotEmpty)
                          ? widget.isDark
                              ? getTheme(context).primary
                              : SystemColors.whiteColor
                          : (widget.isDark
                              ? getTheme(context).primary
                              : SystemColors.whiteColor),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
