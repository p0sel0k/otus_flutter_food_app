// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsControllerHash() =>
    r'70b8b0704c35d41961d2e655cbe77f93157c3324';

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

abstract class _$CommentsController
    extends BuildlessAutoDisposeNotifier<List<CommentState>> {
  late final int recipeId;

  List<CommentState> build(
    int recipeId,
  );
}

/// See also [CommentsController].
@ProviderFor(CommentsController)
const commentsControllerProvider = CommentsControllerFamily();

/// See also [CommentsController].
class CommentsControllerFamily extends Family<List<CommentState>> {
  /// See also [CommentsController].
  const CommentsControllerFamily();

  /// See also [CommentsController].
  CommentsControllerProvider call(
    int recipeId,
  ) {
    return CommentsControllerProvider(
      recipeId,
    );
  }

  @override
  CommentsControllerProvider getProviderOverride(
    covariant CommentsControllerProvider provider,
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
  String? get name => r'commentsControllerProvider';
}

/// See also [CommentsController].
class CommentsControllerProvider extends AutoDisposeNotifierProviderImpl<
    CommentsController, List<CommentState>> {
  /// See also [CommentsController].
  CommentsControllerProvider(
    this.recipeId,
  ) : super.internal(
          () => CommentsController()..recipeId = recipeId,
          from: commentsControllerProvider,
          name: r'commentsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsControllerHash,
          dependencies: CommentsControllerFamily._dependencies,
          allTransitiveDependencies:
              CommentsControllerFamily._allTransitiveDependencies,
        );

  final int recipeId;

  @override
  bool operator ==(Object other) {
    return other is CommentsControllerProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<CommentState> runNotifierBuild(
    covariant CommentsController notifier,
  ) {
    return notifier.build(
      recipeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
