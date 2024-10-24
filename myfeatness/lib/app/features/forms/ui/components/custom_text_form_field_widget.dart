import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.title,
    required this.suffixText,
    required this.controller,
    required this.onChanged,
    this.validator,
  });
  final String title;
  final String suffixText;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Staatliches',
                fontSize: 25,
                color: Color(0xFF2E314D),
              ),
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            inputFormatters: const [],
            cursorColor: const Color(0xFFFF3333),
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF3333),
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffix: Text(
                widget.suffixText,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF3333),
                ),
              ),
              focusColor: const Color(0xFFFF3333),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFF3333),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF3333),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF2E314D),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF2E314D),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
