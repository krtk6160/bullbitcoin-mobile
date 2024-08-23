// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwapState {
// @Default(false) bool creatingInvoice,
// @Default('') String errCreatingInvoice,
  String get errCreatingSwapInv => throw _privateConstructorUsedError;
  bool get generatingSwapInv => throw _privateConstructorUsedError;
  SwapTx? get swapTx => throw _privateConstructorUsedError; // Invoice? invoice,
  bool get errSmallAmt => throw _privateConstructorUsedError;
  double? get errHighFees =>
      throw _privateConstructorUsedError; // Wallet? updatedWallet,
  Fees? get allFees => throw _privateConstructorUsedError;
  String? get errAllFees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwapStateCopyWith<SwapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapStateCopyWith<$Res> {
  factory $SwapStateCopyWith(SwapState value, $Res Function(SwapState) then) =
      _$SwapStateCopyWithImpl<$Res, SwapState>;
  @useResult
  $Res call(
      {String errCreatingSwapInv,
      bool generatingSwapInv,
      SwapTx? swapTx,
      bool errSmallAmt,
      double? errHighFees,
      Fees? allFees,
      String? errAllFees});

  $SwapTxCopyWith<$Res>? get swapTx;
  $FeesCopyWith<$Res>? get allFees;
}

/// @nodoc
class _$SwapStateCopyWithImpl<$Res, $Val extends SwapState>
    implements $SwapStateCopyWith<$Res> {
  _$SwapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCreatingSwapInv = null,
    Object? generatingSwapInv = null,
    Object? swapTx = freezed,
    Object? errSmallAmt = null,
    Object? errHighFees = freezed,
    Object? allFees = freezed,
    Object? errAllFees = freezed,
  }) {
    return _then(_value.copyWith(
      errCreatingSwapInv: null == errCreatingSwapInv
          ? _value.errCreatingSwapInv
          : errCreatingSwapInv // ignore: cast_nullable_to_non_nullable
              as String,
      generatingSwapInv: null == generatingSwapInv
          ? _value.generatingSwapInv
          : generatingSwapInv // ignore: cast_nullable_to_non_nullable
              as bool,
      swapTx: freezed == swapTx
          ? _value.swapTx
          : swapTx // ignore: cast_nullable_to_non_nullable
              as SwapTx?,
      errSmallAmt: null == errSmallAmt
          ? _value.errSmallAmt
          : errSmallAmt // ignore: cast_nullable_to_non_nullable
              as bool,
      errHighFees: freezed == errHighFees
          ? _value.errHighFees
          : errHighFees // ignore: cast_nullable_to_non_nullable
              as double?,
      allFees: freezed == allFees
          ? _value.allFees
          : allFees // ignore: cast_nullable_to_non_nullable
              as Fees?,
      errAllFees: freezed == errAllFees
          ? _value.errAllFees
          : errAllFees // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SwapTxCopyWith<$Res>? get swapTx {
    if (_value.swapTx == null) {
      return null;
    }

    return $SwapTxCopyWith<$Res>(_value.swapTx!, (value) {
      return _then(_value.copyWith(swapTx: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FeesCopyWith<$Res>? get allFees {
    if (_value.allFees == null) {
      return null;
    }

    return $FeesCopyWith<$Res>(_value.allFees!, (value) {
      return _then(_value.copyWith(allFees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapStateImplCopyWith<$Res>
    implements $SwapStateCopyWith<$Res> {
  factory _$$SwapStateImplCopyWith(
          _$SwapStateImpl value, $Res Function(_$SwapStateImpl) then) =
      __$$SwapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errCreatingSwapInv,
      bool generatingSwapInv,
      SwapTx? swapTx,
      bool errSmallAmt,
      double? errHighFees,
      Fees? allFees,
      String? errAllFees});

  @override
  $SwapTxCopyWith<$Res>? get swapTx;
  @override
  $FeesCopyWith<$Res>? get allFees;
}

/// @nodoc
class __$$SwapStateImplCopyWithImpl<$Res>
    extends _$SwapStateCopyWithImpl<$Res, _$SwapStateImpl>
    implements _$$SwapStateImplCopyWith<$Res> {
  __$$SwapStateImplCopyWithImpl(
      _$SwapStateImpl _value, $Res Function(_$SwapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCreatingSwapInv = null,
    Object? generatingSwapInv = null,
    Object? swapTx = freezed,
    Object? errSmallAmt = null,
    Object? errHighFees = freezed,
    Object? allFees = freezed,
    Object? errAllFees = freezed,
  }) {
    return _then(_$SwapStateImpl(
      errCreatingSwapInv: null == errCreatingSwapInv
          ? _value.errCreatingSwapInv
          : errCreatingSwapInv // ignore: cast_nullable_to_non_nullable
              as String,
      generatingSwapInv: null == generatingSwapInv
          ? _value.generatingSwapInv
          : generatingSwapInv // ignore: cast_nullable_to_non_nullable
              as bool,
      swapTx: freezed == swapTx
          ? _value.swapTx
          : swapTx // ignore: cast_nullable_to_non_nullable
              as SwapTx?,
      errSmallAmt: null == errSmallAmt
          ? _value.errSmallAmt
          : errSmallAmt // ignore: cast_nullable_to_non_nullable
              as bool,
      errHighFees: freezed == errHighFees
          ? _value.errHighFees
          : errHighFees // ignore: cast_nullable_to_non_nullable
              as double?,
      allFees: freezed == allFees
          ? _value.allFees
          : allFees // ignore: cast_nullable_to_non_nullable
              as Fees?,
      errAllFees: freezed == errAllFees
          ? _value.errAllFees
          : errAllFees // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SwapStateImpl extends _SwapState {
  const _$SwapStateImpl(
      {this.errCreatingSwapInv = '',
      this.generatingSwapInv = false,
      this.swapTx,
      this.errSmallAmt = false,
      this.errHighFees,
      this.allFees,
      this.errAllFees})
      : super._();

// @Default(false) bool creatingInvoice,
// @Default('') String errCreatingInvoice,
  @override
  @JsonKey()
  final String errCreatingSwapInv;
  @override
  @JsonKey()
  final bool generatingSwapInv;
  @override
  final SwapTx? swapTx;
// Invoice? invoice,
  @override
  @JsonKey()
  final bool errSmallAmt;
  @override
  final double? errHighFees;
// Wallet? updatedWallet,
  @override
  final Fees? allFees;
  @override
  final String? errAllFees;

  @override
  String toString() {
    return 'SwapState(errCreatingSwapInv: $errCreatingSwapInv, generatingSwapInv: $generatingSwapInv, swapTx: $swapTx, errSmallAmt: $errSmallAmt, errHighFees: $errHighFees, allFees: $allFees, errAllFees: $errAllFees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapStateImpl &&
            (identical(other.errCreatingSwapInv, errCreatingSwapInv) ||
                other.errCreatingSwapInv == errCreatingSwapInv) &&
            (identical(other.generatingSwapInv, generatingSwapInv) ||
                other.generatingSwapInv == generatingSwapInv) &&
            (identical(other.swapTx, swapTx) || other.swapTx == swapTx) &&
            (identical(other.errSmallAmt, errSmallAmt) ||
                other.errSmallAmt == errSmallAmt) &&
            (identical(other.errHighFees, errHighFees) ||
                other.errHighFees == errHighFees) &&
            (identical(other.allFees, allFees) || other.allFees == allFees) &&
            (identical(other.errAllFees, errAllFees) ||
                other.errAllFees == errAllFees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errCreatingSwapInv,
      generatingSwapInv, swapTx, errSmallAmt, errHighFees, allFees, errAllFees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapStateImplCopyWith<_$SwapStateImpl> get copyWith =>
      __$$SwapStateImplCopyWithImpl<_$SwapStateImpl>(this, _$identity);
}

abstract class _SwapState extends SwapState {
  const factory _SwapState(
      {final String errCreatingSwapInv,
      final bool generatingSwapInv,
      final SwapTx? swapTx,
      final bool errSmallAmt,
      final double? errHighFees,
      final Fees? allFees,
      final String? errAllFees}) = _$SwapStateImpl;
  const _SwapState._() : super._();

  @override // @Default(false) bool creatingInvoice,
// @Default('') String errCreatingInvoice,
  String get errCreatingSwapInv;
  @override
  bool get generatingSwapInv;
  @override
  SwapTx? get swapTx;
  @override // Invoice? invoice,
  bool get errSmallAmt;
  @override
  double? get errHighFees;
  @override // Wallet? updatedWallet,
  Fees? get allFees;
  @override
  String? get errAllFees;
  @override
  @JsonKey(ignore: true)
  _$$SwapStateImplCopyWith<_$SwapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
