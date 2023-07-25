import 'package:flutter/material.dart';

extension TranSourceName on TranSource {
  String get sourceName {
    switch (this) {
      case TranSource.rbc:
        return 'Royal Bank of Cnada';
      case TranSource.cibc:
        return 'CIBC';
      case TranSource.coins:
        return 'Coins';
    }
  }
}
