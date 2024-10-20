import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/abstract/usecase.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameterse>{

  BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);

  @override



  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameterse parameters) async{
 return  await baseMoviesRepository.getRecommendation(parameters);


  }

}

class RecommendationParameterse extends Equatable{
  final int id;

const  RecommendationParameterse(this.id);


  @override
  List<Object?> get props => [id];}