import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets.dart';
import 'core/core.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final userCode = TextEditingController();
  final password = TextEditingController();

  validateInput() {
    isReady = userCode.text.isNotEmpty && password.text.isNotEmpty;
    setState(() {});
  }

  bool isReady = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: CAMBIAR ESTILO DEL LOGIN, INPUTS
    // TODO: MEJORAR VALIDACIONES
    // TODO: AGREGAR LOGICA SIN CONEXION A SERVICIO / FUNCIONALIDAD INICIAL
    // TODO: PROVIDER?
    // TODO: RECUPERAR CONTRASEÑA
    // TODO: VERIFICAR VISTA EN MOVIL
    // TODO: MEJORAR ESTILO / APARIENCIA DE LOGIN
    return Container(
      color: SystemColors.whiteColor,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                SystemImages.krealiFondoBlanco,
                fit: BoxFit.fill,
              )),
          Center(
            child: Container(
              width: 500,
              height: 700,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: (getTheme(context).primary),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      SystemImages.krealiLogoSimbLetrasHB,
                      width: 400,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Ingresa tus datos",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: SystemFonts.titleFont,
                      ),
                    ),
                    const SizedBox(height: 30),
                    WidgetFormInputTextField(
                      autoFocus: true,
                      isRequired: true,
                      onFieldSubmitted: (_) => {
                        FocusScope.of(context).nextFocus(),
                      },
                      cursorColor: Colors.white,
                      label: "Correo electrónico",
                      controller: userCode,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      onChange: (valor) {
                        validateInput();
                      },
                    ),
                    const SizedBox(height: 30),
                    WidgetFormInputTextField(
                      onFieldSubmitted: (_) => {
                        // TODO: ACCION MANEJAR LOGIN
                        //TODO: Add a Debounce because it shows a lot of alerts
                      },
                      cursorColor: Colors.white,
                      isRequired: true,
                      label: "Contraseña",
                      controller: password,
                      isPassword: true,
                      maxLines: 1,
                      onChange: (valor) {
                        validateInput();
                      },
                    ),
                    const SizedBox(height: 30),
                    WidgetLoginButton(
                      title: 'Ingresar',
                      disabled: !isReady || loading,
                      loading: loading,
                      onPress: () async {
                        // TODO: ACCION MANEJAR LOGIN
                        print('login ON');
                      },
                    ),
                    // const SizedBox(height: 40),
                    // TODO: INSERTAR PIE DE PAGINA
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
