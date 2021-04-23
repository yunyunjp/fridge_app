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

## categries テーブル

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