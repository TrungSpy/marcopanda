@api {Post} /user/uuid_regist ユーザUUID登録（プレゼン用）
@apiVersion 0.1.0
@apiName /user/uuid_regist
@apiGroup user
@apiSampleRequest off

@apiDescription ユーザUUID登録

@apiParam {String} user_uuid ユーザUUID

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {String} user_uuid ユーザUUID。もらったデータをそのまま返す

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
        "user_uuid": "5m0rjnZo7F2v3cx7GDj7WO5PmLcxSHSHlEtF0hNE"
    }

@apiSuccessExample UserExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "UserExist",
        "message": [
            "ユーザが既に存在しました"
        ]
    }
