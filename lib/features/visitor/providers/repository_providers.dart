import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/infrastructure/repositories/visitor_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@Riverpod(dependencies: [localDataSource])
Future<VisitorRepository> visitorRepository(VisitorRepositoryRef ref) async =>
    VisitorRepository(await ref.read(localDataSourceProvider.future));
