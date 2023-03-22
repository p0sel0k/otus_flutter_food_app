// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeControllerHash() => r'd7365adbc88d64721f5eb8d044b3a2d9524dfea6';

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

abstract class _$RecipeController
    extends BuildlessAutoDisposeAsyncNotifier<RecipeState> {
  late final int index;

  FutureOr<RecipeState> build(
    int index,
  );
}

/// See also [RecipeController].
@ProviderFor(RecipeController)
const recipeControllerProvider = RecipeControllerFamily();

/// See also [RecipeController].
class RecipeControllerFamily extends Family<AsyncValue<RecipeState>> {
  /// See also [RecipeController].
  const RecipeControllerFamily();

  /// See also [RecipeController].
  RecipeControllerProvider call(
    int index,
  ) {
    return RecipeControllerProvider(
      index,
    );
  }

  @override
  RecipeControllerProvider getProviderOverride(
    covariant RecipeControllerProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'recipeControllerProvider';
}

/// See also [RecipeController].
class RecipeControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RecipeController, RecipeState> {
  /// See also [RecipeController].
  RecipeControllerProvider(
    this.index,
  ) : super.internal(
          () => RecipeController()..index = index,
          from: recipeControllerProvider,
          name: r'recipeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeControllerHash,
          dependencies: RecipeControllerFamily._dependencies,
          allTransitiveDependencies:
              RecipeControllerFamily._allTransitiveDependencies,
        );

  final int index;

  @override
  bool operator ==(Object other) {
    return other is RecipeControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<RecipeState> runNotifierBuild(
    covariant RecipeController notifier,
  ) {
    return notifier.build(
      index,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
