import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class CustomRecord with _$CustomRecord {
  const factory CustomRecord({
    required String first,
    required String second,
  }) = _CustomRecord;

  factory CustomRecord.fromJson(Map<String, Object?> json) =>
      _$CustomRecordFromJson(json);
}
