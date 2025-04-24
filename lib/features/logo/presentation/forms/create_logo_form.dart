import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../business/entities/forms/create_logo_form_entity.dart';

/// Form for creating a new logo
class CreateLogoForm extends StatefulWidget {
  /// Form for creating a new logo
  const CreateLogoForm({super.key});

  @override
  State<CreateLogoForm> createState() => _CreateLogoFormState();
}

class _CreateLogoFormState extends State<CreateLogoForm> {
  late GlobalKey<FormBuilderState> _formKey;
  late CreateLogoFormEntity _formEntity;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _formEntity = CreateLogoFormEntity(
      formKey: _formKey,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FormBuilder(
        key: _formEntity.formKey,
        child: ListView(
          children: [
            // FormBuilderTextField(
            //   name: _formEntity.nameInput.field,
            //   decoration: const InputDecoration(
            //     labelText: "comercio",
            //   ),
            //   onChanged: (value) => ,
            // ),
          ],
        ),
      );
}
