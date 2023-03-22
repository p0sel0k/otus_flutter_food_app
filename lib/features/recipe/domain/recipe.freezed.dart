// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) {
  return _RecipeInfo.fromJson(json);
}

/// @nodoc
mixin _$RecipeInfo {
  String get title => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get imgPath => throw _privateConstructorUsedError;
  String get base64Img => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeInfoCopyWith<RecipeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeInfoCopyWith<$Res> {
  factory $RecipeInfoCopyWith(
          RecipeInfo value, $Res Function(RecipeInfo) then) =
      _$RecipeInfoCopyWithImpl<$Res, RecipeInfo>;
  @useResult
  $Res call({String title, String time, String imgPath, String base64Img});
}

/// @nodoc
class _$RecipeInfoCopyWithImpl<$Res, $Val extends RecipeInfo>
    implements $RecipeInfoCopyWith<$Res> {
  _$RecipeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? time = null,
    Object? imgPath = null,
    Object? base64Img = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      base64Img: null == base64Img
          ? _value.base64Img
          : base64Img // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeInfoCopyWith<$Res>
    implements $RecipeInfoCopyWith<$Res> {
  factory _$$_RecipeInfoCopyWith(
          _$_RecipeInfo value, $Res Function(_$_RecipeInfo) then) =
      __$$_RecipeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String time, String imgPath, String base64Img});
}

/// @nodoc
class __$$_RecipeInfoCopyWithImpl<$Res>
    extends _$RecipeInfoCopyWithImpl<$Res, _$_RecipeInfo>
    implements _$$_RecipeInfoCopyWith<$Res> {
  __$$_RecipeInfoCopyWithImpl(
      _$_RecipeInfo _value, $Res Function(_$_RecipeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? time = null,
    Object? imgPath = null,
    Object? base64Img = null,
  }) {
    return _then(_$_RecipeInfo(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      base64Img: null == base64Img
          ? _value.base64Img
          : base64Img // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeInfo with DiagnosticableTreeMixin implements _RecipeInfo {
  const _$_RecipeInfo(
      {required this.title,
      required this.time,
      this.imgPath = '',
      this.base64Img = baseImg});

  factory _$_RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeInfoFromJson(json);

  @override
  final String title;
  @override
  final String time;
  @override
  @JsonKey()
  final String imgPath;
  @override
  @JsonKey()
  final String base64Img;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecipeInfo(title: $title, time: $time, imgPath: $imgPath, base64Img: $base64Img)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecipeInfo'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('imgPath', imgPath))
      ..add(DiagnosticsProperty('base64Img', base64Img));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeInfo &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.base64Img, base64Img) ||
                other.base64Img == base64Img));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, time, imgPath, base64Img);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeInfoCopyWith<_$_RecipeInfo> get copyWith =>
      __$$_RecipeInfoCopyWithImpl<_$_RecipeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeInfoToJson(
      this,
    );
  }
}

abstract class _RecipeInfo implements RecipeInfo {
  const factory _RecipeInfo(
      {required final String title,
      required final String time,
      final String imgPath,
      final String base64Img}) = _$_RecipeInfo;

  factory _RecipeInfo.fromJson(Map<String, dynamic> json) =
      _$_RecipeInfo.fromJson;

  @override
  String get title;
  @override
  String get time;
  @override
  String get imgPath;
  @override
  String get base64Img;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeInfoCopyWith<_$_RecipeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeDetails _$RecipeDetailsFromJson(Map<String, dynamic> json) {
  return _RecipeDetails.fromJson(json);
}

/// @nodoc
mixin _$RecipeDetails {
  @JsonKey(name: 'steps')
  List<CustomRecord> get stepsWithDescriprion =>
      throw _privateConstructorUsedError;
  List<CustomRecord> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeDetailsCopyWith<RecipeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDetailsCopyWith<$Res> {
  factory $RecipeDetailsCopyWith(
          RecipeDetails value, $Res Function(RecipeDetails) then) =
      _$RecipeDetailsCopyWithImpl<$Res, RecipeDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'steps') List<CustomRecord> stepsWithDescriprion,
      List<CustomRecord> ingredients});
}

/// @nodoc
class _$RecipeDetailsCopyWithImpl<$Res, $Val extends RecipeDetails>
    implements $RecipeDetailsCopyWith<$Res> {
  _$RecipeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepsWithDescriprion = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      stepsWithDescriprion: null == stepsWithDescriprion
          ? _value.stepsWithDescriprion
          : stepsWithDescriprion // ignore: cast_nullable_to_non_nullable
              as List<CustomRecord>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<CustomRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeDetailsCopyWith<$Res>
    implements $RecipeDetailsCopyWith<$Res> {
  factory _$$_RecipeDetailsCopyWith(
          _$_RecipeDetails value, $Res Function(_$_RecipeDetails) then) =
      __$$_RecipeDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'steps') List<CustomRecord> stepsWithDescriprion,
      List<CustomRecord> ingredients});
}

/// @nodoc
class __$$_RecipeDetailsCopyWithImpl<$Res>
    extends _$RecipeDetailsCopyWithImpl<$Res, _$_RecipeDetails>
    implements _$$_RecipeDetailsCopyWith<$Res> {
  __$$_RecipeDetailsCopyWithImpl(
      _$_RecipeDetails _value, $Res Function(_$_RecipeDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepsWithDescriprion = null,
    Object? ingredients = null,
  }) {
    return _then(_$_RecipeDetails(
      stepsWithDescriprion: null == stepsWithDescriprion
          ? _value._stepsWithDescriprion
          : stepsWithDescriprion // ignore: cast_nullable_to_non_nullable
              as List<CustomRecord>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<CustomRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeDetails with DiagnosticableTreeMixin implements _RecipeDetails {
  const _$_RecipeDetails(
      {@JsonKey(name: 'steps')
          final List<CustomRecord> stepsWithDescriprion = const [],
      final List<CustomRecord> ingredients = const []})
      : _stepsWithDescriprion = stepsWithDescriprion,
        _ingredients = ingredients;

  factory _$_RecipeDetails.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeDetailsFromJson(json);

  final List<CustomRecord> _stepsWithDescriprion;
  @override
  @JsonKey(name: 'steps')
  List<CustomRecord> get stepsWithDescriprion {
    if (_stepsWithDescriprion is EqualUnmodifiableListView)
      return _stepsWithDescriprion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepsWithDescriprion);
  }

  final List<CustomRecord> _ingredients;
  @override
  @JsonKey()
  List<CustomRecord> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecipeDetails(stepsWithDescriprion: $stepsWithDescriprion, ingredients: $ingredients)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecipeDetails'))
      ..add(DiagnosticsProperty('stepsWithDescriprion', stepsWithDescriprion))
      ..add(DiagnosticsProperty('ingredients', ingredients));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeDetails &&
            const DeepCollectionEquality()
                .equals(other._stepsWithDescriprion, _stepsWithDescriprion) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stepsWithDescriprion),
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeDetailsCopyWith<_$_RecipeDetails> get copyWith =>
      __$$_RecipeDetailsCopyWithImpl<_$_RecipeDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeDetailsToJson(
      this,
    );
  }
}

abstract class _RecipeDetails implements RecipeDetails {
  const factory _RecipeDetails(
      {@JsonKey(name: 'steps') final List<CustomRecord> stepsWithDescriprion,
      final List<CustomRecord> ingredients}) = _$_RecipeDetails;

  factory _RecipeDetails.fromJson(Map<String, dynamic> json) =
      _$_RecipeDetails.fromJson;

  @override
  @JsonKey(name: 'steps')
  List<CustomRecord> get stepsWithDescriprion;
  @override
  List<CustomRecord> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeDetailsCopyWith<_$_RecipeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  RecipeInfo get info => throw _privateConstructorUsedError;
  RecipeDetails get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({RecipeInfo info, RecipeDetails details});

  $RecipeInfoCopyWith<$Res> get info;
  $RecipeDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as RecipeInfo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as RecipeDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeInfoCopyWith<$Res> get info {
    return $RecipeInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeDetailsCopyWith<$Res> get details {
    return $RecipeDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecipeInfo info, RecipeDetails details});

  @override
  $RecipeInfoCopyWith<$Res> get info;
  @override
  $RecipeDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? details = null,
  }) {
    return _then(_$_Recipe(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as RecipeInfo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as RecipeDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe with DiagnosticableTreeMixin implements _Recipe {
  const _$_Recipe({required this.info, required this.details});

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final RecipeInfo info;
  @override
  final RecipeDetails details;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Recipe(info: $info, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Recipe'))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, info, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final RecipeInfo info,
      required final RecipeDetails details}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  RecipeInfo get info;
  @override
  RecipeDetails get details;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
