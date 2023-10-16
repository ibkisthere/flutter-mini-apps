final Map<RegExp, String> validators = {
  RegExp(r'[a-z]'): '1 or more lowercase letter',
  RegExp(r'[A-Z]'): '1 or more uppercase letters',
  RegExp(r'[0-9]'): '1 or more numbers',
  RegExp(r'[!@#\\$%^&*(),.?":{}|<>]'): '1 or more special characters',
  RegExp(r'^.{8,10}$'): 'Password must be between 8 and 10 characters',
};



