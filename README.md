# README

* Rubyのバージョン

* データベース設定

  データベース接続の設定:

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


