import 'package:flutter/material.dart';

class CustomPassField extends StatefulWidget {
  CustomPassField(
      {super.key, required this.onChanged, required this.onSaved, this.cont});

  final Function? onSaved;
  final Function? onChanged;
  final TextEditingController? cont;
  late TextEditingController defaultCont;

  @override
  State<CustomPassField> createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field cannot be empty';
    }

    if (value.length < 8) {
      return 'too short';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: widget.cont ?? widget.defaultCont,
      keyboardType: TextInputType.text,
      obscureText: true,
      obscuringCharacter: '*',
      validator: validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        widget.onChanged!(value);
      },
      onSaved: (value) {
        widget.onSaved!(value);
      },
      /*decoration:
          const InputDecoration(helperText: 'required', labelText: 'password'),*/
      decoration: InputDecoration(
        hintText: "********",
        filled: true,
        fillColor: const Color.fromARGB(255, 230, 230, 230),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 230, 230, 230).withOpacity(0.5),
              width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 230, 230, 230).withOpacity(0.5)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
        ),
      ),
    );
  }
}
