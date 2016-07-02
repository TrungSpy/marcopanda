define({ "api": [
  {
    "type": "post",
    "url": "/v1/rpc",
    "title": "/article/post",
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
            "type": "Number",
            "optional": true,
            "field": "user_id",
            "description": "<p>ユーザID。匿名の場合省略可能</p>"
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
            "optional": false,
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
            "optional": false,
            "field": "error",
            "description": "<p>エラーコード</p>"
          },
          {
            "group": "Success 200",
            "type": "String[]",
            "optional": false,
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
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"id\": 2343\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "LongitudeNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"LongitudeNotExist\",\n        \"message\": [\n            \"経度が存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "LatitudeNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"LatitudeNotExist\",\n        \"message\": [\n            \"経度が存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "UserNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"UserNotExist\",\n        \"message\": [\n            \"ユーザが存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "CategoryNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"CategoryNotExist\",\n        \"message\": [\n            \"カテゴリが存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "CostNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"CostNotExist\",\n        \"message\": [\n            \"コストが存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "ArticleTextOverUpperLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"ArticleTextOverUpperLimit\",\n        \"message\": [\n            \"投稿テキストが文字数上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "NicknameOverUpperLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"NicknameOverUpperLimit\",\n        \"message\": [\n            \"ニックネームは文字数上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/article.rb",
    "groupTitle": "article"
  }
] });
