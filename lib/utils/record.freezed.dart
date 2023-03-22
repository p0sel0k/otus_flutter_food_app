// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomRecord _$CustomRecordFromJson(Map<String, dynamic> json) {
  return _CustomRecord.fromJson(json);
}

/// @nodoc
mixin _$CustomRecord {
  String get first => throw _privateConstructorUsedError;
  String get second => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomRecordCopyWith<CustomRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomRecordCopyWith<$Res> {
  factory $CustomRecordCopyWith(
          CustomRecord value, $Res Function(CustomRecord) then) =
      _$CustomRecordCopyWithImpl<$Res, CustomRecord>;
  @useResult
  $Res call({String first, String second});
}

/// @nodoc
class _$CustomRecordCopyWithImpl<$Res, $Val extends CustomRecord>
    implements $CustomRecordCopyWith<$Res> {
  _$CustomRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomRecordCopyWith<$Res>
    implements $CustomRecordCopyWith<$Res> {
  factory _$$_CustomRecordCopyWith(
          _$_CustomRecord value, $Res Function(_$_CustomRecord) then) =
      __$$_CustomRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String second});
}

/// @nodoc
class __$$_CustomRecordCopyWithImpl<$Res>
    extends _$CustomRecordCopyWithImpl<$Res, _$_CustomRecord>
    implements _$$_CustomRecordCopyWith<$Res> {
  __$$_CustomRecordCopyWithImpl(
      _$_CustomRecord _value, $Res Function(_$_CustomRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_$_CustomRecord(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomRecord with DiagnosticableTreeMixin implements _CustomRecord {
  const _$_CustomRecord({required this.first, required this.second});

  factory _$_CustomRecord.fromJson(Map<String, dynamic> json) =>
      _$$_CustomRecordFromJson(json);

  @override
  final String first;
  @override
  final String second;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomRecord(first: $first, second: $second)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomRecord'))
      ..add(DiagnosticsProperty('first', first))
      ..add(DiagnosticsProperty('second', second));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomRecord &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.second, second) || other.second == second));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, second);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomRecordCopyWith<_$_CustomRecord> get copyWith =>
      __$$_CustomRecordCopyWithImpl<_$_CustomRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomRecordToJson(
      this,
    );
  }
}

abstract class _CustomRecord implements CustomRecord {
  const factory _CustomRecord(
      {required final String first,
      required final String second}) = _$_CustomRecord;

  factory _CustomRecord.fromJson(Map<String, dynamic> json) =
      _$_CustomRecord.fromJson;

  @override
  String get first;
  @override
  String get second;
  @override
  @JsonKey(ignore: true)
  _$$_CustomRecordCopyWith<_$_CustomRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
