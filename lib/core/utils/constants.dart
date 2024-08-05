

extension StringExtension on String{
  String captitalize(){
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}