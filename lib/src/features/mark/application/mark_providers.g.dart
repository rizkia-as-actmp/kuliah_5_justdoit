// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$markDetailHash() => r'761440365c092dc16b04e495c88eafec95737c79';

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

abstract class _$MarkDetail extends BuildlessAutoDisposeAsyncNotifier<Mark> {
  late final String markId;

  FutureOr<Mark> build({
    required String markId,
  });
}

/// See also [MarkDetail].
@ProviderFor(MarkDetail)
const markDetailProvider = MarkDetailFamily();

/// See also [MarkDetail].
class MarkDetailFamily extends Family<AsyncValue<Mark>> {
  /// See also [MarkDetail].
  const MarkDetailFamily();

  /// See also [MarkDetail].
  MarkDetailProvider call({
    required String markId,
  }) {
    return MarkDetailProvider(
      markId: markId,
    );
  }

  @override
  MarkDetailProvider getProviderOverride(
    covariant MarkDetailProvider provider,
  ) {
    return call(
      markId: provider.markId,
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
  String? get name => r'markDetailProvider';
}

/// See also [MarkDetail].
class MarkDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MarkDetail, Mark> {
  /// See also [MarkDetail].
  MarkDetailProvider({
    required String markId,
  }) : this._internal(
          () => MarkDetail()..markId = markId,
          from: markDetailProvider,
          name: r'markDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$markDetailHash,
          dependencies: MarkDetailFamily._dependencies,
          allTransitiveDependencies:
              MarkDetailFamily._allTransitiveDependencies,
          markId: markId,
        );

  MarkDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.markId,
  }) : super.internal();

  final String markId;

  @override
  FutureOr<Mark> runNotifierBuild(
    covariant MarkDetail notifier,
  ) {
    return notifier.build(
      markId: markId,
    );
  }

  @override
  Override overrideWith(MarkDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: MarkDetailProvider._internal(
        () => create()..markId = markId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        markId: markId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MarkDetail, Mark> createElement() {
    return _MarkDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MarkDetailProvider && other.markId == markId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, markId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MarkDetailRef on AutoDisposeAsyncNotifierProviderRef<Mark> {
  /// The parameter `markId` of this provider.
  String get markId;
}

class _MarkDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MarkDetail, Mark>
    with MarkDetailRef {
  _MarkDetailProviderElement(super.provider);

  @override
  String get markId => (origin as MarkDetailProvider).markId;
}

String _$marksHash() => r'dbaead3dbaafb080b7fa10f9a70d05d1ee2200d5';

/// See also [Marks].
@ProviderFor(Marks)
final marksProvider =
    AutoDisposeAsyncNotifierProvider<Marks, MarkList?>.internal(
  Marks.new,
  name: r'marksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$marksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Marks = AutoDisposeAsyncNotifier<MarkList?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package