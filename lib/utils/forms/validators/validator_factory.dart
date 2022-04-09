String? isValidEmail(String email)
{
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)
    ? null
    : 'Le format de l\'adresse email est incorrect.';
}

String? isValidPassword(String password)
{
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)
      ? null
      : 'Le format du mot de passe est incorrect (8 charactères minimum, une minusucle, une majuscule et un caractère spécial.';
}

String? isEmpty(String textInput)
{
  return (textInput.isEmpty) ? 'Le champ ne peut pas être vide.' : null;
}

String? isValidBirthDate(String date)
{
  return RegExp(r'^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$').hasMatch(date)
      ? null
      : 'Le format de date doit être YYYY-MM-DD (exemple : 1996-03-29)';;
}