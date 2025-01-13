// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Not a member yet?`
  String get member {
    return Intl.message(
      'Not a member yet?',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcome {
    return Intl.message(
      'Welcome back',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget password ?`
  String get forgetPassword {
    return Intl.message(
      'Did you forget password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get haveAccount {
    return Intl.message(
      'Do you have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get verification {
    return Intl.message(
      'Enter Verification Code',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `group name`
  String get groupName {
    return Intl.message(
      'group name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Created by `
  String get created {
    return Intl.message(
      'Created by ',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  /// `no group available`
  String get noGroupsAvailable {
    return Intl.message(
      'no group available',
      name: 'noGroupsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: '',
      args: [],
    );
  }

  /// `Join at : `
  String get historyOfJoin {
    return Intl.message(
      'Join at : ',
      name: 'historyOfJoin',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message(
      'Files',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `invalid input`
  String get invalidInput {
    return Intl.message(
      'invalid input',
      name: 'invalidInput',
      desc: '',
      args: [],
    );
  }

  /// `name is required`
  String get nameRequired {
    return Intl.message(
      'name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `email is required`
  String get emailRequired {
    return Intl.message(
      'email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `password is required`
  String get passwordRequired {
    return Intl.message(
      'password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `code is required`
  String get codeRequired {
    return Intl.message(
      'code is required',
      name: 'codeRequired',
      desc: '',
      args: [],
    );
  }

  /// `name is required`
  String get groupNameRequired {
    return Intl.message(
      'name is required',
      name: 'groupNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `No users Selected`
  String get noUsersSelected {
    return Intl.message(
      'No users Selected',
      name: 'noUsersSelected',
      desc: '',
      args: [],
    );
  }

  /// `search users`
  String get searchUsers {
    return Intl.message(
      'search users',
      name: 'searchUsers',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Show Requests`
  String get showRequests {
    return Intl.message(
      'Show Requests',
      name: 'showRequests',
      desc: '',
      args: [],
    );
  }

  /// `Show Users`
  String get showUsers {
    return Intl.message(
      'Show Users',
      name: 'showUsers',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
