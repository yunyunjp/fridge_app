# README
[![Image from Gyazo](https://i.gyazo.com/4debdbda52dfca5b1116019637bc18ea.png)](https://gyazo.com/4debdbda52dfca5b1116019637bc18ea)

| 項目                 | 内容                                                         |
| -------------------- | ------------------------------------------------------------ |
| アプリケーション名   | FRiGE                                                        |
| アプリケーション概要 | 冷蔵庫に入れる食材を登録し、賞味期限を可視化し管理できます。 |
| URL                  | https://fridge-app-35190.herokuapp.com/                      |
| テスト用アカウント   | メールアドレス: fridge@fridge.com <br> パスワード: 123456    |
| 利用方法             | ①スーパー等で購入した食材の写真や賞味期限等を登録します。<br>②賞味期限がわからない食材は一覧から保存期間を目安に登録します。<br>③マイフリッジページで賞味期限の残り日数を確認できます。<br>④Twitterでマイフリッジを共有できます。 |
| 目指した課題解決     | ■普段あまり自炊をしない人が賞味期限を把握・管理しやすいようにします。<br>■自分の冷蔵の中身を公開して献立や料理についての対話をしやすい環境を作ります。 |
| 実装予定の機能       | 賞味期限切れの通知機能                                       |

***
## 使用技術(開発環境)

フロントエンド
- HTML, CSS, Javascript

バックエンド
-  Ruby 2.6.5, Ruby on Rails 6.0.0

テスト
- RSpec, Rubocop

データベース
- MySQL/Sequel Pro

インフラ
- Heroku, AWS S3, Docker/Docker-compose, CircleCI

ソース管理
- Git/GitHub

エディタ
- VScode

***

## 要件定義

| 機能         | 詳細                                                        | ユースケース                                                     |
| ------------ | ---------------------------------------------------------- | ----------------------------------------------------------------- |
| 保存機能     | ユーザーがアイテムを登録できる                             | 食材等の購入日、数量、メモの情報を入力できる                      |
| 表示機能     | アイテム、賞味期限を一覧で確認できる                       | 食材等の賞味期限の残り日数が一覧で確認できる                      |
| 目安機能     | 賞味期限の表示がない食材について保存期間の目安を確認できる | 野菜・果物・きのこ類の保存期間の目安を検索できる                  |
| 並び替え機能 | 賞味期限の昇順、降順に並び替えできる                       | 賞味期限切れを未然に防ぐことができる                              |
| シェア機能   | 自分のフリッジをTwitter上でシェアできる                    | 料理の献立の話題などコミュニケーションができる                    |
| SNS認証      | Googleアカウントを利用したログイン方法を選択できる         | SNSアカウントを選択した場合、既にパスワードが入力された状態で表示される |


# DEMO(実装した機能についての画像やGIFおよびその説明)

#### 新規登録画面
![新規登録画面](https://user-images.githubusercontent.com/78527774/117276440-df07ed00-ae99-11eb-9913-f42f8f3cb36a.png)
- ユーザーアカウントの登録方法は「手打ち入力」「Googleアカウント利用」の２つから選べる
***
#### 保存画面
![保存画面](https://user-images.githubusercontent.com/78527774/117277401-d1069c00-ae9a-11eb-8adf-53bca6b0aeb4.png)
- 名前、数量、購入日、賞味期限、メモ(任意)、画像を登録できる
***
#### ホーム画面(トップページ)
![トップページ](https://user-images.githubusercontent.com/78527774/123099231-f6f8f780-d46c-11eb-8a71-53efaaa9a63c.png)
- 利用者の全アイテム表示、名称、賞味期限、残り日数の確認(賞味期限切れのアイテムは赤色から紫色に表示が変わる)
***
#### 並び替え機能、検索機能
https://user-images.githubusercontent.com/78527774/123210523-10e21b00-d4fd-11eb-8b74-514bcdebac53.mp4
- 賞味期限の新しい順、古い順に並び替えすることができる
- アイテムの名前で検索することができる
***
#### 詳細表示・編集・削除
![詳細画面](https://user-images.githubusercontent.com/78527774/123099156-e183cd80-d46c-11eb-97ab-9b3e56c287ae.png)
- 詳細画面表示、アイテムの編集、削除ができる
***
#### ユーザーフリッジ画面へ遷移
![ユーザーフリッジ画面](https://user-images.githubusercontent.com/78527774/123100089-c06fac80-d46d-11eb-946d-26d1524b1e3f.png)
- 右下のニックネームのボタンから各ユーザーページに遷移できる
***
#### メニューボタンからできること
https://user-images.githubusercontent.com/78527774/123210476-032c9580-d4fd-11eb-804a-6200896b8343.mp4
- ホーム画面遷移
- マイフリッジ画面遷移
- 賞味期限目安一覧画面遷移
- ログアウト
***
#### マイフリッジ画面
![マイフリッジ画面](https://user-images.githubusercontent.com/78527774/123100034-b5b51780-d46d-11eb-8502-2423a755dfc1.png)
- マイフリッジをTwitter上でシェアできる
***
#### 賞味期限目安一覧画面
https://user-images.githubusercontent.com/78527774/117281248-6b1c1380-ae9e-11eb-8419-31a16da8163c.mp4
- スーパーで購入できる主な野菜、果物、きのこ類の目安となる保存期間(冷凍保存の場合も)と詳細を一覧表示
- 品目、カテゴリー別、保存期間ごとに検索可能
- テーブルについて品目、期間ごとに昇順、降順の並び替え可能
***
#### レスポンシブデザイン対応
https://user-images.githubusercontent.com/78527774/123211265-2ad02d80-d4fe-11eb-83f8-7644081c8f6a.mp4

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
