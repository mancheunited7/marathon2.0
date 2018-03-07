# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BigCatergory.create!(classification:"トレーニング")
BigCatergory.create!(classification:"大会・イベント")
BigCatergory.create!(classification:"ランニンググッズ")
BigCatergory.create!(classification:"食")

SmallCatergory.create!(classification:"ロード",large_classification_id:1)
SmallCatergory.create!(classification:"トラック",large_classification_id:1)
SmallCatergory.create!(classification:"トレイル",large_classification_id:1)
SmallCatergory.create!(classification:"ロード",large_classification_id:2)
SmallCatergory.create!(classification:"トラック",large_classification_id:2)
SmallCatergory.create!(classification:"トレイル",large_classification_id:2)
SmallCatergory.create!(classification:"練習会",large_classification_id:2)
SmallCatergory.create!(classification:"シャツ・ウェア",large_classification_id:3)
SmallCatergory.create!(classification:"パンツ・タイツ",large_classification_id:3)
SmallCatergory.create!(classification:"シューズ",large_classification_id:3)
SmallCatergory.create!(classification:"バッグ",large_classification_id:3)
SmallCatergory.create!(classification:"ソックス",large_classification_id:3)
SmallCatergory.create!(classification:"ウォッチ",large_classification_id:3)
SmallCatergory.create!(classification:"アクセサリー",large_classification_id:3)
SmallCatergory.create!(classification:"ブランド",large_classification_id:3)
SmallCatergory.create!(classification:"サプリ",large_classification_id:4)
SmallCatergory.create!(classification:"カーボローディング",large_classification_id:4)
SmallCatergory.create!(classification:"タンパク質",large_classification_id:4)
SmallCatergory.create!(classification:"ダイエット",large_classification_id:4)
