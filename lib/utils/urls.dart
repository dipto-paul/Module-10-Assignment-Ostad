
class Urls {
  static String baseURL = 'https://crud-api-ostad-live.onrender.com/api/v1';
  static String readURL = '$baseURL/ReadProduct';
  static String createURL = '$baseURL/CreateProduct';

  static String deleteURL(productID) => '$baseURL/DeleteProduct/$productID';
}
