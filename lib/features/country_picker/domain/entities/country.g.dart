// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      code: json['code'] as String,
      decimalDigits: json['decimalDigits'] as int?,
      decimalSeparator: json['decimalSeparator'] as String,
      name: json['name'] as String,
      namePlural: json['namePlural'] as String,
      number: json['number'] as int,
      pattern: json['pattern'] as String,
      spaceBetweenAmountAndSymbol: json['spaceBetweenAmountAndSymbol'] as bool,
      symbol: json['symbol'] as String,
      symbolOnLeft: json['symbolOnLeft'] as bool,
      thousandsSeparator: json['thousandsSeparator'] as String,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'code': instance.code,
      'decimalDigits': instance.decimalDigits,
      'decimalSeparator': instance.decimalSeparator,
      'name': instance.name,
      'namePlural': instance.namePlural,
      'number': instance.number,
      'pattern': instance.pattern,
      'spaceBetweenAmountAndSymbol': instance.spaceBetweenAmountAndSymbol,
      'symbol': instance.symbol,
      'symbolOnLeft': instance.symbolOnLeft,
      'thousandsSeparator': instance.thousandsSeparator,
    };
