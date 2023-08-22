// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkPermissionHash() => r'90086058929d0c9c76be575e2fbee5168125c3bd';

/// See also [checkPermission].
@ProviderFor(checkPermission)
final checkPermissionProvider = AutoDisposeFutureProvider<bool>.internal(
  checkPermission,
  name: r'checkPermissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckPermissionRef = AutoDisposeFutureProviderRef<bool>;
String _$permissionGuardHash() => r'd08b8ee46f9ae33d4038680423999a05265c6d13';

/// See also [permissionGuard].
@ProviderFor(permissionGuard)
final permissionGuardProvider = Provider<PermissionGuard>.internal(
  permissionGuard,
  name: r'permissionGuardProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$permissionGuardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PermissionGuardRef = ProviderRef<PermissionGuard>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
