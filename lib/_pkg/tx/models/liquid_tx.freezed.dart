// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquid_tx.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiquidTx _$LiquidTxFromJson(Map<String, dynamic> json) {
  return _LiquidTx.fromJson(json);
}

/// @nodoc
mixin _$LiquidTx {
  String get id => throw _privateConstructorUsedError;
  TxType get type => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get fee => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  int get vsize => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get locktime => throw _privateConstructorUsedError;
  List<LiquidTxIn> get inputs => throw _privateConstructorUsedError;
  List<LiquidTxOut> get outputs => throw _privateConstructorUsedError;
  String get toAddress => throw _privateConstructorUsedError;
  String? get walletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidTxCopyWith<LiquidTx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidTxCopyWith<$Res> {
  factory $LiquidTxCopyWith(LiquidTx value, $Res Function(LiquidTx) then) =
      _$LiquidTxCopyWithImpl<$Res, LiquidTx>;
  @useResult
  $Res call(
      {String id,
      TxType type,
      int timestamp,
      int amount,
      int fee,
      int height,
      String label,
      int version,
      int vsize,
      int size,
      int weight,
      int locktime,
      List<LiquidTxIn> inputs,
      List<LiquidTxOut> outputs,
      String toAddress,
      String? walletId});
}

/// @nodoc
class _$LiquidTxCopyWithImpl<$Res, $Val extends LiquidTx>
    implements $LiquidTxCopyWith<$Res> {
  _$LiquidTxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? timestamp = null,
    Object? amount = null,
    Object? fee = null,
    Object? height = null,
    Object? label = null,
    Object? version = null,
    Object? vsize = null,
    Object? size = null,
    Object? weight = null,
    Object? locktime = null,
    Object? inputs = null,
    Object? outputs = null,
    Object? toAddress = null,
    Object? walletId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      vsize: null == vsize
          ? _value.vsize
          : vsize // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      inputs: null == inputs
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<LiquidTxIn>,
      outputs: null == outputs
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<LiquidTxOut>,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidTxImplCopyWith<$Res>
    implements $LiquidTxCopyWith<$Res> {
  factory _$$LiquidTxImplCopyWith(
          _$LiquidTxImpl value, $Res Function(_$LiquidTxImpl) then) =
      __$$LiquidTxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TxType type,
      int timestamp,
      int amount,
      int fee,
      int height,
      String label,
      int version,
      int vsize,
      int size,
      int weight,
      int locktime,
      List<LiquidTxIn> inputs,
      List<LiquidTxOut> outputs,
      String toAddress,
      String? walletId});
}

/// @nodoc
class __$$LiquidTxImplCopyWithImpl<$Res>
    extends _$LiquidTxCopyWithImpl<$Res, _$LiquidTxImpl>
    implements _$$LiquidTxImplCopyWith<$Res> {
  __$$LiquidTxImplCopyWithImpl(
      _$LiquidTxImpl _value, $Res Function(_$LiquidTxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? timestamp = null,
    Object? amount = null,
    Object? fee = null,
    Object? height = null,
    Object? label = null,
    Object? version = null,
    Object? vsize = null,
    Object? size = null,
    Object? weight = null,
    Object? locktime = null,
    Object? inputs = null,
    Object? outputs = null,
    Object? toAddress = null,
    Object? walletId = freezed,
  }) {
    return _then(_$LiquidTxImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      vsize: null == vsize
          ? _value.vsize
          : vsize // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<LiquidTxIn>,
      outputs: null == outputs
          ? _value._outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<LiquidTxOut>,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidTxImpl extends _LiquidTx {
  _$LiquidTxImpl(
      {required this.id,
      required this.type,
      required this.timestamp,
      required this.amount,
      required this.fee,
      required this.height,
      required this.label,
      required this.version,
      required this.vsize,
      required this.size,
      required this.weight,
      required this.locktime,
      required final List<LiquidTxIn> inputs,
      required final List<LiquidTxOut> outputs,
      required this.toAddress,
      required this.walletId})
      : _inputs = inputs,
        _outputs = outputs,
        super._();

  factory _$LiquidTxImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidTxImplFromJson(json);

  @override
  final String id;
  @override
  final TxType type;
  @override
  final int timestamp;
  @override
  final int amount;
  @override
  final int fee;
  @override
  final int height;
  @override
  final String label;
  @override
  final int version;
  @override
  final int vsize;
  @override
  final int size;
  @override
  final int weight;
  @override
  final int locktime;
  final List<LiquidTxIn> _inputs;
  @override
  List<LiquidTxIn> get inputs {
    if (_inputs is EqualUnmodifiableListView) return _inputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputs);
  }

  final List<LiquidTxOut> _outputs;
  @override
  List<LiquidTxOut> get outputs {
    if (_outputs is EqualUnmodifiableListView) return _outputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputs);
  }

  @override
  final String toAddress;
  @override
  final String? walletId;

  @override
  String toString() {
    return 'LiquidTx(id: $id, type: $type, timestamp: $timestamp, amount: $amount, fee: $fee, height: $height, label: $label, version: $version, vsize: $vsize, size: $size, weight: $weight, locktime: $locktime, inputs: $inputs, outputs: $outputs, toAddress: $toAddress, walletId: $walletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidTxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.vsize, vsize) || other.vsize == vsize) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.locktime, locktime) ||
                other.locktime == locktime) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            const DeepCollectionEquality().equals(other._outputs, _outputs) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      timestamp,
      amount,
      fee,
      height,
      label,
      version,
      vsize,
      size,
      weight,
      locktime,
      const DeepCollectionEquality().hash(_inputs),
      const DeepCollectionEquality().hash(_outputs),
      toAddress,
      walletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidTxImplCopyWith<_$LiquidTxImpl> get copyWith =>
      __$$LiquidTxImplCopyWithImpl<_$LiquidTxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidTxImplToJson(
      this,
    );
  }
}

abstract class _LiquidTx extends LiquidTx {
  factory _LiquidTx(
      {required final String id,
      required final TxType type,
      required final int timestamp,
      required final int amount,
      required final int fee,
      required final int height,
      required final String label,
      required final int version,
      required final int vsize,
      required final int size,
      required final int weight,
      required final int locktime,
      required final List<LiquidTxIn> inputs,
      required final List<LiquidTxOut> outputs,
      required final String toAddress,
      required final String? walletId}) = _$LiquidTxImpl;
  _LiquidTx._() : super._();

  factory _LiquidTx.fromJson(Map<String, dynamic> json) =
      _$LiquidTxImpl.fromJson;

  @override
  String get id;
  @override
  TxType get type;
  @override
  int get timestamp;
  @override
  int get amount;
  @override
  int get fee;
  @override
  int get height;
  @override
  String get label;
  @override
  int get version;
  @override
  int get vsize;
  @override
  int get size;
  @override
  int get weight;
  @override
  int get locktime;
  @override
  List<LiquidTxIn> get inputs;
  @override
  List<LiquidTxOut> get outputs;
  @override
  String get toAddress;
  @override
  String? get walletId;
  @override
  @JsonKey(ignore: true)
  _$$LiquidTxImplCopyWith<_$LiquidTxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiquidOutPoint _$LiquidOutPointFromJson(Map<String, dynamic> json) {
  return _LiquidOutPoint.fromJson(json);
}

/// @nodoc
mixin _$LiquidOutPoint {
  String get txid => throw _privateConstructorUsedError;
  int get vout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidOutPointCopyWith<LiquidOutPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidOutPointCopyWith<$Res> {
  factory $LiquidOutPointCopyWith(
          LiquidOutPoint value, $Res Function(LiquidOutPoint) then) =
      _$LiquidOutPointCopyWithImpl<$Res, LiquidOutPoint>;
  @useResult
  $Res call({String txid, int vout});
}

/// @nodoc
class _$LiquidOutPointCopyWithImpl<$Res, $Val extends LiquidOutPoint>
    implements $LiquidOutPointCopyWith<$Res> {
  _$LiquidOutPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
  }) {
    return _then(_value.copyWith(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidOutPointImplCopyWith<$Res>
    implements $LiquidOutPointCopyWith<$Res> {
  factory _$$LiquidOutPointImplCopyWith(_$LiquidOutPointImpl value,
          $Res Function(_$LiquidOutPointImpl) then) =
      __$$LiquidOutPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txid, int vout});
}

/// @nodoc
class __$$LiquidOutPointImplCopyWithImpl<$Res>
    extends _$LiquidOutPointCopyWithImpl<$Res, _$LiquidOutPointImpl>
    implements _$$LiquidOutPointImplCopyWith<$Res> {
  __$$LiquidOutPointImplCopyWithImpl(
      _$LiquidOutPointImpl _value, $Res Function(_$LiquidOutPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
  }) {
    return _then(_$LiquidOutPointImpl(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidOutPointImpl extends _LiquidOutPoint {
  _$LiquidOutPointImpl({required this.txid, required this.vout}) : super._();

  factory _$LiquidOutPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidOutPointImplFromJson(json);

  @override
  final String txid;
  @override
  final int vout;

  @override
  String toString() {
    return 'LiquidOutPoint(txid: $txid, vout: $vout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidOutPointImpl &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.vout, vout) || other.vout == vout));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, txid, vout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidOutPointImplCopyWith<_$LiquidOutPointImpl> get copyWith =>
      __$$LiquidOutPointImplCopyWithImpl<_$LiquidOutPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidOutPointImplToJson(
      this,
    );
  }
}

abstract class _LiquidOutPoint extends LiquidOutPoint {
  factory _LiquidOutPoint(
      {required final String txid,
      required final int vout}) = _$LiquidOutPointImpl;
  _LiquidOutPoint._() : super._();

  factory _LiquidOutPoint.fromJson(Map<String, dynamic> json) =
      _$LiquidOutPointImpl.fromJson;

  @override
  String get txid;
  @override
  int get vout;
  @override
  @JsonKey(ignore: true)
  _$$LiquidOutPointImplCopyWith<_$LiquidOutPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiquidTxIn _$LiquidTxInFromJson(Map<String, dynamic> json) {
  return _LiquidTxIn.fromJson(json);
}

/// @nodoc
mixin _$LiquidTxIn {
  LiquidOutPoint get previousOutput => throw _privateConstructorUsedError;
  String get scriptSig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidTxInCopyWith<LiquidTxIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidTxInCopyWith<$Res> {
  factory $LiquidTxInCopyWith(
          LiquidTxIn value, $Res Function(LiquidTxIn) then) =
      _$LiquidTxInCopyWithImpl<$Res, LiquidTxIn>;
  @useResult
  $Res call({LiquidOutPoint previousOutput, String scriptSig});

  $LiquidOutPointCopyWith<$Res> get previousOutput;
}

/// @nodoc
class _$LiquidTxInCopyWithImpl<$Res, $Val extends LiquidTxIn>
    implements $LiquidTxInCopyWith<$Res> {
  _$LiquidTxInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousOutput = null,
    Object? scriptSig = null,
  }) {
    return _then(_value.copyWith(
      previousOutput: null == previousOutput
          ? _value.previousOutput
          : previousOutput // ignore: cast_nullable_to_non_nullable
              as LiquidOutPoint,
      scriptSig: null == scriptSig
          ? _value.scriptSig
          : scriptSig // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiquidOutPointCopyWith<$Res> get previousOutput {
    return $LiquidOutPointCopyWith<$Res>(_value.previousOutput, (value) {
      return _then(_value.copyWith(previousOutput: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiquidTxInImplCopyWith<$Res>
    implements $LiquidTxInCopyWith<$Res> {
  factory _$$LiquidTxInImplCopyWith(
          _$LiquidTxInImpl value, $Res Function(_$LiquidTxInImpl) then) =
      __$$LiquidTxInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LiquidOutPoint previousOutput, String scriptSig});

  @override
  $LiquidOutPointCopyWith<$Res> get previousOutput;
}

/// @nodoc
class __$$LiquidTxInImplCopyWithImpl<$Res>
    extends _$LiquidTxInCopyWithImpl<$Res, _$LiquidTxInImpl>
    implements _$$LiquidTxInImplCopyWith<$Res> {
  __$$LiquidTxInImplCopyWithImpl(
      _$LiquidTxInImpl _value, $Res Function(_$LiquidTxInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousOutput = null,
    Object? scriptSig = null,
  }) {
    return _then(_$LiquidTxInImpl(
      previousOutput: null == previousOutput
          ? _value.previousOutput
          : previousOutput // ignore: cast_nullable_to_non_nullable
              as LiquidOutPoint,
      scriptSig: null == scriptSig
          ? _value.scriptSig
          : scriptSig // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidTxInImpl extends _LiquidTxIn {
  _$LiquidTxInImpl({required this.previousOutput, required this.scriptSig})
      : super._();

  factory _$LiquidTxInImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidTxInImplFromJson(json);

  @override
  final LiquidOutPoint previousOutput;
  @override
  final String scriptSig;

  @override
  String toString() {
    return 'LiquidTxIn(previousOutput: $previousOutput, scriptSig: $scriptSig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidTxInImpl &&
            (identical(other.previousOutput, previousOutput) ||
                other.previousOutput == previousOutput) &&
            (identical(other.scriptSig, scriptSig) ||
                other.scriptSig == scriptSig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, previousOutput, scriptSig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidTxInImplCopyWith<_$LiquidTxInImpl> get copyWith =>
      __$$LiquidTxInImplCopyWithImpl<_$LiquidTxInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidTxInImplToJson(
      this,
    );
  }
}

abstract class _LiquidTxIn extends LiquidTxIn {
  factory _LiquidTxIn(
      {required final LiquidOutPoint previousOutput,
      required final String scriptSig}) = _$LiquidTxInImpl;
  _LiquidTxIn._() : super._();

  factory _LiquidTxIn.fromJson(Map<String, dynamic> json) =
      _$LiquidTxInImpl.fromJson;

  @override
  LiquidOutPoint get previousOutput;
  @override
  String get scriptSig;
  @override
  @JsonKey(ignore: true)
  _$$LiquidTxInImplCopyWith<_$LiquidTxInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiquidTxOut _$LiquidTxOutFromJson(Map<String, dynamic> json) {
  return _LiquidTxOut.fromJson(json);
}

/// @nodoc
mixin _$LiquidTxOut {
  int get value => throw _privateConstructorUsedError;
  String get scriptPubKey => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidTxOutCopyWith<LiquidTxOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidTxOutCopyWith<$Res> {
  factory $LiquidTxOutCopyWith(
          LiquidTxOut value, $Res Function(LiquidTxOut) then) =
      _$LiquidTxOutCopyWithImpl<$Res, LiquidTxOut>;
  @useResult
  $Res call({int value, String scriptPubKey, String address});
}

/// @nodoc
class _$LiquidTxOutCopyWithImpl<$Res, $Val extends LiquidTxOut>
    implements $LiquidTxOutCopyWith<$Res> {
  _$LiquidTxOutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? scriptPubKey = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scriptPubKey: null == scriptPubKey
          ? _value.scriptPubKey
          : scriptPubKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidTxOutImplCopyWith<$Res>
    implements $LiquidTxOutCopyWith<$Res> {
  factory _$$LiquidTxOutImplCopyWith(
          _$LiquidTxOutImpl value, $Res Function(_$LiquidTxOutImpl) then) =
      __$$LiquidTxOutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String scriptPubKey, String address});
}

/// @nodoc
class __$$LiquidTxOutImplCopyWithImpl<$Res>
    extends _$LiquidTxOutCopyWithImpl<$Res, _$LiquidTxOutImpl>
    implements _$$LiquidTxOutImplCopyWith<$Res> {
  __$$LiquidTxOutImplCopyWithImpl(
      _$LiquidTxOutImpl _value, $Res Function(_$LiquidTxOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? scriptPubKey = null,
    Object? address = null,
  }) {
    return _then(_$LiquidTxOutImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scriptPubKey: null == scriptPubKey
          ? _value.scriptPubKey
          : scriptPubKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidTxOutImpl extends _LiquidTxOut {
  _$LiquidTxOutImpl(
      {required this.value, required this.scriptPubKey, required this.address})
      : super._();

  factory _$LiquidTxOutImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidTxOutImplFromJson(json);

  @override
  final int value;
  @override
  final String scriptPubKey;
  @override
  final String address;

  @override
  String toString() {
    return 'LiquidTxOut(value: $value, scriptPubKey: $scriptPubKey, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidTxOutImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.scriptPubKey, scriptPubKey) ||
                other.scriptPubKey == scriptPubKey) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, scriptPubKey, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidTxOutImplCopyWith<_$LiquidTxOutImpl> get copyWith =>
      __$$LiquidTxOutImplCopyWithImpl<_$LiquidTxOutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidTxOutImplToJson(
      this,
    );
  }
}

abstract class _LiquidTxOut extends LiquidTxOut {
  factory _LiquidTxOut(
      {required final int value,
      required final String scriptPubKey,
      required final String address}) = _$LiquidTxOutImpl;
  _LiquidTxOut._() : super._();

  factory _LiquidTxOut.fromJson(Map<String, dynamic> json) =
      _$LiquidTxOutImpl.fromJson;

  @override
  int get value;
  @override
  String get scriptPubKey;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$LiquidTxOutImplCopyWith<_$LiquidTxOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}