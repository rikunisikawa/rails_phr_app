# README

以下のコマンドを使用して、Railsアプリケーションを新規作成し、データベースを設定します:

```sh
docker compose run --rm web rails new . --force --no-deps --database=mysql
```
このコマンドは、新しいRailsアプリケーションを作成します。`--force`オプションは既存のファイルを上書きし、`--no-deps`オプションは依存関係をインストールしません。`--database=mysql`オプションはMySQLデータベースを使用することを指定します。

```sh
docker compose build
```
このコマンドは、Dockerイメージをビルドします。

```sh
docker compose exec web rake db:create
```
このコマンドは、データベースを作成します。


* Rubyのバージョン

* データベース設定

  データベース接続の設定は以下の通りです:

  ```yaml
  default: &default
    adapter: mysql2
    encoding: utf8mb4
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: root
    password: rails_phr
    host: db
  ```

  - `adapter`: 使用するデータベースアダプタ（ここではMySQLを使用）
  - `encoding`: データベースの文字エンコーディング
  - `pool`: データベース接続プールのサイズ
  - `username`: データベースのユーザー名
  - `password`: データベースのパスワード
  - `host`: データベースサーバーのホスト名

* 設定

* テストスイートの実行方法

* サービス（ジョブキュー、キャッシュサーバー、検索エンジンなど）

* デプロイ手順


