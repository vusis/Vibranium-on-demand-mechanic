class Company{

  static List<Company> companyList =[];
  //static List<String> quoteList2 = ['He who knows knows','I came i saw', 'All is well', 'If at first you fail,try again'];
  final String companyName ;
  final String companyAddress ;
  final String companyTel;
  final String companyEmail ;
  final String password;

  // final int id;



  /// Getters
  String get getCompanyName => companyName;
  String get getCompanyAddress => companyAddress;
  String get getCompanyTel => companyTel;
  String get getCompanyEmail => companyEmail;
  String get getPassword => password;


  List<Company>get quotyList => companyList;

  ///Constructor
  Company({required this.companyName,required this.companyAddress,required this.companyTel,required this.companyEmail,required this.password});


  //this recieves data from server and they pass it to app data structures
  factory Company.fromJson(json){
    return Company(
      companyName: json['companyName'].toString(),
      companyAddress: json['companyAddress'].toString(),
      companyTel: json['companyTel'].toString(),
      companyEmail: json['companyEmail'].toString(),
      password: json['password'].toString(),


    );
  }

  //Create and add new quote to list
  /// Use this method to create a new quote.
  /// Warning the ID will be null!
  /// @param author the author of the quote
  /// @param message the quote itself

  static Company addCompany(String companyName,String companyAddress,String companyTel,String companyEmail,String password){
    Company newCompany = Company(companyName: companyName, companyAddress: companyAddress, companyTel: companyTel, companyEmail: companyEmail, password: password);
    //quoteList2.add(newQuote.message);

    companyList.add(newCompany);


    return newCompany;

  }

  /// Use this method to delete a quote.
  /// @param id the id of the quote to be deleted
  static void deleteQuote(int id){

  }
}