define({ "api": [
  {
    "type": "Post",
    "url": "/address/search",
    "title": "住所検索",
    "version": "0.1.0",
    "name": "_address_search",
    "group": "address",
    "description": "<p>住所検索。直接に使わないかもしれません。</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "location_name",
            "description": "<p>地名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "text_language_code",
            "description": "<p>検索文字言語（iso15924）</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "results",
            "description": "<p>Google APIから返ってきた検索結果（status=OKの場合）</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"results\" : [\n       {\n          \"address_components\" : [\n             {\n                \"long_name\" : \"Shibuya\",\n                \"short_name\" : \"Shibuya\",\n                \"types\" : [ \"political\", \"sublocality\", \"sublocality_level_1\" ]\n             },\n             {\n                \"long_name\" : \"Shibuya\",\n                \"short_name\" : \"Shibuya\",\n                \"types\" : [ \"locality\", \"political\" ]\n             },\n             {\n                \"long_name\" : \"Tokyo\",\n                \"short_name\" : \"Tokyo\",\n                \"types\" : [ \"administrative_area_level_1\", \"political\" ]\n             },\n             {\n                \"long_name\" : \"Japan\",\n                \"short_name\" : \"JP\",\n                \"types\" : [ \"country\", \"political\" ]\n             },\n             {\n                \"long_name\" : \"150-0002\",\n                \"short_name\" : \"150-0002\",\n                \"types\" : [ \"postal_code\" ]\n             }\n          ],\n          \"formatted_address\" : \"Shibuya, Tokyo 150-0002, Japan\",\n          \"geometry\" : {\n             \"bounds\" : {\n                \"northeast\" : {\n                   \"lat\" : 35.6641549,\n                   \"lng\" : 139.7139651\n                },\n                \"southwest\" : {\n                   \"lat\" : 35.65347089999999,\n                   \"lng\" : 139.7005457\n                }\n             },\n             \"location\" : {\n                \"lat\" : 35.6597803,\n                \"lng\" : 139.7017675\n             },\n             \"location_type\" : \"APPROXIMATE\",\n             \"viewport\" : {\n                \"northeast\" : {\n                   \"lat\" : 35.6641549,\n                   \"lng\" : 139.7139651\n                },\n                \"southwest\" : {\n                   \"lat\" : 35.65347089999999,\n                   \"lng\" : 139.7005457\n                }\n             }\n          },\n          \"place_id\" : \"ChIJGfSRvl6LGGAR5GDIDOVf4Bc\",\n          \"types\" : [ \"political\", \"sublocality\", \"sublocality_level_1\" ]\n       }\n    ],\n}",
          "type": "json"
        },
        {
          "title": "NoResults-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"NoResults\",\n    \"message\": [\n        \"検索結果が見つかりません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "SearchServiceTemporarilyUnavailable-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"SearchServiceTemporarilyUnavailable\",\n    \"message\": [\n        \"検索サービスが一時的に利用できません。時間を空けて再度ご利用ください。\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "AddressOverUpperLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"AddressOverUpperLimit\",\n    \"message\": [\n        \"検索文字が文字数上限に超えました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/address.rb",
    "groupTitle": "address"
  },
  {
    "type": "Post",
    "url": "/article/like",
    "title": "旅行誌にいいねする",
    "version": "0.1.0",
    "name": "_article_like",
    "group": "article",
    "description": "<p>旅行誌にいいねする</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "article_id",
            "description": "<p>旅行誌ID</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "user_uuid",
            "description": "<p>ユーザUUID。匿名の場合いいねを付けれない</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n}",
          "type": "json"
        },
        {
          "title": "ArticleNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"ArticleNotExist\",\n    \"message\": [\n        \"旅行誌が存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "UserNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"UserNotExist\",\n    \"message\": [\n        \"ユーザが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "RepeatLike-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"RepeatLike\",\n    \"message\": [\n        \"ユーザが既にいいねをしました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/article.rb",
    "groupTitle": "article"
  },
  {
    "type": "Post",
    "url": "/article/post",
    "title": "旅行誌投稿",
    "version": "0.1.0",
    "name": "_article_post",
    "group": "article",
    "description": "<p>旅行誌投稿</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "spot_id",
            "description": "<p>スポットID（地図上スポットをタップして投稿する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "longitude",
            "description": "<p>経度（現在地から投稿する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "latitude",
            "description": "<p>緯度（現在地から投稿する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "location_name",
            "description": "<p>地名（現在地から投稿する場合使う）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "user_uuid",
            "description": "<p>ユーザUUID。匿名の場合省略可能</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "nickname",
            "description": "<p>ニックネーム</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "category_id",
            "description": "<p>カテゴリID。spot_idがNULLの場合必須。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "cost_id",
            "description": "<p>コストID。spot_idがNULLの場合必須。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜</p>"
          },
          {
            "group": "Parameter",
            "type": "File[]",
            "optional": true,
            "field": "image_file",
            "description": "<p>画像投稿（複数枚可能）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "article_text",
            "description": "<p>投稿文書</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "text_language_code",
            "description": "<p>投稿文書言語（iso15924）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "post_timestamp",
            "description": "<p>投稿時タイムスタンプ</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "article_id",
            "description": "<p>ID</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"id\": 2343\n}",
          "type": "json"
        },
        {
          "title": "LongitudeNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"LongitudeNotExist\",\n    \"message\": [\n        \"経度が存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "LatitudeNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"LatitudeNotExist\",\n    \"message\": [\n        \"経度が存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "UserNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"UserNotExist\",\n    \"message\": [\n        \"ユーザが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "CategoryNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"CategoryNotExist\",\n    \"message\": [\n        \"カテゴリが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "CostNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"CostNotExist\",\n    \"message\": [\n        \"コストが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "ArticleTextOverUpperLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"ArticleTextOverUpperLimit\",\n    \"message\": [\n        \"投稿テキストが文字数上限に超えました\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "NicknameOverUpperLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"NicknameOverUpperLimit\",\n    \"message\": [\n        \"ニックネームは文字数上限に超えました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/article.rb",
    "groupTitle": "article"
  },
  {
    "type": "Post",
    "url": "/article/ranking",
    "title": "旅行誌に星を付ける",
    "version": "0.1.0",
    "name": "_article_ranking",
    "group": "article",
    "description": "<p>旅行誌に星を付ける</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "article_id",
            "description": "<p>旅行誌ID</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "user_uuid",
            "description": "<p>ユーザUUID。匿名の場合いいねを付けれない</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "star",
            "description": "<p>星数</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n}",
          "type": "json"
        },
        {
          "title": "ArticleNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"ArticleNotExist\",\n    \"message\": [\n        \"旅行誌が存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "UserNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"UserNotExist\",\n    \"message\": [\n        \"ユーザが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "StarOverLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"StarOverLimit\",\n    \"message\": [\n        \"付けれない星数\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "RepeatRanking-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"RepeatLike\",\n    \"message\": [\n        \"ユーザが既に評価しました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/article.rb",
    "groupTitle": "article"
  },
  {
    "type": "Post",
    "url": "/article/search",
    "title": "旅行誌検索",
    "version": "0.1.0",
    "name": "_article_search",
    "group": "article",
    "description": "<p>旅行誌検索。</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "user_uuid",
            "description": "<p>ユーザID（ログインしている場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "longitude",
            "description": "<p>経度（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "latitude",
            "description": "<p>緯度（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "zoom",
            "description": "<p>拡大倍数（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "spot_id",
            "description": "<p>スポットID（スポットをタップして検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "location_name",
            "description": "<p>地名（地名で検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "text_language_code",
            "description": "<p>検索文字言語（iso15924、地名で検索する場合使う）</p>"
          },
          {
            "group": "Parameter",
            "type": "Object",
            "optional": true,
            "field": "filtering",
            "description": "<p>絞り込む条件（ここ以降各種検索共通）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "filtering.freeword",
            "description": "<p>フリーワード検索。投稿テキストから検索。</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.post_by_user_id",
            "description": "<p>投稿者ユーザID（特定の投稿者の投稿を探すとき使う。自分にも使える）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.like_by_user_id",
            "description": "<p>いいねを付けたユーザID（主に自分がいいねを付けた投稿を探すとき使う）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number[]",
            "optional": true,
            "field": "filtering.categorys",
            "description": "<p>カテゴリ配列</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.categorys.category_id",
            "description": "<p>カテゴリID</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.sex",
            "description": "<p>性別。1:男性 2:女性</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "filtering.country",
            "description": "<p>国名</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.generation",
            "description": "<p>年代</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.cost_id_min",
            "description": "<p>最低コスト</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.cost_id_max",
            "description": "<p>最高コスト</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.star_min",
            "description": "<p>最低星数</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.star_max",
            "description": "<p>最高星数</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "sort_by",
            "description": "<p>並び替え。1:人数 2:いいね 3:星数 4:新しい順</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "page",
            "description": "<p>何ページ目指定。デフォルト1ページ目。</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "zoom",
            "description": "<p>拡大倍数（現在地から検索する場合同じ値を返す。地名で検索する場合デフォルト値を返す。）</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "google_map_results",
            "description": "<p>Google APIから返ってきた検索結果（status=OKの場合）</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "search_result_count",
            "description": "<p>検索結果件数</p>"
          },
          {
            "group": "Success 200",
            "type": "Object[]",
            "optional": false,
            "field": "search_results",
            "description": "<p>検索結果</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.article_id",
            "description": "<p>投稿ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.spot_id",
            "description": "<p>スポットID</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "search_results.image_urls",
            "description": "<p>画像URL配列</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.image_urls.url",
            "description": "<p>画像URL</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.sound_url",
            "description": "<p>音声URL</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.longitude",
            "description": "<p>経度</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.latitude",
            "description": "<p>緯度</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.location_name",
            "description": "<p>地名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.user_uuid",
            "description": "<p>ユーザUUID。匿名の場合空欄</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.nickname",
            "description": "<p>ニックネーム</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.category_id",
            "description": "<p>カテゴリID。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.cost_id",
            "description": "<p>コストID。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.article_text",
            "description": "<p>投稿文書</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.text_language_code",
            "description": "<p>投稿文書言語（iso15924）</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.post_timestamp",
            "description": "<p>投稿時タイムスタンプ</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.star",
            "description": "<p>星数</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.like_number",
            "description": "<p>いいね数</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n}",
          "type": "json"
        },
        {
          "title": "NoResults-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"NoResults\",\n    \"message\": [\n        \"検索結果が見つかりません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "SearchServiceTemporarilyUnavailable-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"SearchServiceTemporarilyUnavailable\",\n    \"message\": [\n        \"検索サービスが一時的に利用できません。時間を空けて再度ご利用ください。\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "AddressOverUpperLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"AddressOverUpperLimit\",\n    \"message\": [\n        \"検索文字が文字数上限に超えました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/article.rb",
    "groupTitle": "article"
  },
  {
    "type": "Post",
    "url": "/map/search",
    "title": "地図検索",
    "version": "0.1.0",
    "name": "_map_search",
    "group": "map",
    "description": "<p>地図検索。</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "user_uuid",
            "description": "<p>ユーザID（ログインしている場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "longitude",
            "description": "<p>経度（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "latitude",
            "description": "<p>緯度（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "zoom",
            "description": "<p>拡大倍数（現在地から検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "location_name",
            "description": "<p>地名（地名で検索する場合必須）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "text_language_code",
            "description": "<p>検索文字言語（iso15924、地名で検索する場合使う）</p>"
          },
          {
            "group": "Parameter",
            "type": "Object",
            "optional": true,
            "field": "filtering",
            "description": "<p>絞り込む条件（ここ以降各種検索共通）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "filtering.freeword",
            "description": "<p>フリーワード検索。投稿テキストから検索。</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.post_by_user_id",
            "description": "<p>投稿者ユーザID（特定の投稿者の投稿を探すとき使う。自分にも使える）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.like_by_user_id",
            "description": "<p>いいねを付けたユーザID（主に自分がいいねを付けた投稿を探すとき使う）</p>"
          },
          {
            "group": "Parameter",
            "type": "Number[]",
            "optional": true,
            "field": "filtering.categorys",
            "description": "<p>カテゴリ配列</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.categorys.category_id",
            "description": "<p>カテゴリID</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.sex",
            "description": "<p>性別。1:男性 2:女性</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "filtering.country",
            "description": "<p>国名</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.generation",
            "description": "<p>年代</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.cost_id_min",
            "description": "<p>最低コスト</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.cost_id_max",
            "description": "<p>最高コスト</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.star_min",
            "description": "<p>最低星数</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "filtering.star_max",
            "description": "<p>最高星数</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "sort_by",
            "description": "<p>並び替え。1:人数 2:いいね 3:星数 4:新しい順（最近１ヶ月以内投稿多い順）</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "zoom",
            "description": "<p>拡大倍数（現在地から検索する場合同じ値を返す。地名で検索する場合デフォルト値を返す。）</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "google_map_results",
            "description": "<p>Google APIから返ってきた検索結果（status=OKの場合）</p>"
          },
          {
            "group": "Success 200",
            "type": "Object[]",
            "optional": false,
            "field": "search_results",
            "description": "<p>検索結果</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.longitude",
            "description": "<p>経度</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.latitude",
            "description": "<p>緯度</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.spot_id",
            "description": "<p>スポットID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.location_name",
            "description": "<p>地名</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.category_id",
            "description": "<p>カテゴリID。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "search_results.color",
            "description": "<p>スポット色</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "search_results.color.rgb",
            "description": "<p>スポット色のRGB形式。例：#99ee66</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.color.r",
            "description": "<p>Red、範囲：0〜255。例：99</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.color.g",
            "description": "<p>Green、範囲：0〜255。例：241</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.color.b",
            "description": "<p>Blue、範囲：0〜255。例：150</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.color.a",
            "description": "<p>Alpha、範囲：0〜1。例：0.5</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.cost_id",
            "description": "<p>コストID。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.star",
            "description": "<p>星数</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.article_number",
            "description": "<p>投稿数</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.like_number",
            "description": "<p>いいね数</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": true,
            "field": "search_results.score",
            "description": "<p>スコア（並び順により算出お勧め度）</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n}",
          "type": "json"
        },
        {
          "title": "NoResults-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"NoResults\",\n    \"message\": [\n        \"検索結果が見つかりません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "SearchServiceTemporarilyUnavailable-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"SearchServiceTemporarilyUnavailable\",\n    \"message\": [\n        \"検索サービスが一時的に利用できません。時間を空けて再度ご利用ください。\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "AddressOverUpperLimit-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"AddressOverUpperLimit\",\n    \"message\": [\n        \"検索文字が文字数上限に超えました\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/map.rb",
    "groupTitle": "map"
  },
  {
    "type": "Post",
    "url": "/user/regist",
    "title": "ユーザ登録",
    "version": "0.1.0",
    "name": "_user_regist",
    "group": "user",
    "description": "<p>ユーザ登録</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "come_from",
            "description": "<p>どのSNSから来た。1:mail 2:facebook 3:google 4:wechat 5:twitter 6:linkedin</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "login_account",
            "description": "<p>ログインアカウント。come_fromが1の場合メールアドレスになる。</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nickname",
            "description": "<p>ニックネーム</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "sex",
            "description": "<p>性別。1:男性 2:女性</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": true,
            "field": "generation",
            "description": "<p>年代。1:〜9 2:10〜19 3:20〜29 4:30〜39 5:40〜49 6:50〜59 7:60〜69 8:70〜79 9:80〜</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "country",
            "description": "<p>国名</p>"
          },
          {
            "group": "Parameter",
            "type": "File",
            "optional": true,
            "field": "image_file",
            "description": "<p>ユーザアイコン</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": true,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": true,
            "field": "message",
            "description": "<p>エラーメッセージ</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "user_uuid",
            "description": "<p>ユーザUUID。40桁ランダム文字</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"user_uuid\": \"5m0rjnZo7F2v3cx7GDj7WO5PmLcxSHSHlEtF0hNE\"\n}",
          "type": "json"
        },
        {
          "title": "ComeFromNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"ComeFromNotExist\",\n    \"message\": [\n        \"SNSが存在しません\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "UserExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"UserExist\",\n    \"message\": [\n        \"ユーザが既に存在しました\"\n    ]\n}",
          "type": "json"
        },
        {
          "title": "GenerationNotExist-Response:",
          "content": "HTTP/1.1 400 OK\n{\n    \"error\": \"GenerationNotExist\",\n    \"message\": [\n        \"年代が存在しません\"\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/user.rb",
    "groupTitle": "user"
  }
] });
