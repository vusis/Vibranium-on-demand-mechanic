class User{

  static List<User> userList =[];
  //static List<String> quoteList2 = ['He who knows knows','I came i saw', 'All is well', 'If at first you fail,try again'];
  final String name ;
  final String surname;
  final String address ;
  final String contact;
  final String email ;
  final String password;

  // final int id;



  /// Getters
  String get getName => name;
  String get getSurname => surname;
  String get getAddress => address;
  String get getContact => contact;
  String get getEmail => email;
  String get getPassword => password;


  List<User>get quotyList => userList;

  ///Constructor
  User({required this.name,required this.surname,required this.address,required this.contact,required this.email,required this.password});


  //this recieves data from server and they pass it to app data structures
  factory User.fromJson(json){
    return User(
      name: json['name'].toString(),
      surname: json['surname'].toString(),
      address: json['address'].toString(),
      contact: json['contact'].toString(),
      email: json['email'].toString(),
      password: json['password'].toString(),

      // id: json['id'],/////

    );
  }

  //Create and add new quote to list
  /// Use this method to create a new quote.
  /// Warning the ID will be null!
  /// @param author the author of the quote
  /// @param message the quote itself

  static User addUser(String name,String surname, String address, String contact, String email, String password){
    User newUser = User(name: name,surname: surname, address: address, contact: contact, email: email, password: password);
    //quoteList2.add(newQuote.message);

    userList.add(newUser);


    return newUser;

  }

  /// Use this method to delete a quote.
  /// @param id the id of the quote to be deleted
  static void deleteQuote(int id){

  }
}