import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_giftcard_app/models/card_model.dart';
part 'card_repository.g.dart';



@riverpod
CardRepository cardRepository(CardRepositoryRef ref) => CardRepository();

class CardRepository {
  Future<List<CardModel>> getAllCards() async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return CardModel.sampleCards;
    });
  }

  Future<CardModel> getCard(int id) async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return CardModel.sampleCards.where((el) => el.id == id).first;
    });
  }
}
