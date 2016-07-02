@api {Post} /article 旅行誌
@apiVersion 0.1.0
@apiName /article/ranking
@apiGroup article
@apiSampleRequest off

@apiDescription 旅行誌に星を付ける

@apiParam {Number} article_id 旅行誌ID
@apiParam {String} user_uuid ユーザUUID。匿名の場合いいねを付けれない
@apiParam {Number} star 星数

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
    }

@apiSuccessExample ArticleNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "ArticleNotExist",
        "message": [
            "旅行誌が存在しません"
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

@apiSuccessExample StarOverLimit-Response:
    HTTP/1.1 400 OK
    {
        "error": "StarOverLimit",
        "message": [
            "付けれない星数"
        ]
    }

@apiSuccessExample RepeatRanking-Response:
    HTTP/1.1 400 OK
    {
        "error": "RepeatLike",
        "message": [
            "ユーザが既に評価しました"
        ]
    }
