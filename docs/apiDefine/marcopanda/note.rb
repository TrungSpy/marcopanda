=begin
@api {post} /v1/rpc /note/post
@apiVersion 0.1.0
@apiName /note/post
@apiGroup note
@apiSampleRequest off

@apiDescription 投稿

@apiHeader {String} token ログイントークン
@apiHeader {String} OS OS（iOS/Android/web）
@apiHeader {String} [OS-VER] OSのバージョンナンバー（例：iOS 9.1.2）
@apiHeader {String} [MODEL] デバイスモデル（例：iPhone7,1）
@apiHeader {String} [PUSH-TOKEN] iOS：PUSHトークン／Android：registration id
@apiHeader {String} UUID UUID

@apiParam {Number} storage_id ストレージID
@apiParam {String} note_title 投稿タイトル
@apiParam {String} [art_work_binary] アートワーク画像のバイナリデータ（base64エンコード）
@apiParam {String} [description] 説明文
@apiParam {Number} main_category 大カテゴリID
@apiParam {Number} sub_category 小カテゴリID
@apiParam {Object[]} tag_list タグリスト。ない場合が空の配列
@apiParam {Boolean} [tag_list.locked_flag] ロックフラグ（true/false）
@apiParam {String} [tag_list.tag_name] タグ名
@apiParam {Boolean} lyrics_setting_flag 歌詞設定フラグ（true/false）
@apiParam {String} [lyrics] 歌詞
@apiParam {Boolean} allow_download_flag ダウンロード許可フラグ（true/false）

@apiExample 使用例（ヘッダを省略）
curl -i -X POST -d '{"jsonrpc": "2.0", "method": "/note/post", "id": 1, "params": {"storage_id":243,"origin_note_id_list":[348,221,751],"note_title":"初めての曲","description":"説明文なし","main_category":1,"sub_category":103,"tag_list":[{"locked_flag":true,"tag_name":"歌ってみた"},{"locked_flag":false,"tag_name":"LastNote"},{"locked_flag":true,"tag_name":"Finale"}],"lyrics_setting_flag":true,"lyrics":"ダミー歌詞ダミー歌詞ダミー歌詞ダミー歌詞","jasrac_list":[{"jasrac_artist_name":"アーティスト名","jasrac_note_name":"曲名","jasrac_number":"TEADFTR1676"},{"jasrac_artist_name":"アーティスト名","jasrac_note_name":"曲名２","jasrac_number":"TEADFTR1679"}],"allow_download_flag":true,"allow_collabo_flag":false}}' http://api.otoba.dev.vc/v1/rpc

@apiSuccess {String} error エラーコード
@apiSuccess {String[]} message エラーメッセージ
@apiSuccess {Number} id 投稿ID

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
@apiSuccessExample CategoryNotExist-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "CategoryNotExist",
            "message": [
                "カテゴリが存在しません"
            ]
        }

    }
@apiSuccessExample TAGOverLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "TAGOverLimit",
            "message": [
                "タグの数が上限に超えました"
            ]
        }

    }
@apiSuccessExample LockTAGOverLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "LockTAGOverLimit",
            "message": [
                "ロックできるタグの数が上限に超えました"
            ]
        }

    }
@apiSuccessExample OvernoteTitleUpperLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "OvernoteTitleUpperLimit",
            "message": [
                "投稿タイトルが文字数上限に超えました"
            ]
        }

    }
@apiSuccessExample OvernoteDescriptionUpperLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "OvernoteDescriptionUpperLimit",
            "message": [
                "投稿説明文が文字数上限に超えました"
            ]
        }

    }
@apiSuccessExample OvernoteLyricsUpperLimit-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "OvernoteLyricsUpperLimit",
            "message": [
                "投稿歌詞が文字数上限に超えました"
            ]
        }

    }
@apiSuccessExample TokenInvalid-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "TokenInvalid",
            "message": [
                "トークンが失効したため再ログインしてください"
            ]
        }

    }

@apiSuccessExample UUIDNotExist-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "UUIDNotExist",
            "message": [
                "UUIDが登録されていません。アプリを再起動してください。"
            ]
        }
    }
@apiSuccessExample Maintenance-Response:
    HTTP/1.1 200 OK
    {
        "jsonrpc": "2.0",
        "id": "1",
        "result":
        {
            "error": "MAINTENANCE",
            "message": [
                "システムメンテナンス中。時間を空けて再度ご利用ください。"
            ]
        }
    }=end
def /note/post
end
