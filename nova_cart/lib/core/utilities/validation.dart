

class FormValidatorAuth{
  FormValidatorAuth._instance();

static String? emailValidation(String? email){
    

      if (email == null || email.trim().isEmpty || email=='') {
    return "Email is required";
  }


  if (email.length > 254) {
    return "Email too long";
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$',
  );

  if (!emailRegex.hasMatch(email)) {
    return "Invalid email formats";
  }

  return null;
}

// password validatoin
static String? passwordValidation(String? password){
   if (password == null || password.isEmpty) {
    return "Password is required";
  }

  if (password.length < 8) {
    return "Password must be at least 8 characters";
  }

  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return "Add at least 1 uppercase letter";
  }

  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return "Add at least 1 lowercase letter";
  }

  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return "Add at least 1 number";
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    return "Add at least 1 special character";
  }

  return null;

}

static String? userName(String? userName){
  if (userName == null || userName.trim().isEmpty) {
    return "Full name is required";
  }
  
  // Check for invalid characters (numbers, special chars)
  final nameRegExp = RegExp(r"^[a-zA-Z\s]+$");
  if (!nameRegExp.hasMatch(userName)) {
    return "Only letters and spaces are allowed";
  }

  if (userName.trim().length < 2) {
    return "Full name must be at least 2 characters";
  }

  return null; // valid
}
}


