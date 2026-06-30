import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app_router.dart' show DetailRoute;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/card_provider.dart';
import '../../widgets/custom_wrap_grid.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  // 卡片固定宽度
  static const double cardWidth = 160;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 获取卡片状态
    final cardList = ref.watch(cardListProvider);
    final cardNotifier = ref.read(cardListProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 加减按钮区域
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: cardNotifier.addCard,
                    child: const Text('加号按钮'),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: cardNotifier.removeCard,
                    child: const Text('减号按钮'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                  child: SingleChildScrollView(
                    child: CustomWrapGrid(
                      itemWidth: cardWidth,
                      children: cardList
                          .map(
                            (item) => InkWell(
                              onTap: () {
                                // 跳转详情页，传递卡片数据
                                context.pushRoute(DetailRoute(itemId: item.id));
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  color:Colors.red[100],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(item.title),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}