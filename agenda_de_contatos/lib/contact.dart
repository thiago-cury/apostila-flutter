class Contact {

  String? name;
  String? email;
  String? phone;
  String? picture;
  bool? favorite;

  Contact(this.name, this.email, this.phone, this.picture, this.favorite);

  @override
  String toString() {
    return 'Contact{name: $name, email: $email, phone: $phone, picture: $picture favorite: $favorite}';
  }
}