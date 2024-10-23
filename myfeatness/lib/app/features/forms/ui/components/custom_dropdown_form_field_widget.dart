import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdownFormFieldWidget extends StatefulWidget {
  const CustomDropdownFormFieldWidget({
    super.key,
    required this.title,
    required this.selectionOptions,
    required this.onChanged,
    this.validator,
  });
  final String title;
  final List<String> selectionOptions;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CustomDropdownFormFieldWidget> createState() =>
      _CustomDropdownFormFieldWidgetState();
}

class _CustomDropdownFormFieldWidgetState
    extends State<CustomDropdownFormFieldWidget> {
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
          DropdownButtonFormField<String>(
            value: null,
            elevation: 1,
            icon: const FaIcon(
              FontAwesomeIcons.chevronDown,
              color: Color(0xFFFF3333),
              size: 15,
            ),
            isExpanded: false,
            decoration: const InputDecoration(
              hintText: 'Escolher',
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFF3333),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF2E314D),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF2E314D),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              focusColor: Color(0xFFFF3333),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFF3333),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            ),
            iconEnabledColor: Colors.red, // Cor da seta
            items: widget.selectionOptions.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: widget.onChanged,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF3333),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
