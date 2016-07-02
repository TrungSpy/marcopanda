=begin
@api {post} /address/search
@apiVersion 0.1.0
@apiName /address/search
@apiGroup address
@apiSampleRequest off

@apiDescription 住所検索

@apiParam {String} location_name 地名
@apiParam {String} [text_language_code] 検索文字言語（iso15924）

@apiSuccess {String} error エラーコード
@apiSuccess {String[]} message エラーメッセージ
@apiSuccess {Object} results Google APIから返ってきた検索結果（status=OKの場合）

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "id": 2343
        }

    }
@apiSuccessExample NoResults-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "NoResults",
            "message": [
                "検索結果が見つかりません"
            ]
        }

    }
@apiSuccessExample SearchServiceTemporarilyUnavailable-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "SearchServiceTemporarilyUnavailable",
            "message": [
                "検索サービスが一時的に利用できません。時間を空けて再度ご利用ください。"
            ]
        }

    }
@apiSuccessExample AddressOverUpperLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "AddressOverUpperLimit",
            "message": [
                "検索文字が文字数上限に超えました"
            ]
        }

    }
=end
def /address/search
end
