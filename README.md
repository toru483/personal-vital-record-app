# Personal Vital Record App (vital-check)

日々のバイタルデータ（体重、血糖値、血圧）を記録・管理するための個人用Ruby on Railsアプリケーションです。

## 📋 記録項目
- 記録日時 (`recorded_at`)
- 体重 (`weight`)
- 血糖値 (`blood_sugar`)
- 最高血圧 / 最低血圧 (`systolic_pressure` / `diastolic_pressure`)
- メモ (`memo`)

## 🛠️ 開発環境 / 技術スタック
- **Language**: Ruby 4.0.0
- **Framework**: Ruby on Rails 8.1.3
- **Database**: SQLite3
- **Environment**: VSCode Dev Containers

## 🚀 起動方法

リポジトリをクローンした後、アプリフォルダに移動して以下のコマンドを実行してください。

```bash
# アプリケーションディレクトリに移動
cd vital-check

# 依存Gemのインストール
bundle install

# データベースの作成およびマイグレーション
rails db:create
rails db:migrate

# Railsサーバーの起動
rails s -b 0.0.0.0
```

サーバー起動後、ブラウザで以下にアクセスしてください。
👉 [http://localhost:3000/vital_records](http://localhost:3000/vital_records)

## 📝 ライセンス
個人利用目的の開発プロジェクトです。
