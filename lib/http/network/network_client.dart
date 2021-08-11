abstract class NetworkClient {
  Future get<Q>({required String path, Q? args});
  Future post<D>({required String path, D? args});
  Future put<D>({required String path, D? args});
  Future delete<D>({required String path});
}
