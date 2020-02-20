// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupBase, Store {
  Computed<bool> _$isButtonDisabledComputed;

  @override
  bool get isButtonDisabled => (_$isButtonDisabledComputed ??=
          Computed<bool>(() => super.isButtonDisabled))
      .value;

  final _$emailAtom = Atom(name: '_SignupBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_SignupBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$confirmPasswordAtom = Atom(name: '_SignupBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$accountCreatedAtom = Atom(name: '_SignupBase.accountCreated');

  @override
  SignUpStatus get accountCreated {
    _$accountCreatedAtom.context.enforceReadPolicy(_$accountCreatedAtom);
    _$accountCreatedAtom.reportObserved();
    return super.accountCreated;
  }

  @override
  set accountCreated(SignUpStatus value) {
    _$accountCreatedAtom.context.conditionallyRunInAction(() {
      super.accountCreated = value;
      _$accountCreatedAtom.reportChanged();
    }, _$accountCreatedAtom, name: '${_$accountCreatedAtom.name}_set');
  }

  final _$_SignupBaseActionController = ActionController(name: '_SignupBase');

  @override
  void setEmail(dynamic email) {
    final _$actionInfo = _$_SignupBaseActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_SignupBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic password) {
    final _$actionInfo = _$_SignupBaseActionController.startAction();
    try {
      return super.setPassword(password);
    } finally {
      _$_SignupBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(dynamic confirmPassword) {
    final _$actionInfo = _$_SignupBaseActionController.startAction();
    try {
      return super.setConfirmPassword(confirmPassword);
    } finally {
      _$_SignupBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cadastrar() {
    final _$actionInfo = _$_SignupBaseActionController.startAction();
    try {
      return super.cadastrar();
    } finally {
      _$_SignupBaseActionController.endAction(_$actionInfo);
    }
  }
}
