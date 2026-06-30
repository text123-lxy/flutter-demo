# Flutter‑Demo
## 技术栈
Flutter + flutter_riverpod + AutoRoute + build_runner

## 功能需求
1. 加减按钮实现卡片新增、删除，最少保留1张卡片
2. 每张卡片携带唯一ID，点击跳转到详情页
3. 详情页根据ID展示对应图片与标题，可返回首页
4. Web端增加鼠标悬浮动画，布局自适应浏览器窗口

## 目录分层规范
- lib/main.dart：全局入口，配置路由与Riverpod根容器
- lib/app_router.dart：统一路由配置
- lib/providers：Riverpod全局状态、CardItem实体类
- lib/pages：页面视图（首页/详情页）
- lib/widgets：封装公共组件（自适应网格）

## 启动命令
```bash
# 安装依赖
flutter pub get

# 生成路由、状态代码
dart run build_runner clean
dart run build_runner watch --delete-conflicting-outputs

# 启动网页端
flutter run -d chrome
