class Result<Success, Failure> {
  const Result();

  const factory Result.success(Success data) = ResultSuccess<Success, Failure>;
  const factory Result.failure(Failure data) = ResultFailure<Success, Failure>;
}

class ResultSuccess<Success, Failure> extends Result<Success, Failure> {
  final Success data;
  const ResultSuccess(this.data);
}

class ResultFailure<Success, Failure> extends Result<Success, Failure> {
  final Failure failure;
  const ResultFailure(this.failure);
}
