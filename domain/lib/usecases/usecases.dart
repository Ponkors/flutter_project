abstract class UseCase<OutputT, InputT> {
  OutputT execute(InputT input);
}

abstract class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT input);
}

abstract class StreamUseCase<OutputT, InputT> {
  Stream<OutputT> execute(InputT input);
}

class NoParams {
  const NoParams();
}
