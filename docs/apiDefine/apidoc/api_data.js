define({ "api": [
  {
    "type": "post",
    "url": "/address/search",
    "title": "",
    "version": "0.1.0",
    "name": "_address_search",
    "group": "address",
    "description": "<p>住所検索</p>",
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
    "type": "post",
    "url": "/article/post",
    "title": "",
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
            "optional": false,
            "field": "longitude",
            "description": "<p>経度</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "latitude",
            "description": "<p>緯度</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "location_name",
            "description": "<p>地名</p>"
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
            "type": "Number",
            "optional": false,
            "field": "category_id",
            "description": "<p>カテゴリID。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "cost_id",
            "description": "<p>コストID。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜</p>"
          },
          {
            "group": "Parameter",
            "type": "File",
            "optional": true,
            "field": "image_file",
            "description": "<p>画像投稿</p>"
          },
          {
            "group": "Parameter",
            "type": "File",
            "optional": true,
            "field": "sound_file",
            "description": "<p>音声投稿</p>"
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
    "type": "post",
    "url": "/user/regist",
    "title": "",
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
