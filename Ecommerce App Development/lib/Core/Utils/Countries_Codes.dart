// ignore_for_file: file_names

class Country {
  final String code;
  final String flag;
  final String countryName;

  const Country({required this.code, required this.countryName, required this.flag});
}

const List<Country> countries = [
  Country(code: '+61', countryName: 'Australia', flag: '🇦🇺'),
  Country(code: '+43', countryName: 'Austria', flag: '🇦🇹'),
  Country(code: '+32', countryName: 'Belgium', flag: '🇧🇪'),
  Country(code: '+55', countryName: 'Brazil', flag: '🇧🇷'),
  Country(code: '+86', countryName: 'China', flag: '🇨🇳'),
  Country(code: '+357', countryName: 'Cyprus', flag: '🇨🇾'),
  Country(code: '+45', countryName: 'Denmark', flag: '🇩🇰'),
  Country(code: '+2', countryName: 'Egypt', flag: '🇪🇬'),
  Country(code: '+372', countryName: 'Estonia', flag: '🇪🇪'),
  Country(code: '+33', countryName: 'France', flag: '🇫🇷'),
  Country(code: '+49', countryName: 'Germany', flag: '🇩🇪'),
  Country(code: '+30', countryName: 'Greece', flag: '🇬🇷'),
  Country(code: '+36', countryName: 'Hungary', flag: '🇭🇺'),
  Country(code: '+354', countryName: 'Iceland', flag: '🇮🇸'),
  Country(code: '+91', countryName: 'India', flag: '🇮🇳'),
  Country(code: '+62', countryName: 'Indonesia', flag: '🇮🇩'),
  Country(code: '+353', countryName: 'Ireland', flag: '🇮🇪'),
  Country(code: '+81', countryName: 'Japan', flag: '🇯🇵'),
  Country(code: '+60', countryName: 'Malaysia', flag: '🇲🇾'),
  Country(code: '+52', countryName: 'Mexico', flag: '🇲🇽'),
  Country(code: '+31', countryName: 'Netherlands', flag: '🇳🇱'),
  Country(code: '+47', countryName: 'Norway', flag: '🇳🇴'),
  Country(code: '+92', countryName: 'Pakistan', flag: '🇵🇰'),
  Country(code: '+48', countryName: 'Poland', flag: '🇵🇱'),
  Country(code: '+351', countryName: 'Portugal', flag: '🇵🇹'),
  Country(code: '+7', countryName: 'Russia', flag: '🇷🇺'),
  Country(code: '+966', countryName: 'Saudi Arabia', flag: '🇸🇦'),
  Country(code: '+65', countryName: 'Singapore', flag: '🇸🇬'),
  Country(code: '+27', countryName: 'South Africa', flag: '🇿🇦'),
  Country(code: '+82', countryName: 'South Korea', flag: '🇰🇷'),
  Country(code: '+34', countryName: 'Spain', flag: '🇪🇸'),
  Country(code: '+46', countryName: 'Sweden', flag: '🇸🇪'),
  Country(code: '+41', countryName: 'Switzerland', flag: '🇨🇭'),
  Country(code: '+886', countryName: 'Taiwan', flag: '🇹🇼'),
  Country(code: '+66', countryName: 'Thailand', flag: '🇹🇭'),
  Country(code: '+90', countryName: 'Turkey', flag: '🇹🇷'),
  Country(code: '+1', countryName: 'United States', flag: '🇺🇸'),
  Country(code: '+44', countryName: 'United Kingdom', flag: '🇬🇧'),
  Country(code: '+998', countryName: 'Uzbekistan', flag: '🇺🇿'),
  Country(code: '+84', countryName: 'Vietnam', flag: '🇻🇳'),
];
