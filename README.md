# 概要

- postgresql を docker コンテナ内で動かすためのプロジェクト

## 前提

- `script` 配下に初期設定用の `sql` を配置
  - DB 作成
  - スキーマ作成
  - ロール作成
  - 権限の追加
  - テーブルの作成
  - テストデータの追加
- 本番用・開発用ともに、名前付きボリュームを指定して使用する
- 本番用と開発用で `docker-compose.yml` のファイルを分ける
  |用途|ファイル|備考|
  |:---:|:---:|:---:|
  |本番用| `docker-compose.yml` | `db-store` という名前付きボリュームを使う |
  |開発用| `docker-compose.dev.yml` | `db-store-dev` という名前付きボリュームを使う |

## コマンド

### 開発

```shell
# コマンド
docker compsoe -f docker-compose.dev.yml up -d

# 起動・終了スクリプト
sh bin/dev.sh

# イメージ・ボリュームの削除も含めた起動・終了スクリプト
sh bin/dev_rebuild.sh
```

### 本番

```shell
# コマンド
docker compsoe up -d

# 起動・終了スクリプト
sh bin/prod.sh

# イメージ・ボリュームの削除も含めた起動・終了スクリプト
sh bin/prod_rebuild.sh
```

### 注意点

- イメージ削除、キャッシュ削除はこまめにする
  - `docker image rm イメージ名`
  - `docker builder prune`

## 参考

- [【Docker】postgresqlの構築](https://zenn.dev/re24_1986/articles/b76c3fd8f76aec)
