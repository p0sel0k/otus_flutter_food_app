// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsServiceHash() => r'cb2a3e610f3697911dd64a7fc837888d359b006c';

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

typedef CommentsServiceRef = AutoDisposeFutureProviderRef<CommentsService>;

/// See also [commentsService].
@ProviderFor(commentsService)
const commentsServiceProvider = CommentsServiceFamily();

/// See also [commentsService].
class CommentsServiceFamily extends Family<AsyncValue<CommentsService>> {
  /// See also [commentsService].
  const CommentsServiceFamily();

  /// See also [commentsService].
  CommentsServiceProvider call(
    int recipeId,
  ) {
    return CommentsServiceProvider(
      recipeId,
    );
  }

  @override
  CommentsServiceProvider getProviderOverride(
    covariant CommentsServiceProvider provider,
  ) {
    return call(
      provider.recipeId,
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
  String? get name => r'commentsServiceProvider';
}

/// See also [commentsService].
class CommentsServiceProvider
    extends AutoDisposeFutureProvider<CommentsService> {
  /// See also [commentsService].
  CommentsServiceProvider(
    this.recipeId,
  ) : super.internal(
          (ref) => commentsService(
            ref,
            recipeId,
          ),
          from: commentsServiceProvider,
          name: r'commentsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsServiceHash,
          dependencies: CommentsServiceFamily._dependencies,
          allTransitiveDependencies:
              CommentsServiceFamily._allTransitiveDependencies,
        );

  final int recipeId;

  @override
  bool operator ==(Object other) {
    return other is CommentsServiceProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
