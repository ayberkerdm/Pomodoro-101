// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerState {
  TimerMode get mode => throw _privateConstructorUsedError;
  int get initialDuration => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;
  int get currentSession => throw _privateConstructorUsedError;
  Task? get activeTask => throw _privateConstructorUsedError;

  /// Arka planda çalışırken gerçek zamanı izleyebilmek için bitiş zamanı hedefi
  DateTime? get targetEndTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {TimerMode mode,
      int initialDuration,
      int remainingTime,
      bool isRunning,
      int currentSession,
      Task? activeTask,
      DateTime? targetEndTime});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? initialDuration = null,
    Object? remainingTime = null,
    Object? isRunning = null,
    Object? currentSession = null,
    Object? activeTask = freezed,
    Object? targetEndTime = freezed,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TimerMode,
      initialDuration: null == initialDuration
          ? _value.initialDuration
          : initialDuration // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
      activeTask: freezed == activeTask
          ? _value.activeTask
          : activeTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      targetEndTime: freezed == targetEndTime
          ? _value.targetEndTime
          : targetEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimerMode mode,
      int initialDuration,
      int remainingTime,
      bool isRunning,
      int currentSession,
      Task? activeTask,
      DateTime? targetEndTime});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? initialDuration = null,
    Object? remainingTime = null,
    Object? isRunning = null,
    Object? currentSession = null,
    Object? activeTask = freezed,
    Object? targetEndTime = freezed,
  }) {
    return _then(_$TimerStateImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TimerMode,
      initialDuration: null == initialDuration
          ? _value.initialDuration
          : initialDuration // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
      activeTask: freezed == activeTask
          ? _value.activeTask
          : activeTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      targetEndTime: freezed == targetEndTime
          ? _value.targetEndTime
          : targetEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl extends _TimerState {
  const _$TimerStateImpl(
      {this.mode = TimerMode.pomodoro,
      this.initialDuration = 25 * 60,
      this.remainingTime = 25 * 60,
      this.isRunning = false,
      this.currentSession = 1,
      this.activeTask,
      this.targetEndTime})
      : super._();

  @override
  @JsonKey()
  final TimerMode mode;
  @override
  @JsonKey()
  final int initialDuration;
  @override
  @JsonKey()
  final int remainingTime;
  @override
  @JsonKey()
  final bool isRunning;
  @override
  @JsonKey()
  final int currentSession;
  @override
  final Task? activeTask;

  /// Arka planda çalışırken gerçek zamanı izleyebilmek için bitiş zamanı hedefi
  @override
  final DateTime? targetEndTime;

  @override
  String toString() {
    return 'TimerState(mode: $mode, initialDuration: $initialDuration, remainingTime: $remainingTime, isRunning: $isRunning, currentSession: $currentSession, activeTask: $activeTask, targetEndTime: $targetEndTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.initialDuration, initialDuration) ||
                other.initialDuration == initialDuration) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.currentSession, currentSession) ||
                other.currentSession == currentSession) &&
            (identical(other.activeTask, activeTask) ||
                other.activeTask == activeTask) &&
            (identical(other.targetEndTime, targetEndTime) ||
                other.targetEndTime == targetEndTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, initialDuration,
      remainingTime, isRunning, currentSession, activeTask, targetEndTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {final TimerMode mode,
      final int initialDuration,
      final int remainingTime,
      final bool isRunning,
      final int currentSession,
      final Task? activeTask,
      final DateTime? targetEndTime}) = _$TimerStateImpl;
  const _TimerState._() : super._();

  @override
  TimerMode get mode;
  @override
  int get initialDuration;
  @override
  int get remainingTime;
  @override
  bool get isRunning;
  @override
  int get currentSession;
  @override
  Task? get activeTask;
  @override

  /// Arka planda çalışırken gerçek zamanı izleyebilmek için bitiş zamanı hedefi
  DateTime? get targetEndTime;
  @override
  @JsonKey(ignore: true)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
