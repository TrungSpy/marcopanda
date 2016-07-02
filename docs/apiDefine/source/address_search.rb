@api {Post} /address 住所
@apiVersion 0.1.0
@apiName /address/search
@apiGroup address
@apiSampleRequest off

@apiDescription 住所検索。直接に使わないかもしれません。

@apiParam {String} location_name 地名
@apiParam {String} [text_language_code] 検索文字言語（iso15924）

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Object} results Google APIから返ってきた検索結果（status=OKの場合）

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
        "results" : [
           {
              "address_components" : [
                 {
                    "long_name" : "Shibuya",
                    "short_name" : "Shibuya",
                    "types" : [ "political", "sublocality", "sublocality_level_1" ]
                 },
                 {
                    "long_name" : "Shibuya",
                    "short_name" : "Shibuya",
                    "types" : [ "locality", "political" ]
                 },
                 {
                    "long_name" : "Tokyo",
                    "short_name" : "Tokyo",
                    "types" : [ "administrative_area_level_1", "political" ]
                 },
                 {
                    "long_name" : "Japan",
                    "short_name" : "JP",
                    "types" : [ "country", "political" ]
                 },
                 {
                    "long_name" : "150-0002",
                    "short_name" : "150-0002",
                    "types" : [ "postal_code" ]
                 }
              ],
              "formatted_address" : "Shibuya, Tokyo 150-0002, Japan",
              "geometry" : {
                 "bounds" : {
                    "northeast" : {
                       "lat" : 35.6641549,
                       "lng" : 139.7139651
                    },
                    "southwest" : {
                       "lat" : 35.65347089999999,
                       "lng" : 139.7005457
                    }
                 },
                 "location" : {
                    "lat" : 35.6597803,
                    "lng" : 139.7017675
                 },
                 "location_type" : "APPROXIMATE",
                 "viewport" : {
                    "northeast" : {
                       "lat" : 35.6641549,
                       "lng" : 139.7139651
                    },
                    "southwest" : {
                       "lat" : 35.65347089999999,
                       "lng" : 139.7005457
                    }
                 }
              },
              "place_id" : "ChIJGfSRvl6LGGAR5GDIDOVf4Bc",
              "types" : [ "political", "sublocality", "sublocality_level_1" ]
           }
        ],
    }

@apiSuccessExample NoResults-Response:
    HTTP/1.1 400 OK
    {
        "error": "NoResults",
        "message": [
            "検索結果が見つかりません"
        ]
    }

@apiSuccessExample SearchServiceTemporarilyUnavailable-Response:
    HTTP/1.1 400 OK
    {
        "error": "SearchServiceTemporarilyUnavailable",
        "message": [
            "検索サービスが一時的に利用できません。時間を空けて再度ご利用ください。"
        ]
    }

@apiSuccessExample AddressOverUpperLimit-Response:
    HTTP/1.1 400 OK
    {
        "error": "AddressOverUpperLimit",
        "message": [
            "検索文字が文字数上限に超えました"
        ]
    }
