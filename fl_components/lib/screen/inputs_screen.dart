
import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  static const routeName = "inputs";

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String,String> formValues = {
      'first_name':'Alex',
      'last_name':'Yovani',
      'email':'alexYovani53@gmail.com',
      'password':'1234',
      'role':'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms')
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children:  [
                   CustomInputField(
                      labelText: 'Nombre',
                      helperText: 'Solo letras',
                      hintTex: 'Ingrese un nombre',
                      formProperty: formValues.keys.elementAt(0),
                      formValues: formValues,
                      icon: Icons.person_pin_circle),
                  const SizedBox(height: 20),
                  CustomInputField(
                      labelText: 'Apellido',
                      helperText: 'Solo letras',
                      hintTex: 'Ingrese su apellido',
                      formProperty: formValues.keys.elementAt(1),
                      formValues: formValues,
                      icon: Icons.person_pin_circle),
                  const SizedBox(height: 20),
                  CustomInputField(
                      labelText: 'correo',
                      helperText: 'example@gmail.com',
                      hintTex: 'Ingrese un correo',
                      keyboardType: TextInputType.emailAddress,
                      formProperty: formValues.keys.elementAt(2),
                      formValues: formValues,
                      icon: Icons.person_pin_circle),
                  const SizedBox(height: 20),
                  CustomInputField(
                      labelText: 'Contraseña',
                      helperText: 'Caracteres permitidos',
                      hintTex: 'Contraseña de usuario',
                      obscureText:true,
                      formProperty: formValues.keys.elementAt(3),
                      formValues: formValues,
                      icon: Icons.person_pin_circle),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    value: 'Admin',
                    items: const [
                      DropdownMenuItem(
                        value: 'Admin',
                        child: Text('Admin'),
                      ),
                      DropdownMenuItem(
                        value: 'User',
                        child: Text('User'),
                      )
                    ], 
                    onChanged: (value) => formValues['role'] = value?? 'Admin'
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());
                      if(!myFormKey.currentState!.validate()){
                        print('formulario no valido');
                        return;
                      }
                      print(formValues);
                    }, 
                    child: const SizedBox( 
                      width: double.infinity,
                      child: Center(child: Text('Guardar')),
                    )
                  )
                ]
              ),
            )
          ),
        )
      )
    );
  }
}
