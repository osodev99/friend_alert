import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.onPhoneDial,
  });

  final TextEditingController controller;
  final ValueChanged<String?> onPhoneDial;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final countryPicker = const FlCountryCodePicker();
  String phoneDial = '+591';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () async {
            final picked = await countryPicker.showPicker(
              context: context,
            );
            phoneDial = picked?.dialCode ?? '+591';
            widget.onPhoneDial(phoneDial);
            setState(() {});
          },
          icon: Text(phoneDial),
        ),
        hintText: 'Nro. celular',
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es requerido';
        }
        return null;
      },
    );
  }
}
