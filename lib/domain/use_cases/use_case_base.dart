abstract class NormalUseCase<In, Out> {
  Out call(In param);
}

abstract class NoParamUseCase<Out> {
  Out call();
}

abstract class FutureNormalUseCase<In, Out> {
  Future<Out> call(In param);
}

abstract class FutureNoParamUseCase<In, Out> {
  Future<Out> call();
}
