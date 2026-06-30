import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo/providers/card_provider.dart';

@RoutePage()
class DetailPage extends ConsumerWidget {
  final int itemId;
  const DetailPage({super.key, @pathParam required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 通过id从全局状态取出完整卡片对象
    final cardList = ref.watch(cardListProvider);
    final CardItem? item = cardList.where((e) => e.id == itemId).firstOrNull;
    // 兜底空判断
    if (item == null) {
      return Scaffold(body: Center(child: Text("卡片不存在")));
    }
    return Scaffold(
      appBar: AppBar(title: Text('${item.title} 详情页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '当前卡片ID：${item.id}',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text('这是卡片${item.id+1}的页面，点击左上角返回到首页'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: context.maybePop,
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}