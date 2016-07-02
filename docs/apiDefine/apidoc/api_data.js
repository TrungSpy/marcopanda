define({ "api": [
  {
    "type": "post",
    "url": "/v1/rpc",
    "title": "/note/post",
    "version": "0.1.0",
    "name": "_note_post",
    "group": "note",
    "description": "<p>投稿</p>",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": "<p>ログイントークン</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "OS",
            "description": "<p>OS（iOS/Android/web）</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": true,
            "field": "OS-VER",
            "description": "<p>OSのバージョンナンバー（例：iOS 9.1.2）</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": true,
            "field": "MODEL",
            "description": "<p>デバイスモデル（例：iPhone7,1）</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": true,
            "field": "PUSH-TOKEN",
            "description": "<p>iOS：PUSHトークン／Android：registration id</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "UUID",
            "description": "<p>UUID</p>"
          }
        ]
      }
    },
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "storage_id",
            "description": "<p>ストレージID</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "note_title",
            "description": "<p>投稿タイトル</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "art_work_binary",
            "description": "<p>アートワーク画像のバイナリデータ（base64エンコード）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "description",
            "description": "<p>説明文</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "main_category",
            "description": "<p>大カテゴリID</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "sub_category",
            "description": "<p>小カテゴリID</p>"
          },
          {
            "group": "Parameter",
            "type": "Object[]",
            "optional": false,
            "field": "tag_list",
            "description": "<p>タグリスト。ない場合が空の配列</p>"
          },
          {
            "group": "Parameter",
            "type": "Boolean",
            "optional": true,
            "field": "tag_list.locked_flag",
            "description": "<p>ロックフラグ（true/false）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "tag_list.tag_name",
            "description": "<p>タグ名</p>"
          },
          {
            "group": "Parameter",
            "type": "Boolean",
            "optional": false,
            "field": "lyrics_setting_flag",
            "description": "<p>歌詞設定フラグ（true/false）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "lyrics",
            "description": "<p>歌詞</p>"
          },
          {
            "group": "Parameter",
            "type": "Boolean",
            "optional": false,
            "field": "allow_download_flag",
            "description": "<p>ダウンロード許可フラグ（true/false）</p>"
          }
        ]
      }
    },
    "examples": [
      {
        "title": "使用例（ヘッダを省略）",
        "content": "curl -i -X POST -d '{\"jsonrpc\": \"2.0\", \"method\": \"/note/post\", \"id\": 1, \"params\": {\"storage_id\":243,\"origin_note_id_list\":[348,221,751],\"note_title\":\"初めての曲\",\"description\":\"説明文なし\",\"main_category\":1,\"sub_category\":103,\"tag_list\":[{\"locked_flag\":true,\"tag_name\":\"歌ってみた\"},{\"locked_flag\":false,\"tag_name\":\"LastNote\"},{\"locked_flag\":true,\"tag_name\":\"Finale\"}],\"lyrics_setting_flag\":true,\"lyrics\":\"ダミー歌詞ダミー歌詞ダミー歌詞ダミー歌詞\",\"jasrac_list\":[{\"jasrac_artist_name\":\"アーティスト名\",\"jasrac_note_name\":\"曲名\",\"jasrac_number\":\"TEADFTR1676\"},{\"jasrac_artist_name\":\"アーティスト名\",\"jasrac_note_name\":\"曲名２\",\"jasrac_number\":\"TEADFTR1679\"}],\"allow_download_flag\":true,\"allow_collabo_flag\":false}}' http://api.otoba.dev.vc/v1/rpc",
        "type": "json"
      }
    ],
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
            "field": "id",
            "description": "<p>投稿ID</p>"
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
          "title": "CategoryNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"CategoryNotExist\",\n        \"message\": [\n            \"カテゴリが存在しません\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "TAGOverLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"TAGOverLimit\",\n        \"message\": [\n            \"タグの数が上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "LockTAGOverLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"LockTAGOverLimit\",\n        \"message\": [\n            \"ロックできるタグの数が上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "OvernoteTitleUpperLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"OvernoteTitleUpperLimit\",\n        \"message\": [\n            \"投稿タイトルが文字数上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "OvernoteDescriptionUpperLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"OvernoteDescriptionUpperLimit\",\n        \"message\": [\n            \"投稿説明文が文字数上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "OvernoteLyricsUpperLimit-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"OvernoteLyricsUpperLimit\",\n        \"message\": [\n            \"投稿歌詞が文字数上限に超えました\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "TokenInvalid-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"TokenInvalid\",\n        \"message\": [\n            \"トークンが失効したため再ログインしてください\"\n        ]\n    }\n\n}",
          "type": "json"
        },
        {
          "title": "UUIDNotExist-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"UUIDNotExist\",\n        \"message\": [\n            \"UUIDが登録されていません。アプリを再起動してください。\"\n        ]\n    }\n}",
          "type": "json"
        },
        {
          "title": "Maintenance-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"jsonrpc\": \"2.0\",\n    \"id\": \"1\",\n    \"result\":\n    {\n        \"error\": \"MAINTENANCE\",\n        \"message\": [\n            \"システムメンテナンス中。時間を空けて再度ご利用ください。\"\n        ]\n    }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "marcopanda/note.rb",
    "groupTitle": "note"
  }
] });
