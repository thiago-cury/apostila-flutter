
class Dog {

  String? name;
  String? breed;
  String? gender;
  int? age;
  String? ageDescription;
  int? weight;
  String? image;

  Dog({this.name, this.breed, this.gender, this.age, this.ageDescription, this.weight, this.image});

  @override
  String toString() {
    return 'Dog{name: $name, breed: $breed, gender: $gender, age: $age, ageDescription: $ageDescription, weight: $weight, image: $image}';
  }

}