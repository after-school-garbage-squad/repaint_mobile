import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/infrastructure/repositories/visitor_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@Riverpod(dependencies: [localDataSource])
Future<VisitorRepository> visitorRepository(VisitorRepositoryRef ref) async {
  final localDataSource = await ref.watch(localDataSourceProvider.future);
  final apiClient = ref.watch(apiClientProvider);
  return VisitorRepository(localDataSource, apiClient);
}
