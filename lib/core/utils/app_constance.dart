class  ApiConstance {
  static const  String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "49f8b2f8165492d400f179a3f75d6ec3";
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getPopularMovies = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedMovies = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String getMoviesDetails (int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String getRecommendationPath (int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static  String imageUrl (String path)=>"$baseImageUrl$path";


}