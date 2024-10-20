import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
   MovieDetailsModel(
      {required super.backdropPath,
        required super.genres,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage,
     });

  factory MovieDetailsModel.fromJson (Map<String,dynamic> json)=>MovieDetailsModel(
      backdropPath: json['backdrop_path'],
    genres:List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),

    id: json['id'],
  overView: json['overview'],
  releaseDate: json['release_date'],
    runTime: json['runtime'],
    title: json['title'],

    voteAverage: json['vote_average'].toDouble(),
  );
}
