import 'package:auto_route/annotations.dart';
import 'package:events/di/di.dart';
import 'package:events/features/ui/common_widgets/positioned_button.dart';
import 'package:events/features/ui/routes/navigation/home_nav.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isFormValid = false;
  late ValueNotifier<bool> _formValidNotifier;

  @override
  void initState() {
    super.initState();
    _formValidNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    _formValidNotifier.dispose();
    super.dispose();
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'valid data is required';
    }
    return null;
  }

  void _validate() {
    if (_formKey.currentState?.validate() ?? false) {
      _formValidNotifier.value = true;
      return;
    }
    _formValidNotifier.value = false;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        top: false,
        child: ValueListenableBuilder(
          valueListenable: _formValidNotifier,
          builder: (context, isValid, _) {
            return Form(
              key: _formKey,
              onChanged: () => _validate(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _Field(
                          labelText: 'Card number',
                          hintText: 'xxxx xxxx xxxx xxxx',
                          validator: (_value) => _validateCardNumber(_value),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _Field(
                                labelText: 'Expiry date',
                                hintText: 'MM/YY',
                                validator: (_value) =>
                                    _validateCardNumber(_value),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _Field(
                                labelText: 'CVV',
                                hintText: '***',
                                obscureText: true,
                                validator: (_value) =>
                                    _validateCardNumber(_value),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        _Field(
                          labelText: 'Name on card',
                          hintText: 'Enter your name',
                          validator: (_value) => _validateCardNumber(_value),
                        ),
                      ],
                    ),
                  ),
                  PositionedButton(
                    text: 'Pay',
                    onPressed: () => getIt<HomeNav>().openStatus(true),
                    isEnabled: isValid,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    required this.validator,
  });

  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (_value) => validator(_value),
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black87,
            ),
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black54,
            ),
      ),
    );
  }
}
