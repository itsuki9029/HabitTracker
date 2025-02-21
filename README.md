# ハビトラ (Habit Tracker)
<img width="500" src="app/assets/images/ogp.png"><br>
<br>

# 目次
- [サービス概要](#-サービス概要)
- [サービスの背景と目的](#-サービスの背景と目的)
- [サービスURL](#-サービスurl)
- [ユーザー層](#-ユーザー層)
- [機能紹介](#-機能紹介)
- [技術構成について](#-技術構成について)
  - [使用技術](#使用技術)
  - [ER図](#er図)
  - [画面遷移図](#画面遷移図)<br>
<br>

## 📝 サービス概要
**ハビトラ**は、日々の習慣を管理し、フォロワーと共にモチベーションを維持しながら目標達成を目指す習慣管理アプリです。

## 🎯 サービスの背景と目的
習慣は、誰にとっても日常の一部です。例えば、朝の歯磨きやコーヒーを飲むこと、寝る前のトイレなどが挙げられます。このような行動は、毎日繰り返すことで苦痛なく実施できるようになります。

しかし、運動や勉強などの新しい習慣を取り入れる際には、モチベーションの維持が難しく、途中で挫折してしまうことも少なくありません。

**ハビトラ**では、フォロワー同士が励まし合いながら習慣化を目指せるプラットフォームを提供し、継続的な習慣形成をサポートします。

## 🌏 サービスURL
### https://www.habit-tracker9029.com/

## 🏆 ユーザー層
年齢や性別を問わず利用できますが、特に以下のような人々に最適です。

- **社会人**: 資格学習や運動の時間を確保しづらい方
- **学生**: 定期試験や受験勉強の習慣をつけたい方
- **健康志向の方**: 毎日の運動や食事管理を続けたい方

## 🔥 機能紹介

| ユーザー登録 / ログイン |
| :---: | 
| ![ユーザー登録](https://i.gyazo.com/sample.gif) |
| <p align="left">『名前』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。LINEアカウントでのログインも可能です。</p> |

| 習慣登録 / リマインダー通知 |
| :---: | 
| ![習慣登録](https://i.gyazo.com/sample.gif) |
| <p align="left">習慣を登録し、LINE通知でリマインドを受け取ることができます。曜日・時間を指定可能です。</p> |

| 習慣の記録と進捗確認 |
| :---: | 
| ![進捗確認](https://i.gyazo.com/sample.gif) |
| <p align="left">達成した習慣をカレンダー上で確認し、モチベーションを維持できます。</p> |

| AIアシスタントによる励ましメッセージ |
| :---: | 
| ![励ましメッセージ](https://i.gyazo.com/sample.gif) |
| <p align="left">OpenAI APIを活用し、習慣の進捗に応じた励ましの言葉を生成します。</p> |

| フォロー機能 |
| :---: | 
| ![フォロー機能](https://i.gyazo.com/sample.gif) |
| <p align="left">友人や家族をフォローし合うことで習慣の達成状況を共有し、フォロワー同士で励まし合うことができます。</p> |

## 🛠 技術構成について

### 使用技術
| カテゴリ | 技術内容 |
| --- | --- | 
| サーバーサイド | Ruby on Rails 7.0.8・Ruby 3.2.0 |
| フロントエンド | JavaScript |
| CSSフレームワーク | Bootstrap 5 |
| Web API | OpenAI API・LINE API |
| データベース | PostgreSQL |
| ファイルサーバー | AWS S3 |
| インフラ | Render |
| バージョン管理 | GitHub |

### 📊 ER図
![ER図](https://drive.google.com/file/d/18tD25nOb3nr8e5EyhVH8cbCcW-d1vy8-/view?usp=sharing)

### 📌 画面遷移図
https://www.figma.com/design/R9c6mabrSvuLxq3VAYcJ7m/Untitled?node-id=0-1&t=h9z3J0CHzvqJk79f-1
