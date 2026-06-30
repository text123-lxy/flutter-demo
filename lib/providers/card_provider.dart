import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_provider.g.dart';

/// 卡片实体
class CardItem {
  final int id;
  final String title;

  CardItem({required this.id, required this.title});
}

/// 卡片列表状态
@Riverpod(keepAlive: true)
class CardList extends _$CardList {
  @override
  List<CardItem> build() {
    // 初始化5张卡片
    return List.generate(5, (index) => CardItem(id: index, title: '卡片${index + 1}'));
  }

  // 添加卡片
  void addCard() {
    final newId = state.last.id + 1;
    state = [...state, CardItem(id: newId, title: '卡片${newId + 1}')];
  }

  // 删除最后一张卡片（最少保留1张）
  void removeCard() {
    if (state.length <= 1) return;
    state = state.sublist(0, state.length - 1);
  }
}