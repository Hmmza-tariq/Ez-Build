import 'package:flutter/material.dart';

class StringsManager with ChangeNotifier {
  bool _isUrdu = false;
  static const String _appName = "Ez-Build";
  static String _error = "Error";
  static String _phoneNumber = "Phone Number";
  static String _location = "Location";
  static String _profileName = "Hexagone";
  static String _home = "Home";
  static String _chat = "Chat";
  static String _add = "Add";
  static String _favorites = "Favorites";
  static String _notifications = "Notifications";
  static String _settings = "Settings";
  static String _search = "Search";
  static String _addItem = 'Add Item View';
  static String _noItemInFavourite = 'No Products in Favorite Yet!';
  static String _quantity = 'Quantity';
  static String _price = 'Price';
  static String _category = 'Category';
  static String _description = 'Description';
  static String _readMore = 'read more';
  static String _showLess = 'show less';
  static String _contactSeller = 'Contact Seller';
  static String _account = 'Account';
  static String _darkMode = 'Dark Mode';
  static String _language = 'Language';
  static String _help = 'Help';
  static String _logout = 'Logout';
  static String _noData = 'No Data';
  static const String _english = 'English';
  static const String _urdu = 'اردو';
  static String _myLocation = "My Location ";
  static String _searchLocation = "Search your location";
  static String _chooseLocation = "Choose Location";

  StringsManager(bool isUrdu, {String? location}) {
    setLanguage(isUrdu);
    if (location != null) {
      setLocation(location);
    }
  }
  void setLanguage(bool isUrdu) {
    _isUrdu = isUrdu;
    setValues(isUrdu);
    notifyListeners();
  }

  toggleLanguage() {
    _isUrdu = !_isUrdu;
    setValues(_isUrdu);
    notifyListeners();
  }

  void setLocation(String value) {
    _location = value;
    notifyListeners();
  }

  void setValues(bool isUrdu) {
    // _appName = isUrdu ? "ایز-بلڈ" : "Ez-Build";
    _error = isUrdu ? "خطا" : "Error";
    _phoneNumber = isUrdu ? "فون نمبر" : "Phone Number";
    _location = isUrdu ? "مقام" : "Location";
    _profileName = isUrdu ? "ہیکساگون" : "Hexagone";
    _home = isUrdu ? "ہوم" : "Home";
    _chat = isUrdu ? "چیٹ" : "Chat";
    _add = isUrdu ? "شامل کریں" : "Add";
    _favorites = isUrdu ? "پسندیدہ" : "Favorites";
    _notifications = isUrdu ? "اطلاعات" : "Notifications";
    _settings = isUrdu ? "ترتیبات" : "Settings";
    _search = isUrdu ? "تلاش" : "Search";
    _addItem = isUrdu ? 'آئٹم شامل کریں دیکھیں' : 'Add Item View';
    _noItemInFavourite = isUrdu
        ? 'ابھی تک پسندیدہ میں کوئی مصنوعات نہیں ہیں!'
        : 'No Products in Favorite Yet!';
    _quantity = isUrdu ? 'مقدار' : 'Quantity';
    _price = isUrdu ? 'قیمت' : 'Price';
    _category = isUrdu ? 'قسم' : 'Category';
    _description = isUrdu ? 'تفصیل' : 'Description';
    _readMore = isUrdu ? 'مزید پڑھیں' : 'read more';
    _showLess = isUrdu ? 'کم دکھائیں' : 'show less';
    _contactSeller = isUrdu ? 'فروخت کنندہ سے رابطہ کریں' : 'Contact Seller';
    _account = isUrdu ? 'اکاؤنٹ' : 'Account';
    _darkMode = isUrdu ? 'ڈارک موڈ' : 'Dark Mode';
    _language = isUrdu ? 'زبان' : 'Language';
    _help = isUrdu ? 'مدد' : 'Help';
    _logout = isUrdu ? 'لاگ آؤٹ' : 'Logout';
    _noData = isUrdu ? 'کوئی ڈیٹا نہیں' : 'No Data';
    _myLocation = isUrdu ? "میری جگہ " : "My Location ";
    _searchLocation = isUrdu ? "اپنی جگہ تلاش کریں" : "Search your location";
    _chooseLocation = isUrdu ? "جگہ منتخب کریں" : "Choose Location";
  }

  bool get isUrdu => _isUrdu;
  String get currentLanguage => isUrdu ? _urdu : _english;
  String get appName => _appName;
  String get error => _error;
  String get phoneNumber => _phoneNumber;
  String get location => _location;
  String get profileName => _profileName;
  String get home => _home;
  String get chat => _chat;
  String get add => _add;
  String get favorites => _favorites;
  String get notifications => _notifications;
  String get settings => _settings;
  String get search => _search;
  String get addItem => _addItem;
  String get noItemInFavourite => _noItemInFavourite;
  String get quantity => _quantity;
  String get price => _price;
  String get category => _category;
  String get description => _description;
  String get readMore => _readMore;
  String get showLess => _showLess;
  String get contactSeller => _contactSeller;
  String get account => _account;
  String get darkMode => _darkMode;
  String get language => _language;
  String get help => _help;
  String get logout => _logout;
  String get noData => _noData;
  String get english => _english;
  String get urdu => _urdu;
  String get myLocation => _myLocation;
  String get searchLocation => _searchLocation;
  String get chooseLocation => _chooseLocation;
}
