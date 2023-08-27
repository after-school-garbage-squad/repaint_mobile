// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'571403d53d70c0b7f0268cffc297d9a623ec5d8f';

/// See also [User].
@ProviderFor(User)
final userProvider = AsyncNotifierProvider<User, UserEntity>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: <ProviderOrFamily>[localDataSourceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    localDataSourceProvider,
    ...?localDataSourceProvider.allTransitiveDependencies
  },
);

typedef _$User = AsyncNotifier<UserEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
