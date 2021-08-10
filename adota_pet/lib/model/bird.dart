
class Bird {

  String? name;
  String? breed;
  String? gender;
  int? age;
  String? ageDescription;
  double? weight;
  String? image;

  Bird({this.name, this.breed, this.gender, this.age, this.ageDescription, this.weight, this.image});

  @override
  String toString() {
    return 'Bird{name: $name, breed: $breed, gender: $gender, age: $age, ageDescription: $ageDescription, weight: $weight, image: $image}';
  }

}