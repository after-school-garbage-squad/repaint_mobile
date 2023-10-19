# Re:paint Mobile

このREADMEは、一部Copilotを利用しています。

## セットアップ

### Android Studioのインストール

JetBrains Toolboxを利用してインストールしてください。(個人的に推奨)

https://www.jetbrains.com/ja-jp/toolbox-app/

```shell
yay -S jetbrains-toolbox
```

### Android Studioのプラグインのインストール

- [Conventional Commit](https://plugins.jetbrains.com/plugin/13389-conventional-commit) (参照: [コミットメッセージ](#コミットメッセージ))
- [Dart](https://plugins.jetbrains.com/plugin/6351-dart)
- [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter)

### Flutterのインストール

#### macOS

```shell
brew install flutter
```

#### ArchLinux

```shell
yay -S flutter
```

### Flutter Doctorの実行

下記のコマンドを実行した際に、`No issues found!`と表示されないようになればOKです。

```shell
flutter doctor -v
```

### プロジェクトのセットアップ

ターミナルで下記のコマンドを実行するか、Android Studioでリポジトリをクローンしてください。

```shell
git clone https://github.com/after-school-garbage-squad/repaint_mobile.git
cd repaint_mobile
```

プロジェクトを開いたら、ターミナルで下記のコマンドを実行するか、Android Studioの右下に表示される`Get dependencies`をクリックしてください。

```shell
flutter pub get
```

## 構成

### 開発環境

2023/08/10時点でのバージョン
- Flutter v3.10.6
- Dart v3.0.6
- DevTools v2.23.1

**AURやHomebrewなどを利用して、これ以降の最新バージョンを利用するようにしてください。**

### ライブラリ

現在利用しているライブラリは以下の通りです。

| 用途     | ライブラリ                                                     |
|--------|-----------------------------------------------------------|
| ルーティング | [auto_route](https://pub.dev/packages/auto_route)         |

### ビルド

#### Android

```shell
flutter build apk --target-platform=android-arm64 --obfuscate --split-debug-info=build/obfuscate/android --split-per-abi
```

#### iOS

```shell
flutter build ios --obfuscate --split-debug-info=build/obfuscate/ios
```

## 貢献

### ルーティング

[app_router.dart](./lib/config/app_router.dart)の編集やWidgetの引数を変更したときなどは、以下のコマンドを実行してください。
Android Studioであれば、ツールバーでコンフィグを選択してから実行してください。

一回のみ実行する場合

```shell
dart run build_runner build
```

変更時に自動で実行する場合

```shell
dart run build_runner watch
```

### デバッグ

#### ウェブ上でのデバッグ

ウェブ上でデバッグができるようにしています。
ウェブ用のコードはデバッグのみに利用され、本番環境では利用しません。

```shell
flutter run -d chrome
```

### コードスタイル

[analysis_options.yaml](./analysis_options.yaml)に記載しているコードスタイルに従ってください。
なお、デフォルトのコードスタイルとは異なります。

```diff
-include: package:flutter_lints/flutter.yaml
+# include: package:flutter_lints/flutter.yaml
+include: package:lint/strict.yaml
```

その他、CRLFではなくLFを利用してください。

#### format

Reference: https://dart.dev/tools/dart-format

```shell
dart format .
```

#### analyze

Reference: https://dart.dev/tools/dart-analyze

```shell
dart analyze
```

#### fix

Reference: https://dart.dev/tools/dart-fix

```shell
dart fix --apply
```

### ブランチ

- 詳しくはgit-flowモデルを参照してください。
  - mainブランチは、プロダクションリリース用のブランチです。
  - developブランチは、開発用のブランチです。
  - featureブランチは、機能追加用のブランチです。
  - releaseブランチは、リリース準備用のブランチです。
  - hotfixブランチは、緊急のバグ修正用のブランチです。
- main, developブランチの保護ルールについて
  - Require a pull request before merging. 有効化済み (直接pushはできません)
    - Required number of approvals before merging: 1 (1人以上のレビューが必要です)
  - Require signed commits. 有効化済み (署名済みのコミットが必要です)
- developブランチからfeature/xxxのようにブランチを切って、作業を行ってください。
- 作業が完了したら、developブランチに向けてPull Requestを作成してください。
- プロダクションリリース時には、developブランチからmainブランチに向けてPull Requestを作成してください。
- (今後導入予定) ~~CI/CDが実行され、問題がなければ自動でデプロイされます。~~

### コミットメッセージ

#### Conventional Commit

下記のプラグインを導入して、[Conventional Commits](https://www.conventionalcommits.org/)のフォーマットに従うようにしてください。

https://plugins.jetbrains.com/plugin/13389-conventional-commit

### CI/CD

現時点では、何も導入していません。
