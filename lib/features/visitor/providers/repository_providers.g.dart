// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$visitorRepositoryHash() => r'920db4065f4177ea5af8584d17365072d000ebfb';

/// See also [visitorRepository].
@ProviderFor(visitorRepository)
final visitorRepositoryProvider =
    AutoDisposeFutureProvider<VisitorRepository>.internal(
  visitorRepository,
  name: r'visitorRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$visitorRepositoryHash,
  dependencies: <ProviderOrFamily>[localDataSourceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    localDataSourceProvider,
    ...?localDataSourceProvider.allTransitiveDependencies
  },
);

typedef VisitorRepositoryRef = AutoDisposeFutureProviderRef<VisitorRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
