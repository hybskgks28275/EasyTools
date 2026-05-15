# EasyTools

Git や Python などの Windows ツール環境を構築します。

この fork では Anima Base v1.0 向けの EasyAnima を主用途にして、不要な補助ツールを整理しています。

## 謝辞と問い合わせについて

この fork は [Zuntan03/EasyTools](https://github.com/Zuntan03/EasyTools) を元にしています。元リポジトリを公開・保守されている zuntan 氏に感謝します。

この `AnimaBase` ブランチおよび Anima Base v1.0 向けの変更は hybskgks28275 が開発・保守しています。この fork 版に関する質問、不具合報告、要望を zuntan 氏へ問い合わせないでください。

## 残している主な機能

- `Git`
- `Python`
- `ComfyUi`
- `Download`
- `Mosaic`
- `Civitai`
  - Civitai 関連は `Civitai/` 配下の bat を使用します。
  - `Download/` 配下の Civitai 旧 bat は削除しました。
- `Bat`
- `Link`
- `EnableLongPaths.bat`

## 既定バージョン

- Python 3.13 系
- PyTorch 2.11.0+cu130
- triton-windows 3.6 系
- SageAttention 2.2.0 Windows ABI3 wheel

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
