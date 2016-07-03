=begin
@api {Post} /multimedia/download ファイルダウンロード
@apiVersion 0.1.0
@apiName /multimedia/download
@apiGroup multimedia
@apiSampleRequest off

@apiDescription ファイルダウンロード

@apiParam {String} path パス

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Object} binary ファイルのバイナリデータ

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK

@apiSuccessExample NoResults-Response:
    HTTP/1.1 400 OK
    {
        "error": "PathNotFound",
        "message": [
            "パスが見つかりません"
        ]
    }

=end
def /multimedia/download
end
