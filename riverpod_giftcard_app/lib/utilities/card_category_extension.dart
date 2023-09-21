
import 'package:riverpod_giftcard_app/models/card_model.dart';

extension CategoryExtension on CardCategory {
  String capitalName() => name[0].toUpperCase() + name.substring(1,name.length).toLowerCase();
}