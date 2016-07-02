@api {Post} /article/like 旅行誌にいいねする
@apiVersion 0.1.0
@apiName /article/like
@apiGroup article
@apiSampleRequest off

@apiDescription 旅行誌にいいねする

@apiParam {Number} article_id 旅行誌ID
@apiParam {String} user_uuid ユーザUUID。匿名の場合いいねを付けれない

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

@apiSuccessExample RepeatLike-Response:
    HTTP/1.1 400 OK
    {
        "error": "RepeatLike",
        "message": [
            "ユーザが既にいいねをしました"
        ]
    }
