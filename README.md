■サービス名
ハビトラ ~Habit Tracker~

■サービス概要
ハビトラは日々の習慣を管理し
フォロワーと共にモチベーションを維持しつつ
目標達成を目指すことができる習慣管理アプリです。

■ このサービスへの思い・作りたい理由
習慣というのはよく考えてみれば、誰にでもあることだと思います
例えば朝起きたら歯を磨いたりコーヒーを飲んだり、寝る前にトイレに行くなど
生活の中に習慣が当たり前なこととして存在しています。
このように毎日当たり前のようにやることで人はそれを苦痛とは感じず
やり続けることが可能になります。
私はこのことに気づいてから、自らの生活の中にジョギングや読書、学習の時間を作り
それらを習慣化させたことで今では苦痛を感じることなく実施できています。
しかし、人にはモチベーションというものがあるので習慣化する前に挫折してしまう
いわゆる三日坊主になってしまう人もいます。
なので、フォロワー同士がコメントし励まし合いながら習慣化を目指すことで
モチベーションを維持しつつ目標を達成できるサービスを考えました。
ハビトラ ~Habit Tracker~では、日々の習慣に運動や勉強などを取り入れたい人が家族や友人、職場の仲間と共に夢の実現を可能にできるようなプラットフォームにしていきたいと考えています。

■ ユーザー層について
年齢や性別は関係なく利用できますが
特に社会人は1日の自由時間が少なく
なかなか資格学習や運動の時間を作りにくいと思いますし、時間があってもSNSやyoutubeなどで時間を浪費してしまいます。

■サービスの利用イメージ
このサービスでは明確に習慣化させたいことを決めてもらい
それを達成することで達成感を得られるだけではなく、コメント機能を利用し仲間と励まし合うことで
モチベーションを維持できます。
例えば、習慣作成でジョギングを登録する場合
習慣名であるジョギング、そして1日の目標になる実施時間を設定してもらいます。(例: 30分など)
必要であれば、設定した時刻に通知が来るよう設定も可能です。(例: 21:30など)
その習慣を達成した場合、チェックボックスにチェックを入れてもらいます。
登録したすべての習慣を終えたら「目標達成です！明日も頑張りましょう」という励ましの言葉が表示される画面に遷移します。
また、習慣一覧には自分の習慣とは別でフォロワーの習慣も表示されており
フォロワーの習慣にコメントをつけることも可能です。
このように励まし合いながら習慣を身につけるのがこのサービスです。

■ ユーザーの獲得について
学生であれば、勉強の習慣化
社会人や、高齢者は読書や運動など
習慣自体は自由なのでユーザー層は幅広いです。

■ サービスの差別化ポイント・推しポイント
「X」などではユーザー同士の繋がりはありますが、毎日同じ内容はポストしなければいけませんし
習慣以外のことも目に入ったりして、意識が他のことに行ってしまいます。
また、さまざまな人がいるので誹謗中傷などの被害に遭う可能性もあります。
その点このサービスでは、同じ「習慣化」を目指す同士たちしかいませんので
確実に励まし合えると思います。
また、習慣を決めても忘れたりしてしまうこともあると思います。
なのでこのサービスでは習慣を作成する際、通知を設定することができるようにしています。
この通知機能があることで忙しい日々の中で目標を忘れることなく継続できるようにと考えました。
これらの機能により習慣化を効率よく目指すことができ
さらにユーザー同士のコミュニケーションでさらに継続とモチベーション維持できるように工夫しました。

■ 機能候補
* 会員登録
* ログイン
* プロフィール
* 習慣一覧
* 習慣作成
* 習慣詳細
* 習慣編集
* コメント

■ 機能の実装方針予定
* 通知設定
LINE Messaging API SDK for Ruby または whenever
ユーザーが通知時間を設定→wheneverを使って、定期的に実行されるジョブを設定→ジョブ内でLINE Messaging APIを呼び出し通知する
* チェックボックス
* フォロー
acts_as_follower
フォロー機能の実装、フォロワーのリストやフォロー状況など確認できる
