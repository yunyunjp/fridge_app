# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| quantity        | integer    |                                |
| purchase_date   | date       | null: false                    |
| expiration_date | date       | null: false                    |
| memo            | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user