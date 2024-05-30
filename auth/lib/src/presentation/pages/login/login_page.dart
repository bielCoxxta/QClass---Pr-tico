import 'package:auth/constants/assets_path.dart';
import 'package:core/core.dart';
import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final infoApp = Modular.get<PackageInfoEntity>();

  final cpfField = const ValueKey('cpf_field');
  final cpfController = TextEditingController();
  final passController = TextEditingController();

  bool hidePassword = true;
  bool cpfIsValid = false;
  bool passIsValid = false;
  bool isLoading = false;
  bool activeButton = false;

  final x = Modular.get<ThemeController>(); // remover depois

  bool validateCpf(String? input) {
    setState(() {
      cpfIsValid = FormValidators.invalidCPF(input) == null &&
          FormValidators.emptyField(input) == null;
    });
    checkButton();
    return cpfIsValid;
  }

  bool validatePass(String? input) {
    passIsValid = (input!.isNotEmpty && input.length > 5);
    checkButton();
    return passIsValid;
  }

  void checkButton() {
    setState(() {
      activeButton = (cpfIsValid & passIsValid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode
          ? _colorScheme.secondary
          : _colorScheme.onBackground,
      body: FullSizeScrollableWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    x.state == ThemeMode.dark
                        ? Icons.brightness_4_rounded
                        : Icons.brightness_6_rounded,
                    color: context.colorScheme.background,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: context.colorScheme.onBackground,
                  ),
                  onPressed: () {
                    x.changeTheme();
                  },
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.xxxl.value,
              ),
              child: CustomImage(
                svgAsset: AssetsPath.qclassLogo2,
                packageName: AssetsPath.packageName,
                imageColor: AppColorsBase.white,
              ),
            ),
            const Spacer(),
            Spacing.md.vertical,
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: AppThemeBase.radiusCircular,
                  topRight: AppThemeBase.radiusCircular,
                ),
                child: ColoredBox(
                  color: _colorScheme.background,
                  child: SizedBox(
                    width: double.infinity,
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Spacing.md.value,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacing.md.vertical,
                            Center(
                              child: Text(
                                'Entre com seu usuário',
                                style: _textTheme.titleMedium,
                              ),
                            ),
                            Spacing.md.vertical,
                            CustomInputField(
                              key: cpfField,
                              enabled: !isLoading,
                              controller: cpfController,
                              hintText: '000.000.000-00',
                              keyboardType: TextInputType.number,
                              validators: const [
                                FormValidators.emptyField,
                                FormValidators.invalidCPF,
                              ],
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                FormMasks.cpf(),
                              ],
                              onChanged: validateCpf,
                              labelWidget: const InputLabel(
                                label: 'Informe seu CPF',
                              ),
                            ),
                            Spacing.sm.vertical,
                            CustomInputField(
                              hintText: 'Digite aqui',
                              controller: passController,
                              enabled: !isLoading,
                              obscureText: hidePassword,
                              labelWidget: const InputLabel(label: 'Senha'),
                              onChanged: validatePass,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off_rounded,
                                  color: _colorScheme.onBackground,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                            Spacing.xs.vertical,
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Spacing.xxs.value,
                                  horizontal: 2.responsiveWidth,
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Esqueci a senha',
                                    style: _textTheme.labelMedium,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                            Spacing.xxxl.vertical,
                            CustomButton.text(
                              isEnabled: activeButton,
                              isLoading: isLoading,
                              text: 'Entrar',
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                              },
                            ),
                            Spacing.xxxl.vertical,
                            Center(
                              child: Text(
                                'Version ${infoApp.version}',
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: AppColorsBase.info,
                                ),
                              ),
                            ),
                            Spacing.md.vertical,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextTheme get _textTheme => Theme.of(context).textTheme;
  ColorScheme get _colorScheme => Theme.of(context).colorScheme;
}
