import 'package:dio/dio.dart';
import 'package:moviesflutterbloc/model/genre_response.dart';
import 'package:moviesflutterbloc/model/movie_response.dart';
import 'package:moviesflutterbloc/model/person_response.dart';

class MovieRepository{
  final String apiKey = "<<themoviedb.org - ApiKeyHere>>";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genres/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';


  Future<MovieResponse> getMovies() async{
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async{
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async{
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async{
    var params = {
      "api_key": apiKey,
    };
    try{
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id) async{
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id,

    };
    try{
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}