Nickname.create!(
  [
    {
      content: 'ぼっち',
      category: 'prefix'
    },
    {
      content: 'ジェイソン',
      category: 'prefix'
    },
    {
      content: 'ゆっくり',
      category: 'prefix'
    },
    {
      content: 'P',
      category: 'suffix'
    },
    {
      content: 'たん',
      category: 'suffix'
    },
    {
      content: 'bot',
      category: 'suffix'
    },
    {
      content: '太郎',
      category: 'suffix'
    },
    {
      content: '次郎',
      category: 'suffix'
    },
    {
      content: 'ちゃん',
      category: 'suffix'
    },
    {
      content: 'たん',
      category: 'suffix'
    },
    {
      content: 'みょん',
      category: 'suffix'
    },
    {
      content: 'りん',
      category: 'suffix'
    },
    {
      content: 'ぼん',
      category: 'suffix'
    },
    {
      content: 'エクスプロージョン',
      category: 'suffix'
    },
    {
      content: 'っち',
      category: 'suffix'
    },
    {
      content: 'まる',
      category: 'suffix'
    },
    {
      content: 'てぃ',
      category: 'suffix'
    },
    {
      content: 'ごん',
      category: 'suffix'
    },
    {
      content: '兄',
      category: 'suffix'
    },
    {
      content: 'ニキ',
      category: 'suffix'
    },
    {
      content: 'ネキ',
      category: 'suffix'
    },
    {
      content: '家康',
      category: 'arbitrary_name'
    },
    {
      content: 'イクラ',
      category: 'arbitrary_name'
    },
    {
      content: 'オクラ',
      category: 'arbitrary_name'
    },
    {
      content: 'かまぼこ',
      category: 'arbitrary_name'
    },
    {
      content: 'クリス',
      category: 'arbitrary_name'
    },
    {
      content: '軍曹',
      category: 'arbitrary_name'
    },
    {
      content: 'ケン',
      category: 'arbitrary_name'
    },
    {
      content: 'ゴマ塩',
      category: 'arbitrary_name'
    },
    {
      content: 'コダック',
      category: 'arbitrary_name'
    },
    {
      content: 'さかな',
      category: 'arbitrary_name'
    },
    {
      content: 'しゃけ',
      category: 'arbitrary_name'
    },
    {
      content: 'ジュニア',
      category: 'arbitrary_name'
    },
    {
      content: '師匠',
      category: 'arbitrary_name'
    },
    {
      content: 'じょー',
      category: 'arbitrary_name'
    },
    {
      content: '村長',
      category: 'arbitrary_name'
    },
    {
      content: 'タナカ',
      category: 'arbitrary_name'
    },
    {
      content: 'バベル',
      category: 'arbitrary_name'
    },
    {
      content: 'ヌオー',
      category: 'arbitrary_name'
    },
    {
      content: 'おかか',
      category: 'arbitrary_name'
    },
    {
      content: 'ハム',
      category: 'arbitrary_name'
    },
    {
      content: 'ぱにえ',
      category: 'arbitrary_name'
    },
    {
      content: 'ビリー',
      category: 'arbitrary_name'
    },
    {
      content: 'ブチャラティ',
      category: 'arbitrary_name'
    },
    {
      content: 'ポテト',
      category: 'arbitrary_name'
    },
    {
      content: 'マッチョ',
      category: 'arbitrary_name'
    },
    {
      content: 'みっきー',
      category: 'arbitrary_name'
    },
    {
      content: 'もりもり',
      category: 'arbitrary_name'
    },
    {
      content: 'ウォーリー',
      category: 'arbitrary_name'
    },
    {
      content: 'らっきょー',
      category: 'arbitrary_name'
    }
  ]
)

users = [
  User.new(
    family_name: "青野",
    first_name: "健",
    email: "aono@example.com",
    password: "aonoaono",
    icon: File.open("./app/assets/images/aono_icon.png")
  ),
  User.new(
    family_name: "遠藤",
    first_name: "加名芽",
    email: "endo@example.com",
    password: "endoendo",
    icon: File.open("./app/assets/images/endo_icon.png")
  ),
  User.new(
    family_name: "門脇",
    first_name: "健人",
    email: "kadowaki@example.com",
    password: "kadokado",
    icon: File.open("./app/assets/images/kadowaki_icon.png")
  ),
  User.new(
    family_name: "金子",
    first_name: "玲子",
    email: "kaneko@example.com",
    password: "kanekane",
    icon: File.open("./app/assets/images/kaneko_icon.png")
  ),
  User.new(
    family_name: "齋藤",
    first_name: "佑樹",
    email: "saito@example.com",
    password: "saisai",
    icon: File.open("./app/assets/images/saito_icon.png")
  ),
  User.new(
    family_name: "佐藤",
    first_name: "駿介",
    email: "sato@example.com",
    password: "saisai",
    icon: File.open("./app/assets/images/sato_icon.png")
  ),
  User.new(
    family_name: "鈴木",
      first_name: "将太",
      email: "suzuki@example.com",
      password: "suzusuzu",
      icon: File.open("./app/assets/images/suzuki_icon.jpg")
  ),
  User.new(
    family_name: "中村",
      first_name: "恵",
      email: "nakamura@example.com",
      password: "nakanaka",
      icon: File.open("./app/assets/images/nakamura_icon.png")
  ),
  User.new(
    family_name: "西川",
    first_name: "真由",
    email: "nisikawa@example.com",
    password: "nisinisi",
    icon: File.open("./app/assets/images/nisikawa_icon.jpg"),
    admin: true
  ),
  User.new(
    family_name: "丸岡",
    first_name: "瑠愛",
    email: "maruoka@example.com",
    password: "marumaru",
    icon: File.open("./app/assets/images/maruoka_icon.png")
  ),
  User.new(
    family_name: "森塚",
    first_name: "冬乃",
    email: "morituka@example.com",
    password: "morimori",
    icon: File.open("./app/assets/images/morituka_icon.png")
  ),
  User.new(
    family_name: "山田",
    first_name: "有二",
    email: "yamada@example.com",
    password: "yamayama",
    icon: File.open("./app/assets/images/yamada_icon.png")
  ),
  User.new(
    family_name: "吉田",
    first_name: "大雅",
    email: "yosida@example.com",
    password: "yosiyosi",
    icon: File.open("./app/assets/images/yosida_icon.png")
  ),
  User.new(
    family_name: "小林",
    first_name: "忠雄",
    email: "kobayasi@example.com",
    password: "kobakoba",
    icon: File.open("./app/assets/images/kobayasi_icon.png")
  ),
  User.new(
    family_name: "井関",
    first_name: "旭",
    email: "iseki@example.com",
    password: "iseise",
    icon: File.open("./app/assets/images/iseki_icon.png")
  )
]

users.each do |user|
  user.make_nickname
  user.save
end


Team.create!(
  [
    {name: "(株)WEF2205", owner_id: 14},
    {name: "企画営業", owner_id: 1},
    {name: "経理", owner_id: 4},
    {name: "人事", owner_id: 7},
    {name: "開発", owner_id: 12},
    {name: "経営陣", owner_id: 14},
    {name: "夜間部", owner_id: 11},
    {name: "朝活部", owner_id: 4},
    {name: "自販機ワークリーダー", owner_id: 1},
    {name: "ねこちゃん愛好家", owner_id: 2}
  ]
)

Assign.create!(
  [
    {user_id: 1, team_id: 1},
    {user_id: 2, team_id: 1},
    {user_id: 3, team_id: 1},
    {user_id: 4, team_id: 1},
    {user_id: 5, team_id: 1},
    {user_id: 6, team_id: 1},
    {user_id: 7, team_id: 1},
    {user_id: 8, team_id: 1},
    {user_id: 9, team_id: 1},
    {user_id: 10, team_id: 1},
    {user_id: 11, team_id: 1},
    {user_id: 12, team_id: 1},
    {user_id: 13, team_id: 1},
    {user_id: 14, team_id: 1},
    {user_id: 15, team_id: 1},
    {user_id: 1, team_id: 2},
    {user_id: 2, team_id: 2},
    {user_id: 3, team_id: 2},
    {user_id: 4, team_id: 3},
    {user_id: 5, team_id: 3},
    {user_id: 6, team_id: 3},
    {user_id: 7, team_id: 4},
    {user_id: 8, team_id: 4},
    {user_id: 9, team_id: 4},
    {user_id: 10, team_id: 5},
    {user_id: 11, team_id: 5},
    {user_id: 12, team_id: 5},
    {user_id: 13, team_id: 5},
    {user_id: 14, team_id: 6},
    {user_id: 15, team_id: 6},
    {user_id: 1, team_id: 7},
    {user_id: 3, team_id: 7},
    {user_id: 8, team_id: 7},
    {user_id: 10, team_id: 7},
    {user_id: 11, team_id: 7},
    {user_id: 13, team_id: 7},
    {user_id: 2, team_id: 8},
    {user_id: 4, team_id: 8},
    {user_id: 6, team_id: 8},
    {user_id: 9, team_id: 8},
    {user_id: 1, team_id: 9},
    {user_id: 9, team_id: 9},
    {user_id: 12, team_id: 9},
    {user_id: 2, team_id: 10},
    {user_id: 9, team_id: 10},
    {user_id: 12, team_id: 10},
    {user_id: 14, team_id: 10},
  ]
)

Chat.create!(
  [
    {content: "おはようございます。", team_id: 1, user_id: 14 },
    {content: "チェックインを始めます。", team_id: 1, user_id: 15 },
    {content: "吉田、喜！", team_id: 1, user_id: 13},
    {content: "金曜日なので喜で〜す", team_id: 1, user_id: 10},
    {content: "なんくるないさ", team_id: 1, user_id: 8},
    {content: "twitterにいいねください、哀です", team_id: 1, user_id: 5},
    {content: "今月の営業成績が良いので喜です！", team_id: 1, user_id: 1},
    {content: "nilです", team_id: 1, user_id: 7},
    {content: "今日は子供が早く帰宅するので、早退します。", team_id: 1, user_id: 4},
    {content: "あおえもん何かいい案だして〜", team_id: 2, user_id: 3},
    {content: "ばいばぐ〜", team_id: 2, user_id: 1},
    {content: "今日の会議は第2会議室で行います。", team_id: 4, user_id: 7},
    {content: "了解です！", team_id: 4, user_id: 8}
  ]
)

Post.create!(
  [
    {
      content: "今日の朝活部、盛り上がってます！いつもより早く目覚めた方のご参加をおまちしております！",
      user_id: 9
    },
    {
      content: "今日のDaigoさんの動画、興味深い!",
      user_id: 12
    },
    {
      content: "みんなどういう人を採用してほしいんだろう…",
      user_id: 7
    },
    {
      content: "ビールが美味しい季節ですね。ITとビールで面白いこと出来ないかな〜" ,
      image: File.open("./app/assets/images/endo_post.jpg") ,
      user_id: 2
    },
    {
      content: "来週オンライ飲み会したいと思ってます！参加できそうな方コメントください！",
      user_id: 6
    },
  ]
)

Comment.create!(
  [
    {comment: "参加したいです！ いつものgatherですよね？", user_id: 5 , post_id: 1 },
    {comment: "開発部は、コミュニケーションが取れて、自己研鑽を怠らない人材がほしいです！", user_id: 11 , post_id: 3},
    {comment: "参加します！", user_id: 2 , post_id: 5},
    {comment: "参加したいです！シュワシュワ飲みたい！", user_id:4 , post_id: 5},
    {comment: "いいですね、参加します！", user_id: 8, post_id: 5},
  ]
)