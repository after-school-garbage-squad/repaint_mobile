// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'e71d200fcd36675494425782925f03cd523f1758';

/// See also [appRouter].
@ProviderFor(appRouter)
final appRouterProvider = FutureProvider<AppRouter>.internal(
  appRouter,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: <ProviderOrFamily>[userProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userProvider,
    ...?userProvider.allTransitiveDependencies
  },
);

typedef AppRouterRef = FutureProviderRef<AppRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
