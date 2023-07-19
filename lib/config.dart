const APIKEY = '05f81e362f1b427a879e7789bca68bbc';
const newsUrl =
    'https://newsapi.org/v2/top-headlines?country=us&apiKey=${APIKEY}';

String searchUrl(String query) {
  DateTime date = DateTime.now();
  String formattedDate = date.toString().substring(0, 10);
  print(formattedDate);
  return 'https://newsapi.org/v2/everything?q=$query&from={$formattedDate}&sortBy=popularity&apiKey=${APIKEY}';
}
