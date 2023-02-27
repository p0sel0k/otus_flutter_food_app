// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$RecipeControllerHash() => r'0cc1df6e65684b4ebebcd4a44f5d71e8b5ea0cea';

/// See also [RecipeController].
class RecipeControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RecipeController, RecipeState> {
  RecipeControllerProvider(
    this.index,
  ) : super(
          () => RecipeController()..index = index,
          from: recipeControllerProvider,
          name: r'recipeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$RecipeControllerHash,
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
    covariant _$RecipeController notifier,
  ) {
    return notifier.build(
      index,
    );
  }
}

typedef RecipeControllerRef = AutoDisposeAsyncNotifierProviderRef<RecipeState>;

/// See also [RecipeController].
final recipeControllerProvider = RecipeControllerFamily();

class RecipeControllerFamily extends Family<AsyncValue<RecipeState>> {
  RecipeControllerFamily();

  RecipeControllerProvider call(
    int index,
  ) {
    return RecipeControllerProvider(
      index,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<RecipeController, RecipeState>
      getProviderOverride(
    covariant RecipeControllerProvider provider,
  ) {
    return call(
      provider.index,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'recipeControllerProvider';
}

abstract class _$RecipeController
    extends BuildlessAutoDisposeAsyncNotifier<RecipeState> {
  late final int index;

  FutureOr<RecipeState> build(
    int index,
  );
}
