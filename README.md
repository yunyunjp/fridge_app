# README

| 項目                 | 内容                                                         |
| -------------------- | ------------------------------------------------------------ |
| アプリケーション名   | FRiGE                                                        |
| アプリケーション概要 | 冷蔵庫の中身の食材を登録し、賞味期限を可視化し管理できます。 |
| URL                  | https://fridge-app-35190.herokuapp.com/                      |
| テスト用アカウント   | メールアドレス:fridge@fridge.com <br> パスワード:123456      |
| 利用方法             | ①スーパー等で購入した食材の写真や賞味期限等を登録します。<br>②賞味期限がわからない食材は一覧ページから保存期間を目 安に登録します<br>③フリッジページで賞味期限の残り日数を確認できます|
| 目指した課題解決     |                                                              |
| 実装予定の機能       |                                                              |
| ローカルでの動作方法 |                                                              |

## 洗い出した要件

## 実装した機能についての画像やGIFおよびその説明

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