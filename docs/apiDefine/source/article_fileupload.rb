@api {Post} /article/fileupload ファイルアップロード
@apiVersion 0.1.0
@apiName /article/fileupload
@apiGroup article
@apiSampleRequest off

@apiDescription ファイルアップロード

@apiParam {File[]} [file] ファイル投稿（複数ファイル可能）

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Object[]} files ファイル配列
@apiSuccess {Number} files.multimedia_id ファイルID
@apiSuccess {String} files.download_url ダウンロードURL

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
