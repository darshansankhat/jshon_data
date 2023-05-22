class UserModel {
  int? id, v;
  String? email, username, password, phone;
  Name? name;
  Address? address;

  UserModel(
      {this.id, this.v, this.email, this.username, this.password, this.phone,this.name,this.address});

  factory UserModel.fromJson(Map m1) {
    return UserModel(
        id: m1['id'],
        email: m1['email'],
        username: m1['username'],
        password: m1['password'],
        phone: m1['phone'],
        v: m1['__v'],
        name: Name.fromJson(m1['name']),
      address: Address.fromJson(m1['address']),
    );
  }
}

class Name
{
  String? firstName,lastName;

  Name({this.firstName, this.lastName});

  factory Name.fromJson(Map m1)
  {
    return Name(firstName: m1['firstname'],lastName: m1['lastname']);
  }
}

class Address
{
  int? number;
  String? city,street,zipcode;

  Address({this.number, this.city, this.street, this.zipcode});

  factory Address.fromJson(Map m1)
  {
    return Address(city: m1['city'],number: m1['number'],street: m1['street'],zipcode: m1['zipcode']);
  }
}
