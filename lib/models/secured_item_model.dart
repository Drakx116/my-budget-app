class SecuredItem
{
  late String key;
  late String? value;

  SecuredItem({ required this.key, required this.value });

  void set(String key, String value) {
    this.key = key;
    this.value = value;
  }
}