import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:x_equis/src/shared/widgets/phone_text_field.dart';

class TrustFriendForm extends StatefulWidget {
  const TrustFriendForm({super.key, required this.onSave});

  final void Function(String name, String phone) onSave;

  @override
  State<TrustFriendForm> createState() => _TrustFriendFormState();
}

class _TrustFriendFormState extends State<TrustFriendForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final phoneCont = TextEditingController();
  String phoneDial = '+ 591';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Agregar amigo de confianza',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: nameCont,
                decoration: const InputDecoration(
                  hintText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              const Gap(12),
              PhoneTextField(
                controller: phoneCont,
                onPhoneDial: (value) {
                  phoneDial = value ?? '+ 591';
                },
              ),
              const Gap(12),
              Center(
                child: FilledButton(
                  onPressed: () => widget.onSave(
                    nameCont.text,
                    '${phoneDial.trim()}${phoneCont.text}',
                  ),
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
