@api {Post} /user/regist ユーザ登録
@apiVersion 0.1.0
@apiName /user/regist
@apiGroup user
@apiSampleRequest off

@apiDescription ユーザ登録

@apiParam {Number} come_from どのSNSから来た。1:mail 2:facebook 3:google 4:wechat 5:twitter 6:linkedin
@apiParam {String} login_account ログインアカウント。come_fromが1の場合メールアドレスになる。
@apiParam {String} nickname ニックネーム
@apiParam {Number} [sex] 性別。1:男性 2:女性
@apiParam {Number} [generation] 年代。1:〜9 2:10〜19 3:20〜29 4:30〜39 5:40〜49 6:50〜59 7:60〜69 8:70〜79 9:80〜
@apiParam {String} [country] 国名
@apiParam {File} [image_file] ユーザアイコン

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {String} user_uuid ユーザUUID。40桁ランダム文字

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
        "user_uuid": "5m0rjnZo7F2v3cx7GDj7WO5PmLcxSHSHlEtF0hNE"
    }

@apiSuccessExample ComeFromNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "ComeFromNotExist",
        "message": [
            "SNSが存在しません"
        ]
    }

@apiSuccessExample UserExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "UserExist",
        "message": [
            "ユーザが既に存在しました"
        ]
    }

@apiSuccessExample GenerationNotExist-Response:
    HTTP/1.1 400 OK
    {
        "error": "GenerationNotExist",
        "message": [
            "年代が存在しません"
        ]
    }
