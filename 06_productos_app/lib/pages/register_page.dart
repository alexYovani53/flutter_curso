import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/provider/login_form_provider.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:productos_app/services/notifications_service.dart';
import 'package:productos_app/utils/app_decoration_input.dart';
import 'package:productos_app/widgets/widget_auth_background.dart';
import 'package:productos_app/widgets/widget_card_container.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage ({super.key});

  static const routeName = "register"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250,),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Registrarse', style: Theme.of(context).textTheme.headline4 ),
                    const SizedBox(height: 20),
                    ChangeNotifierProvider(
                      create: (context) => LoginFromProvider(),
                      lazy: false,
                      child: const _LoginForm(),
                    )
                  ],
                )
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, LoginPage.routeName),
                 style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder())
                ),
                child: const Text('Ya tienes una cuenta?', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,)),
              )
              
            ],
          ),
        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<LoginFromProvider>(context);
    return Container(
      child: Form(
        key: registerForm.formState,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => registerForm.email = value,
              decoration: AppDecorationInput.authInputDecoration(
                hintText: "name@dominio.com",
                labelText: "Correo electronico",
                prefixIcon: Icons.alternate_email_outlined
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value??'') ? null : "No es un email"; 
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => registerForm.password = value,
              decoration: AppDecorationInput.authInputDecoration(                
                hintText: "******",
                labelText: "Contraseña",
                prefixIcon: Icons.lock_outline
              ),
              validator: (value){
                if(value != null && value.length > 6) return null;
                return "La contraseña debe de ser de 6 caracteres"; 
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              color: Colors.deepPurple,
              disabledColor: Colors.grey,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: registerForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthService>(context, listen: false);
                if (!registerForm.isValidForm()) return;
                registerForm.isLoading = true;

                final errorMassage = await authService.createuser(registerForm.email, registerForm.password);
                if(errorMassage == null){
                  registerForm.isLoading = false;
                  Navigator.pushNamed(context, HomePage.routeName);
                }else{
                  NotificationsService.showSnackbar(errorMassage);
                  registerForm.isLoading = false;
                }

              },
              child: Text(
                registerForm.isLoading 
                  ? 'Esperar'
                  : 'Registrar', 
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}