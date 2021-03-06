@api {Post} /article/post 旅行誌投稿
@apiVersion 0.1.0
@apiName /article/post
@apiGroup article
@apiSampleRequest off

@apiDescription 旅行誌投稿

@apiParam {Number} [spot_id] スポットID（地図上スポットをタップして投稿する場合必須）
@apiParam {Number} [longitude] 経度（現在地から投稿する場合必須）
@apiParam {Number} [latitude] 緯度（現在地から投稿する場合必須）
@apiParam {String} [location_name] 地名（現在地から投稿する場合使う）
@apiParam {String} [user_uuid] ユーザUUID。匿名の場合省略可能
@apiParam {String} [nickname] ニックネーム
@apiParam {Number} [category_id] カテゴリID。spot_idがNULLの場合必須。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他
@apiParam {Number} [cost_id] コストID。spot_idがNULLの場合必須。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜
@apiParam {Number[]} [multimedia_id] ファイルID（複数枚可能）
@apiParam {String} [article_text] 投稿文書
@apiParam {String} [text_language_code] 投稿文書言語（iso15924）

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Number} article_id ID

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
        "id": 2343
    }

@apiSuccessExample LongitudeNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "LongitudeNotExist",
        "message": [
            "経度が存在しません"
        ]
    }

@apiSuccessExample LatitudeNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "LatitudeNotExist",
        "message": [
            "経度が存在しません"
        ]
    }

@apiSuccessExample UserNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "UserNotExist",
        "message": [
            "ユーザが存在しません"
        ]
    }

@apiSuccessExample CategoryNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "CategoryNotExist",
        "message": [
            "カテゴリが存在しません"
        ]
    }

@apiSuccessExample CostNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "CostNotExist",
        "message": [
            "コストが存在しません"
        ]
    }

@apiSuccessExample ArticleTextOverUpperLimit-Response:
    HTTP/1.1 400 OK
    {
        "error": "ArticleTextOverUpperLimit",
        "message": [
            "投稿テキストが文字数上限に超えました"
        ]
    }

@apiSuccessExample NicknameOverUpperLimit-Response:
    HTTP/1.1 400 OK
    {
        "error": "NicknameOverUpperLimit",
        "message": [
            "ニックネームは文字数上限に超えました"
        ]
    }
