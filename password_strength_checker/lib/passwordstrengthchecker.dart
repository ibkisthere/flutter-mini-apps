import 'package:flutter/material.dart';

class PasswordStrengthChecker extends StatefulWidget {
  const PasswordStrengthChecker(
      {super.key, required this.password, required this.onStrengthChanged});

  final String password;

  final Function(bool isStrong) onStrengthChanged;

  @override
  State<PasswordStrengthChecker> createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  @override
  void didUpdateWidget(covariant PasswordStrengthChecker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.password != oldWidget.password) {
      final isStrong = _validators.entries
          .every((entry) => entry.key.hasMatch(widget.password));
      // call callback with new value to notify parent widget
      WidgetsBinding.instance
          .addPostFrameCallback((_) => widget.onStrengthChanged(isStrong));
    }
  }

  @override
  Widget build(BuildContext context) {
     /// If the password is empty yet, we'll show validation messages in plain
    /// color, not green or red
    final hasValue = widget.password.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _validators.entries.map((entry) {
        /// Check if the password matches the current validator requirement
        final hasMatch = entry.key.hasMatch(widget.password);

        /// Based on the match, we'll show the validation message in green or
        /// red color
        final color =
            hasValue ? (hasMatch ? Colors.green : Colors.red) : null;

        return Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            entry.value,
            style: TextStyle(color: color),
          ),
        );
      }).toList(),
    );
  }
}

final Map<RegExp, String> _validators = {
  RegExp(r'[a-z]'): '1 or more lowercase letter',
  RegExp(r'[A-Z]'): '1 or more uppercase letters',
  RegExp(r'[0-9]'): '1 or more numbers',
  RegExp(r'[!@#\\$%^&*(),.?":{}|<>]'): '1 or more special characters',
  RegExp(r'^.{8,10}$'): 'Password must be between 8 and 10 characters',
};

//RegExp(r'^.{8,32}$'): password must be more than 32 characters



