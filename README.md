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

## Rubyのバージョン

## データベース設定

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

## 設定

## テストスイートの実行方法

## サービス（ジョブキュー、キャッシュサーバー、検索エンジンなど）

## デプロイ手順

## 要件定義

### 機能要件

- **ユーザー登録・認証**
  - ユーザーはアカウントを作成し、ログイン・ログアウトできる。
  - ユーザーはパスワードをリセットできる。

- **日々の記録**
  - ユーザーは毎日、自分の体調や気分を記録できる。
  - 記録は以下の項目を含む:
    - 日付: 記録の日付（自動的に今日の日付が設定されるが、変更可能）
    - 体調不良の有無: ユーザーが作成した選択形式の項目（複数選択可能）
    - 体調の点数: 1から10までのスケールで体調を評価
    - 気分の点数: 1から10までのスケールで気分を評価
    - メモ: 自由記述欄（任意）

- **カスタム項目の作成**
  - ユーザーは自分でカスタム項目を作成できる。
  - カスタム項目は選択形式（例: 頭痛、腹痛など）や数値形式（例: 体調の点数）などがある。

- **記録の閲覧・編集・削除**
  - ユーザーは過去の記録を一覧表示できる。
  - ユーザーは特定の日付の記録を詳細表示できる。
  - ユーザーは過去の記録を編集・削除できる。

- **データの可視化**
  - ユーザーは体調や気分の点数をグラフで可視化できる。

### 非機能要件

- **セキュリティ**
  - ユーザーのパスワードはハッシュ化して保存する。
  - ユーザーのデータは認証されたユーザーのみがアクセスできる。

- **パフォーマンス**
  - アプリケーションはスムーズに動作し、ユーザーが快適に使用できる。

- **スケーラビリティ**
  - 将来的に機能追加が容易にできるように設計する。

## データベース設計

### テーブル: Users

| カラム名        | データ型   | 説明                     |
|-----------------|------------|--------------------------|
| id              | integer    | 主キー                   |
| email           | string     | ユーザーのメールアドレス |
| password_digest | string     | ハッシュ化されたパスワード|
| created_at      | datetime   | 作成日時                 |
| updated_at      | datetime   | 更新日時                 |

### テーブル: Records

| カラム名        | データ型   | 説明                     |
|-----------------|------------|--------------------------|
| id              | integer    | 主キー                   |
| user_id         | integer    | 外部キー（Users テーブルの id）|
| date            | date       | 記録の日付               |
| health_score    | integer    | 体調の点数               |
| mood_score      | integer    | 気分の点数               |
| memo            | text       | メモ                     |
| created_at      | datetime   | 作成日時                 |
| updated_at      | datetime   | 更新日時                 |

### テーブル: CustomFields

| カラム名        | データ型   | 説明                     |
|-----------------|------------|--------------------------|
| id              | integer    | 主キー                   |
| user_id         | integer    | 外部キー（Users テーブルの id）|
| name            | string     | カスタム項目の名前       |
| field_type      | string     | 項目のタイプ（選択形式、数値形式など）|
| created_at      | datetime   | 作成日時                 |
| updated_at      | datetime   | 更新日時                 |

### テーブル: RecordCustomFields

| カラム名        | データ型   | 説明                     |
|-----------------|------------|--------------------------|
| id              | integer    | 主キー                   |
| record_id       | integer    | 外部キー（Records テーブルの id）|
| custom_field_id | integer    | 外部キー（CustomFields テーブルの id）|
| value           | string     | カスタム項目の値         |
| created_at      | datetime   | 作成日時                 |
| updated_at      | datetime   | 更新日時                 |

## 実装手順

1. Rails プロジェクトの作成
2. ユーザー認証の実装（Devise などの認証ライブラリを使用）
3. Record モデルの作成
4. マイグレーションファイルの作成と実行
5. CustomField モデルの作成
6. マイグレーションファイルの作成と実行
7. RecordCustomField モデルの作成
8. マイグレーションファイルの作成と実行
9. コントローラーとビューの作成
10. 記録の作成、閲覧、編集、削除機能の実装
11. カスタム項目の作成、編集、削除機能の実装
12. データの可視化（Chart.js などのライブラリを使用してグラフを表示）
13. テストの実装（RSpec などを使用して単体テスト、統合テストを実装）