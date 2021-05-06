# README

| 項目                 | 内容                                                         |
| -------------------- | ------------------------------------------------------------ |
| アプリケーション名   | FRiGE                                                        |
| アプリケーション概要 | 冷蔵庫に入れる食材を登録し、賞味期限を可視化し管理できます。 |
| URL                  | https://fridge-app-35190.herokuapp.com/                      |
| テスト用アカウント   | メールアドレス: fridge@fridge.com <br> パスワード: 123456    |
| 利用方法             | ①スーパー等で購入した食材の写真や賞味期限等を登録します。<br>②賞味期限がわからない食材は一覧から保存期間を目安に登録します。<br>③マイフリッジページで賞味期限の残り日数を確認できます。<br>④Twitterでマイフリッジを共有できます。 |
| 目指した課題解決     | ①普段あまり自炊をしない人が賞味期限を把握・管理しやすいようにします。 <br>②自分の冷蔵の中身を公開して献立や料理についての対話をしやすい環境を作ります。 |
| 実装予定の機能       | Javascriptでの賞味期限切れの通知機能                         |
| ローカルでの動作方法 |                                                              |

***
## 使用技術(開発環境)

フロントエンド
- HTML, CSS, Javascript

バックエンド
-  Ruby 2.6.5, Ruby on Rails 6.0.0

テスト
- RSpec

データベース
- MySQL/Sequel Pro

インフラ
- Heroku, AWS S3

ソース管理
- GitHub

エディタ
- VScode


## 要件定義

| 機能         | 目的 |詳細   | ストーリー(ユースケース)     |
| ------------ | ------ | ----------- | ----- |
| 保存機能     |  |  |
| 表示機能     |  |  |
| 目安機能     |  |  |
| シェア機能   |  |  |
| 並び替え機能 |  |  |
| SNS認証      |  |  |


# DEMO(実装した機能についての画像やGIFおよびその説明)


# データベース設計
![ER](https://user-images.githubusercontent.com/78527774/117104660-82cc9c80-adb7-11eb-8bad-88ebee1de9c4.png)

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items
- has_many :sns_credentials

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| quantity        | integer    | null: false                    |
| purchase_date   | date       | null: false                    |
| expiration_date | date       | null: false                    |
| memo            | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## sns_credentials テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| provider | string     |                                |
| uid      | string     |                                |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :products

## products テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| shelf_life  | integer    | null: false                    |
| frozen_life | integer    | null: false                    |
| info        | string     |                                |
| category    | references | null: false, foreign_key: true |

### Association

- belongs_to :category