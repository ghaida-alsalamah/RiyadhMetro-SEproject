import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'ehafxu2b': {
      'en': 'RIYADH METRO',
      'ar': 'مترو الرياض',
    },
    't7l6bd2o': {
      'en': 'Welcome Back',
      'ar': 'مرحباً بعودتك',
    },
    'k8jn593d': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'qw4o1kt8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'xix0a06z': {
      'en': 'log in',
      'ar': 'تسجيل الدخول',
    },
    'slhv509x': {
      'en': 'Forgot Password? ',
      'ar': 'نسيت كلمة المرور؟',
    },
    'tzho89nl': {
      'en': 'Reset Now',
      'ar': 'إعادة تعيين',
    },
    '7egxrfb7': {
      'en': 'Don\'t have an acoount? ',
      'ar': 'ليس لديك حساب ؟',
    },
    'fu2elh46': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '5sm7v7vb': {
      'en': 'An Administrator? ',
      'ar': 'إداري ؟',
    },
    's7ho80pm': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    'wsvzdr83': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // CreateAccount1
  {
    'ddbttm6v': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
    },
    'khak6nv3': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    '9r5gqz1k': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'fn02ms8x': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'buw3i3kz': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '5db1v4u1': {
      'en': 'Already have an account? ',
      'ar': ' لديك حساب؟',
    },
    'mvf5m887': {
      'en': 'log In ',
      'ar': 'تسجيل الدخول ',
    },
    'mfct8t7h': {
      'en': 'RIYADH METRO',
      'ar': 'مترو الرياض',
    },
    '7wirf5fg': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // homepage
  {
    'gjfeanj9': {
      'en': 'RIYADH METRO',
      'ar': 'مترو الرياض',
    },
    'alxlp0z2': {
      'en': 'Welcome to Riyadh Metro',
      'ar': 'مرحبا بكم في مترو الرياض',
    },
    '12npxkmx': {
      'en': 'Purchase Ticket',
      'ar': 'شراء تذكرة',
    },
    'rzfk1k8n': {
      'en': 'Journey History',
      'ar': 'سجل الرحلات',
    },
    'tk89rckx': {
      'en': 'Favorites',
      'ar': 'المفضلة',
    },
    'we4xneaj': {
      'en': 'View Route Map',
      'ar': 'عرض خريطة الطريق',
    },
    'k90w2je0': {
      'en': 'Find Nearest Station',
      'ar': 'البحث عن اقرب محطة',
    },
    'qzcqo7d8': {
      'en': 'Popular Routes',
      'ar': 'المسارات الاكثر شهرة',
    },
    'nlqb09q0': {
      'en': 'King Abdullah Financial District',
      'ar': 'مركز الملك عبدالله المالي',
    },
    '8yxn5iru': {
      'en': 'to Western Station',
      'ar': 'إلى المحطة الغربية',
    },
    'pu9zd0h1': {
      'en': 'Olaya Station',
      'ar': 'محطة العليا',
    },
    'xbrq3g45': {
      'en': 'to King Khalid Airport',
      'ar': 'الى مطار الملك خالد',
    },
    '39qkw9hc': {
      'en': 'Western Station',
      'ar': 'المحطة الغربية',
    },
    'b4bks3e9': {
      'en': 'to Qasr Al-Hokm',
      'ar': 'الى قصر الحكم',
    },
  },
  // settings
  {
    'r65boc7f': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    '9hlmocgj': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'h3fds56m': {
      'en': 'Notifications',
      'ar': 'الإشعارات',
    },
    'f00770xg': {
      'en': 'drak mode',
      'ar': 'النمط الداكن',
    },
    'wifbmn8l': {
      'en': 'set',
      'ar': 'تعيين',
    },
    'fqfnwnud': {
      'en': 'light  mode',
      'ar': 'النمط الفاتح',
    },
    'q9c8frcd': {
      'en': 'set',
      'ar': 'تعيين',
    },
    'gtplcrb1': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
    },
    '1zbu6gpe': {
      'en': 'About',
      'ar': 'حول',
    },
    '5ewl6gtz': {
      'en': 'log out\n',
      'ar': 'تسجيل الخروج',
    },
  },
  // resetpass
  {
    'meqa96uu': {
      'en': 'Back',
      'ar': 'رجوع',
    },
    '0h3j9zxy': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'mk1tlrha': {
      'en': 'your email',
      'ar': 'بريدك الالكتروني',
    },
    'srb9ck6h': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'atlgqbg9': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'it9ehywa': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // about
  {
    '058bvbme': {
      'en': 'About',
      'ar': 'حول',
    },
    'vria6b8x': {
      'en':
          'The Riyadh Metro App was developed with a vision to modernize and simplify public transportation. Our goal is to provide a seamless digital platform for metro users and administrators, ensuring an efficient and enjoyable travel experience for everyone. By combining advanced technology and user-centric design, we aim to make urban mobility smarter and more accessible.',
      'ar':
          'تم تطوير تطبيق مترو الرياض بهدف تحديث وتبسيط وسائل النقل العام. هدفنا هو توفير منصة رقمية سلسة لمستخدمي المترو والقائمين عليه، مما يضمن تجربة سفر فعالة وممتعة للجميع. من خلال الجمع بين التكنولوجيا المتقدمة والتصميم الذي يركز على المستخدم، نهدف إلى جعل التنقل الحضري أكثر ذكاءً وسهولة في الوصول.',
    },
    '255pmxpf': {
      'en': 'Key Features',
      'ar': 'الميزات الرئيسية',
    },
    'eyrlf3io': {
      'en':
          '• Real-time train tracking\n• Digital ticketing system\n• Journey planning\n• Station information\n• Service updates\n• Multi-language support',
      'ar':
          '• تتبع القطارات في الوقت الفعلي\n• نظام التذاكر الرقمية\n• تخطيط الرحلة\n• معلومات المحطة\n• تحديثات الخدمة\n• دعم متعدد اللغات',
    },
    'ftplqrf4': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    '0z11ezeb': {
      'en':
          'Email: support@riyadhmetro.sa\nPhone: +966 99 999 9999\nWorking Hours: 24/7',
      'ar':
          'البريد الإلكتروني: support@riyadhmetro.sa\nالهاتف: +966 99 999 9999\nساعات العمل: 24/7',
    },
    'sbwwdohu': {
      'en': 'Version Information',
      'ar': 'معلومات الإصدار',
    },
    'pflobrxc': {
      'en':
          'App Version: 1.0.0\nLast Updated: January 10 , 2025\nPlatform: iOS & Android & web',
      'ar':
          'إصدار التطبيق: 1.0.0\nآخر تحديث: 10 يناير 2025\nالمنصة: iOS وAndroid والويب',
    },
    'l54vvtyb': {
      'en': '© 2024 Riyadh Metro. All rights reserved.',
      'ar': '© 2024 مترو الرياض. جميع الحقوق محفوظة.',
    },
    'jg7m6jfa': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // routemap
  {
    '2xv25kln': {
      'en': 'Route Map',
      'ar': 'خريطة المسارات',
    },
    'ob45ovhg': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // favorites
  {
    'xsdcpjwf': {
      'en': 'Favorites',
      'ar': 'المفضلة',
    },
    'wavnomdw': {
      'en': 'Add New Location',
      'ar': 'إضافة موقع جديد',
    },
    'pfgefynv': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    '3xvcctux': {
      'en': 'Work',
      'ar': 'عمل',
    },
    '0345yoa4': {
      'en': 'Gym',
      'ar': 'النادي',
    },
    '22j7cvba': {
      'en': 'Coffee Shop',
      'ar': 'مقهى',
    },
    'npc9x1rs': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // helpcenter
  {
    'lbw3sntz': {
      'en': 'Frequently Asked Questions',
      'ar': 'الأسئلة الشائعة',
    },
    'orcb98op': {
      'en': 'How do I reset my password?',
      'ar': 'كيف يمكنني إعادة تعيين كلمة المرور الخاصة بي؟',
    },
    'hb37qs3l': {
      'en':
          'To reset your password, go to the settings click the \"reset password\" option fill your email.',
      'ar':
          'لإعادة تعيين كلمة المرور الخاصة بك، انتقل إلى الإعدادات وانقر على خيار \"إعادة تعيين كلمة المرور\" وقم بتعبة بريدك الالكتروني.',
    },
    'zp8083r0': {
      'en': 'How can I find the nearest station?',
      'ar': 'كيف يمكنني العثور على أقرب محطة؟',
    },
    'wrguea86': {
      'en':
          'Use the Find Nearest Station feature, which uses GPS to locate the nearest metro station to your current location.',
      'ar':
          'استخدم ميزة البحث عن أقرب محطة، والتي تستخدم نظام تحديد المواقع العالمي (GPS) لتحديد أقرب محطة مترو إلى موقعك الحالي.',
    },
    't5qjwaf6': {
      'en': 'Contact Support',
      'ar': 'اتصل بالدعم',
    },
    'w68znebx': {
      'en':
          'If you couldn\'t find what you\'re looking for, send us an email and we\'ll get back to you within 24 hours.',
      'ar':
          'إذا لم تتمكن من العثور على ما تبحث عنه، أرسل لنا بريدًا إلكترونيًا وسنرد عليك خلال 24 ساعة.',
    },
    'q26s3i2n': {
      'en': 'Describe your issue',
      'ar': 'وصف مشكلتك',
    },
    'jhd20q5e': {
      'en': '',
      'ar': '',
    },
    '8di7ihb3': {
      'en': 'Send Email',
      'ar': 'إرسال بريد إلكتروني',
    },
    'izyxg6e9': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
    },
    '18967lam': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // nearest
  {
    '4f2gdisv': {
      'en': 'Nearest Station',
      'ar': 'أقرب محطة',
    },
    'da42o54h': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // AdminHomePage
  {
    'gd5nvadu': {
      'en': 'RIYADH METRO',
      'ar': 'مترو الرياض',
    },
    'sb7y6sah': {
      'en': 'Send Notification',
      'ar': 'إرسال إشعار',
    },
    'th8huwyq': {
      'en': 'Restrict Ticket Sale',
      'ar': 'تقييد بيع التذاكر',
    },
    'b0n25kli': {
      'en': 'Schedule Maintenance',
      'ar': 'جدولة صيانة',
    },
    'dby74err': {
      'en': 'Answer Query',
      'ar': 'ابحث عن المحطة',
    },
    '23ml7gsq': {
      'en': 'Line Status',
      'ar': 'حالة الخط',
    },
    'j5uc9su5': {
      'en': 'Blue Line',
      'ar': 'الخط الأزرق',
    },
    '6tgxkxh2': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    'a231wo95': {
      'en': 'Green Line',
      'ar': 'الخط الأخضر',
    },
    'jpotiaex': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    '30ae5hh8': {
      'en': 'Red Line',
      'ar': 'الخط الأحمر',
    },
    'kthzlbiq': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    'rj1zhtjk': {
      'en': 'Purple Line',
      'ar': 'الخط الأرجواني',
    },
    'gundz0jt': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    'rbi6ij4i': {
      'en': 'Yellow Line',
      'ar': 'الخط الأصفر',
    },
    'monbxmjl': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    '88eqfnga': {
      'en': 'Orange Line',
      'ar': 'الخط البرتقالي',
    },
    'aliyecn0': {
      'en': 'Operating',
      'ar': 'التشغيل',
    },
    'z4793227': {
      'en': 'System Alert',
      'ar': 'تنبيه النظام',
    },
    'kdy10gfx': {
      'en': 'There are no alerts.',
      'ar': 'لايوجد تنبيهات طارئة',
    },
  },
  // AdminSettings
  {
    'je0yt0pb': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'rmrtw95t': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'vnv2drc2': {
      'en': 'drak mode',
      'ar': 'النمط الداكن',
    },
    'wb5utnfv': {
      'en': 'set',
      'ar': 'تعيين',
    },
    '1gvdq1nu': {
      'en': 'light  mode',
      'ar': 'النمط الفاتح',
    },
    '5b1z6n9u': {
      'en': 'set',
      'ar': 'تعيين',
    },
    'tj4g4tkf': {
      'en': 'log out\n',
      'ar': 'تسجيل الخروج',
    },
  },
  // AdminLogin
  {
    '9v1ve2h2': {
      'en': 'Welcome Back',
      'ar': 'مرحباً بعودتك',
    },
    'pej0f9ey': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    's67izywu': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'ifkuu8es': {
      'en': 'log in',
      'ar': 'تسجيل الدخول',
    },
    'zc7y4dkq': {
      'en': 'Welcome Back',
      'ar': 'مرحباً بعودتك',
    },
    'jsjtcvin': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'ru4ahneq': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'gf4zyyvr': {
      'en': 'log in',
      'ar': 'تسجيل الدخول',
    },
    'v1b2kjc2': {
      'en': 'Forgot Password? ',
      'ar': 'نسيت كلمة المرور ؟',
    },
    'jtrrxty0': {
      'en': 'Reset Now',
      'ar': 'إعاده تعيين كلمة المرور',
    },
    'orchp69l': {
      'en': 'A Passenger? ',
      'ar': 'مستخدم ؟',
    },
    'k5q9qpqc': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    'qnelyote': {
      'en': 'RIYADH METRO',
      'ar': 'مترو الرياض',
    },
    '1lj5jobm': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // puechaseticket
  {
    '0iy1520e': {
      'en': 'Purchase Ticket',
      'ar': 'شراء تذكرة',
    },
    'fl5ts4dk': {
      'en': 'Select Journey',
      'ar': 'اختر الرحلة',
    },
    '2raaeluv': {
      'en': 'From Station',
      'ar': 'من المحطة',
    },
    'cbelyz0r': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    '7a2dj12w': {
      'en': 'KAFD',
      'ar': 'مركز الملك عبدالله المالي',
    },
    'mzr4rdsf': {
      'en': 'Olaya',
      'ar': 'العليا',
    },
    'tpd6fkkx': {
      'en': 'Al Malaz',
      'ar': 'الملز',
    },
    '9tgq2qhq': {
      'en': 'Western',
      'ar': 'الغربي',
    },
    'mker3cj8': {
      'en': 'King Khalid  Airport',
      'ar': 'مطار الملك خالد',
    },
    '3hhlz6hm': {
      'en': 'Qasar Al-Hokm',
      'ar': 'قصر الحكم',
    },
    '3zd869jo': {
      'en': 'To Station',
      'ar': 'الى المحطة',
    },
    '1182oapv': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '0yg65xbs': {
      'en': 'KAFD',
      'ar': 'مركز الملك عبدالله المالي',
    },
    'kqsb6lug': {
      'en': 'Olaya',
      'ar': 'العليا',
    },
    'xbr42zv3': {
      'en': 'Al Malaz',
      'ar': 'الملز',
    },
    '7txczymj': {
      'en': 'Western',
      'ar': 'الغربي',
    },
    'exbv4d4o': {
      'en': 'King Khalid  Airport',
      'ar': 'مطار الملك خالد',
    },
    'v13xhaf2': {
      'en': 'Qasar Al-Hokm',
      'ar': 'قصر الحكم',
    },
    'ixxlce53': {
      'en': 'Select Ticket Type',
      'ar': 'حدد نوع التذكرة',
    },
    'bhrguyyw': {
      'en': 'Single Journey',
      'ar': 'رحلة واحدة',
    },
    '97eqn6ks': {
      'en': 'Valid for one trip',
      'ar': 'صالحة لرحلة واحدة',
    },
    'gcfti0kz': {
      'en': '5 SAR',
      'ar': '5 ريال سعودي',
    },
    '4tqoexom': {
      'en': 'select',
      'ar': 'اختار',
    },
    'kmzr1gth': {
      'en': 'Day Pass',
      'ar': 'تذكرة يومية',
    },
    'uedn0ksq': {
      'en': 'Unlimited trips for 24 hours',
      'ar': 'رحلات غير محدودة لمدة 24 ساعة',
    },
    'n9iy5hiv': {
      'en': '15 SAR',
      'ar': '15 ريال سعودي',
    },
    '6f2v8t3h': {
      'en': 'select',
      'ar': 'اختار',
    },
    'im33bfgt': {
      'en': 'Weekly Pass',
      'ar': 'تذكرة اسبوعية',
    },
    'dxmuc5af': {
      'en': 'Unlimited trips for 7 days',
      'ar': 'رحلات غير محدودة لمدة 7 أيام',
    },
    'w5u7t5n7': {
      'en': '50 SAR',
      'ar': '50 ريال سعودي',
    },
    '7x70kfp6': {
      'en': 'select',
      'ar': 'اختار',
    },
    '3jwkw9od': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
    },
    'ilij4vm7': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
    },
    '2jait47t': {
      'en': 'Apple pay',
      'ar': 'أبل باي',
    },
    'cc75hmab': {
      'en': ' ',
      'ar': '',
    },
    'ia372z0m': {
      'en': '',
      'ar': '',
    },
    'idpbfqhp': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'xvfufcjp': {
      'en': 'Ticket Price',
      'ar': 'سعر التذكرة',
    },
    '60ilkipk': {
      'en': 'Service Fee 15%',
      'ar': 'رسوم الخدمة 15%',
    },
    'gv064okm': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'unh3mxse': {
      'en': 'Purchase Ticket',
      'ar': 'شراء تذكرة',
    },
  },
  // JourneyHistory
  {
    'fdggqgzz': {
      'en': 'Journey History',
      'ar': 'سجل الرحلات',
    },
    '7o0ine1o': {
      'en': 'King Abdullah Financial District',
      'ar': 'مركز الملك عبدالله المالي',
    },
    '999mxvm2': {
      'en': 'to Western Station',
      'ar': 'إلى المحطة الغربية',
    },
    'z132e8wg': {
      'en': 'Jan 15, 2024',
      'ar': '15 يناير 2024',
    },
    '7kga0uy2': {
      'en': '12:30 PM',
      'ar': '12:30 ظهرا',
    },
    '8cwdukgs': {
      'en': 'Journey Duration:',
      'ar': 'مدة الرحلة:',
    },
    't56ym54m': {
      'en': '45 minutes',
      'ar': '45 دقيقة',
    },
    'q70j8w6e': {
      'en': 'Olaya Station',
      'ar': 'محطة العليا',
    },
    '44l96v4b': {
      'en': 'to Al Malaz Station',
      'ar': 'الى محطة الملز',
    },
    '1s1u7tt2': {
      'en': 'Jan 14, 2024',
      'ar': '14 يناير 2024',
    },
    'qe2s8mtr': {
      'en': '4:15 PM',
      'ar': '4:15 مساءً',
    },
    'unn77tga': {
      'en': 'Journey Duration:',
      'ar': 'مدة الرحلة:',
    },
    'gxo9ln5o': {
      'en': '30 minutes',
      'ar': '30 دقيقة',
    },
    'i3saqkf6': {
      'en': 'Western Station',
      'ar': 'المحطة الغربية',
    },
    'oxn907jr': {
      'en': 'to King Khalid Airport',
      'ar': 'الى مطار الملك خالد',
    },
    'fj4up09p': {
      'en': 'Jan 12, 2024',
      'ar': '12 يناير 2024',
    },
    'ny2iet88': {
      'en': '9:45 AM',
      'ar': '9:45 صباحًا',
    },
    '8jltc36c': {
      'en': 'Journey Duration:',
      'ar': 'مدة الرحلة:',
    },
    'vcdtvlh5': {
      'en': '55 minutes',
      'ar': '55 دقيقة',
    },
    '5lnc7s2m': {
      'en': 'Al Malaz Station',
      'ar': 'محطة الملز',
    },
    'm7lhsr5l': {
      'en': 'to Olaya Station',
      'ar': 'الى محطة العليا',
    },
    '5pq4uz7w': {
      'en': 'Jan 10, 2024',
      'ar': '10 يناير 2024',
    },
    'ogp3mxtk': {
      'en': '2:00 PM',
      'ar': '2:00 ظهرا',
    },
    '4ghusb5y': {
      'en': 'Journey Duration:',
      'ar': 'مدة الرحلة:',
    },
    'psw3xwwj': {
      'en': '30 minutes',
      'ar': '30 دقيقة',
    },
    '9xthgxmo': {
      'en': 'King Abdullah Financial District',
      'ar': 'مركز الملك عبدالله المالي',
    },
    'i9aeb18l': {
      'en': 'to Western Station',
      'ar': 'إلى المحطة الغربية',
    },
    'so1qxju5': {
      'en': 'Jan 8, 2024',
      'ar': '8 يناير 2024',
    },
    'fd42enbr': {
      'en': '11:20 AM',
      'ar': '11:20 صباحًا',
    },
    't2dzvehy': {
      'en': 'Journey Duration:',
      'ar': 'مدة الرحلة:',
    },
    'rr5en309': {
      'en': '45 minutes',
      'ar': '45 دقيقة',
    },
  },
  // sendnotifications
  {
    '9vbqwlhf': {
      'en': 'Send Notifications',
      'ar': 'إرسال الإشعارات',
    },
    'iou20f17': {
      'en': 'Create Notification',
      'ar': 'إنشاء إشعار',
    },
    'xiv004nv': {
      'en': 'Notification Title',
      'ar': 'عنوان الإشعار',
    },
    'sbbwdmjp': {
      'en': 'Notification Message',
      'ar': 'رسالة الإشعار',
    },
    'b79gj004': {
      'en': 'Notification Type',
      'ar': 'نوع الإشعار',
    },
    'hwoluump': {
      'en': 'Alert',
      'ar': 'يُحذًِر',
    },
    'czaj55xs': {
      'en': 'Advertisement',
      'ar': 'إعلان',
    },
    'ybmjj2xf': {
      'en': 'Target Audience',
      'ar': 'الجمهور المستهدف',
    },
    '0ob90egr': {
      'en': 'All Passengers',
      'ar': 'جميع الركاب',
    },
    'jrxv5viz': {
      'en': 'Weekly Pass Holders',
      'ar': 'حاملي البطاقة الأسبوعية',
    },
    '3jtxjn4k': {
      'en': 'Monthly Pass Holders',
      'ar': 'حاملي البطاقة الشهرية',
    },
    'g6hm00x0': {
      'en': 'Schedule',
      'ar': 'جدول',
    },
    'qjt3crs3': {
      'en': 'Send Now',
      'ar': 'أرسل الآن',
    },
    '7m8efuel': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'htbhqmwm': {
      'en': 'Select Date',
      'ar': 'حدد التاريخ',
    },
    'cslspiux': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'ro0mm6tj': {
      'en': 'Select Time',
      'ar': 'حدد الوقت',
    },
    'rzocwwmk': {
      'en': 'Send Notification',
      'ar': 'إرسال إشعار',
    },
  },
  // schedulemaintenance
  {
    'dgtmob5q': {
      'en': 'Schedule Maintenance',
      'ar': 'جدولة الصيانة',
    },
    '4w59gha1': {
      'en': 'Select Metro Line',
      'ar': 'حدد خط المترو',
    },
    'd5vhv455': {
      'en': 'Blue Line',
      'ar': 'الخط الأزرق',
    },
    'uqw79flc': {
      'en': 'Green Line',
      'ar': 'الخط الأخضر',
    },
    '8cgcd0ao': {
      'en': 'Yellow Line',
      'ar': 'الخط الأصفر',
    },
    '4j0691qd': {
      'en': 'Red Line',
      'ar': 'الخط الأحمر',
    },
    'b3yg8izc': {
      'en': 'Purple Line',
      'ar': 'الخط الأرجواني',
    },
    '8luqk7ar': {
      'en': 'Orange Line',
      'ar': 'الخط البرتقالي',
    },
    'rqv81fin': {
      'en': 'Maintenance Details',
      'ar': 'تفاصيل الصيانة',
    },
    'oemcryvu': {
      'en': 'Maintenance Type',
      'ar': 'نوع الصيانة',
    },
    '9hqx6rd6': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '07euftn6': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'j7yotqxa': {
      'en': 'Select Date',
      'ar': 'حدد التاريخ',
    },
    'xhbek08x': {
      'en': 'Start Time',
      'ar': 'وقت البدء',
    },
    'v46fxrtz': {
      'en': 'Select Time',
      'ar': 'حدد الوقت',
    },
    'byssoray': {
      'en': 'Station Selection',
      'ar': 'اختيار المحطة',
    },
    's3x11x01': {
      'en': 'Starting Station',
      'ar': 'محطة البداية',
    },
    '2i29v5x8': {
      'en': 'Ending Station',
      'ar': 'محطة النهاية',
    },
    '1pfpg5a1': {
      'en': 'Additional Information',
      'ar': 'معلومات إضافية',
    },
    'leg7egou': {
      'en': 'Requires Line Closure',
      'ar': 'يتطلب إغلاق الخط',
    },
    'n3sarzj7': {
      'en': 'Emergency Maintenance',
      'ar': 'الصيانة الطارئة',
    },
    '2c2u754f': {
      'en': 'Schedule Maintenance',
      'ar': 'جدولة الصيانة',
    },
  },
  // quary
  {
    'hd5a3gcd': {
      'en': 'Passenger Queries',
      'ar': 'استفسارات الركاب',
    },
    'rfmozjok': {
      'en': 'Respond',
      'ar': '',
    },
  },
  // resetpassCopy_admin
  {
    '1n8xjxmx': {
      'en': 'Back',
      'ar': 'رجوع',
    },
    '73v2dge9': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'aur7jq7u': {
      'en': 'your email',
      'ar': 'بريدك',
    },
    '1gqkizqk': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك',
    },
    'aestw7r2': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'ivhubicg': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // AdminResetLogIn
  {
    'agr5s4ms': {
      'en': 'Back',
      'ar': 'رجوع',
    },
    'xbxyuyc1': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'du8qcu5z': {
      'en': 'your email',
      'ar': 'بريدك',
    },
    'tuu94bxw': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك',
    },
    '0prygxot': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    '5x02nrya': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PassResetLogIn
  {
    'k22rp9ht': {
      'en': 'Back',
      'ar': 'رجوع',
    },
    '63dzsfep': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'bo17p6vb': {
      'en': 'your email',
      'ar': 'بريدك',
    },
    'ew79ee5f': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك',
    },
    '7fw2ojsm': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'f7nxn5l7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // test_JourneyHistory
  {
    'r3m5m3i3': {
      'en': 'Journey History',
      'ar': 'سجل الرحلات',
    },
    'f2dua1uw': {
      'en': 'Ticket type:',
      'ar': 'نوع التذكرة:',
    },
  },
  // lines
  {
    '0dh1m9ao': {
      'en': ' Lines Routes',
      'ar': 'خطوط المسارات',
    },
    'tphk2ojz': {
      'en': 'Select Your Line',
      'ar': 'حدد خطك',
    },
    'aw4lyi5r': {
      'en': 'Red Line',
      'ar': 'الخط الأحمر',
    },
    'ic9wgph1': {
      'en': 'King Soud University\nKing Fahad Sport City',
      'ar': 'جامعة الملك سعود\nمدينة الملك فهد الرياضية',
    },
    '4c9ysxua': {
      'en': 'Blue Line',
      'ar': 'الخط الأزرق',
    },
    'chf3tj86': {
      'en': 'SAB Bank \nAd Dar Al Baida                 ',
      'ar': 'بنك ساب \nالدار البيضاء',
    },
    'ndjqflkv': {
      'en': 'Purple Line',
      'ar': 'الخط البنفسجي',
    },
    'ptbu3twm': {
      'en': 'KAFD\nAn Naseem                          ',
      'ar': 'مركز الملك عبدالله المالي\nالنسيم',
    },
    'dkfijddn': {
      'en': 'Green Line',
      'ar': 'الخط الأخضر',
    },
    'bgl2otfs': {
      'en': 'Ministry of Education\nNational Museum',
      'ar': 'وزارة التربية والتعليم\nالمتحف الوطني',
    },
    'byi29vco': {
      'en': 'Orange Line',
      'ar': 'الخط البرتقالي',
    },
    'vcdfe9j5': {
      'en': 'Jeddah Road   \nKhashm Al An                   ',
      'ar': 'طريق جدة\nخشم العان',
    },
    'pzp15edx': {
      'en': 'Yellow Line',
      'ar': 'الخط الأصفر',
    },
    'profn8mf': {
      'en': ' T1-2\nKAFD                                      ',
      'ar': 'T1-2\nKAFD',
    },
    'nvlvh6kb': {
      'en': 'Choose a metro line to view its stations ',
      'ar': 'اختر خط المترو لعرض محطاته',
    },
  },
  // blueLine
  {
    '38s2o8h3': {
      'en': 'Blue Line',
      'ar': 'الخط الأزرق',
    },
    'nj5twrgr': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // orangeLine
  {
    '0c3x97tg': {
      'en': 'orange Line',
      'ar': 'الخط البرتقالي',
    },
    '4jaai78u': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // RedLine
  {
    '0mm96llm': {
      'en': 'Red Line',
      'ar': 'الخط الأحمر',
    },
    't7u68lxq': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PurpleLine
  {
    'ezbmde1q': {
      'en': 'Purple Line',
      'ar': 'الخط البنفسجي',
    },
    'tm3oeyyt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // YellowLine
  {
    'g7byi1bl': {
      'en': 'Yellow Line',
      'ar': 'الخط الأصفر',
    },
    'mctplyti': {
      'en':
          'important: \nThis line intersects with Purple Line\n start from SABIC Station !',
      'ar': 'هام:\nيتقاطع هذا الخط مع الخط البنفسجي\nيبدأ من محطة سابك',
    },
    'w6qrrgiu': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // GreenLine
  {
    '1e5f9g0c': {
      'en': 'Green Line',
      'ar': 'الخط الأخضر',
    },
    'ercn06ol': {
      'en': 'important: \nThis line intersects with \nRed Line & Blue Line',
      'ar': 'هام:\nيتقاطع هذا الخط مع\nالخط الأحمر والخط الأزرق',
    },
    '1eomdsy2': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // route_and_Lines
  {
    'sm7un9hw': {
      'en': 'Metro Routes',
      'ar': 'مسارات  المترو',
    },
    '8154gjnr': {
      'en': 'Route Map',
      'ar': 'خريطة المسار',
    },
    'fvozvyjt': {
      'en':
          'View the complete metro route map with all stations and connections',
      'ar': 'اطلع على خريطة كاملة لمسارات المترو مع جميع المحطات ',
    },
    '1wu23ay9': {
      'en': 'View Map',
      'ar': 'عرض الخريطة',
    },
    '59auvc71': {
      'en': 'Line Routes',
      'ar': 'مسارات الخط',
    },
    '0lms0fpk': {
      'en': 'Explore individual metro lines and their specific stations',
      'ar': 'استكشف خطوط المترو الفردية ومحطاتها المحددة',
    },
    'kje2nowm': {
      'en': 'View Lines',
      'ar': 'مشاهدة الخطوط',
    },
  },
  // quaryCopy
  {
    'nk73dmnb': {
      'en': 'Passenger Queries',
      'ar': 'استفسارات الركاب',
    },
    'wmtjq4xa': {
      'en': 'Active Queries',
      'ar': 'الاستعلامات النشطة',
    },
    'pw4gia45': {
      'en': 'Pending responses: ',
      'ar': 'الردود المعلقة: 0',
    },
    'a0fl3hc1': {
      'en': 'Respond',
      'ar': '',
    },
  },
  // NoJourneys
  {
    'ixyegcy7': {
      'en': 'No journeys to display:(\n start your first journey now!',
      'ar': 'لا توجد رحلات لعرضها:)\nابدأ رحلتك الأولى الآن!',
    },
    'x8mzydiq': {
      'en': 'Purchase Ticket',
      'ar': 'شراء تذكرة',
    },
  },
  // Stats
  {
    'lybe9u9g': {
      'en': 'Query Statistics',
      'ar': '',
    },
    '449gfnjx': {
      'en': 'Last 7 Days',
      'ar': '',
    },
    'hhxnke5r': {
      'en': 'Total Queries',
      'ar': '',
    },
    '0kglccw1': {
      'en': '0',
      'ar': '',
    },
    'vem5hpjy': {
      'en': 'Resolved',
      'ar': '',
    },
    'ij6uglbv': {
      'en': 'Pending',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'h9hbiyaz': {
      'en': '',
      'ar': '',
    },
    'rmxaw2ws': {
      'en': '',
      'ar': '',
    },
    '34667uct': {
      'en': '',
      'ar': '',
    },
    'gf373bv9': {
      'en': '',
      'ar': '',
    },
    'gh00scnk': {
      'en': '',
      'ar': '',
    },
    'uw97ui69': {
      'en': '',
      'ar': '',
    },
    'jhsh1p21': {
      'en': '',
      'ar': '',
    },
    'woz9mrr3': {
      'en': '',
      'ar': '',
    },
    'bo1v3i5c': {
      'en': '',
      'ar': '',
    },
    't2kl79qm': {
      'en': '',
      'ar': '',
    },
    'gb0m036d': {
      'en': '',
      'ar': '',
    },
    'e6umv1pf': {
      'en': '',
      'ar': '',
    },
    'y2iv7bdq': {
      'en': '',
      'ar': '',
    },
    'j4h8uq3j': {
      'en': '',
      'ar': '',
    },
    'uav9xxuj': {
      'en': '',
      'ar': '',
    },
    '2noehiyf': {
      'en': '',
      'ar': '',
    },
    'erfxcar3': {
      'en': '',
      'ar': '',
    },
    'iwkfrnzn': {
      'en': '',
      'ar': '',
    },
    '202h4epz': {
      'en': '',
      'ar': '',
    },
    'wt2qrsqa': {
      'en': '',
      'ar': '',
    },
    '3b3wsshw': {
      'en': '',
      'ar': '',
    },
    '12b1e8pz': {
      'en': '',
      'ar': '',
    },
    'azmy9t3t': {
      'en': '',
      'ar': '',
    },
    'ia16dbz9': {
      'en': '',
      'ar': '',
    },
    'm6wnixs3': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
