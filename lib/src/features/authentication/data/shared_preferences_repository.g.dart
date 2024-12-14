// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesRepositoryHash() =>
    r'cc87ce17288f19755f619c7d489e0f3eb93bca51';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SharedPreferencesRepository
    extends BuildlessAutoDisposeNotifier<void> {
  late final String key;

  void build(
    String key,
  );
}

/// See also [SharedPreferencesRepository].
@ProviderFor(SharedPreferencesRepository)
const sharedPreferencesRepositoryProvider = SharedPreferencesRepositoryFamily();

/// See also [SharedPreferencesRepository].
class SharedPreferencesRepositoryFamily extends Family<void> {
  /// See also [SharedPreferencesRepository].
  const SharedPreferencesRepositoryFamily();

  /// See also [SharedPreferencesRepository].
  SharedPreferencesRepositoryProvider call(
    String key,
  ) {
    return SharedPreferencesRepositoryProvider(
      key,
    );
  }

  @override
  SharedPreferencesRepositoryProvider getProviderOverride(
    covariant SharedPreferencesRepositoryProvider provider,
  ) {
    return call(
      provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sharedPreferencesRepositoryProvider';
}

/// See also [SharedPreferencesRepository].
class SharedPreferencesRepositoryProvider
    extends AutoDisposeNotifierProviderImpl<SharedPreferencesRepository, void> {
  /// See also [SharedPreferencesRepository].
  SharedPreferencesRepositoryProvider(
    String key,
  ) : this._internal(
          () => SharedPreferencesRepository()..key = key,
          from: sharedPreferencesRepositoryProvider,
          name: r'sharedPreferencesRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sharedPreferencesRepositoryHash,
          dependencies: SharedPreferencesRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SharedPreferencesRepositoryFamily._allTransitiveDependencies,
          key: key,
        );

  SharedPreferencesRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  void runNotifierBuild(
    covariant SharedPreferencesRepository notifier,
  ) {
    return notifier.build(
      key,
    );
  }

  @override
  Override overrideWith(SharedPreferencesRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: SharedPreferencesRepositoryProvider._internal(
        () => create()..key = key,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SharedPreferencesRepository, void>
      createElement() {
    return _SharedPreferencesRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SharedPreferencesRepositoryProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SharedPreferencesRepositoryRef on AutoDisposeNotifierProviderRef<void> {
  /// The parameter `key` of this provider.
  String get key;
}

class _SharedPreferencesRepositoryProviderElement
    extends AutoDisposeNotifierProviderElement<SharedPreferencesRepository,
        void> with SharedPreferencesRepositoryRef {
  _SharedPreferencesRepositoryProviderElement(super.provider);

  @override
  String get key => (origin as SharedPreferencesRepositoryProvider).key;
}

String _$otpIdSharedPrefRepositoryHash() =>
    r'988dfc6d2dc45e1eeee86d63fcb18806a7f86a78';

/// See also [OtpIdSharedPrefRepository].
@ProviderFor(OtpIdSharedPrefRepository)
final otpIdSharedPrefRepositoryProvider =
    AutoDisposeNotifierProvider<OtpIdSharedPrefRepository, void>.internal(
  OtpIdSharedPrefRepository.new,
  name: r'otpIdSharedPrefRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$otpIdSharedPrefRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OtpIdSharedPrefRepository = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
