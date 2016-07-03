=begin
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

=end
def /article/fileupload
end
=begin
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

=end
def /article/like
end
=begin
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

=end
def /article/post
end
=begin
@api {Post} /article/ranking 旅行誌に星を付ける
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

=end
def /article/ranking
end
=begin
@api {Post} /article/search 旅行誌検索
@apiVersion 0.1.0
@apiName /article/search
@apiGroup article
@apiSampleRequest off

@apiDescription 旅行誌検索。

@apiParam {String} [user_uuid] ユーザID（ログインしている場合必須）
@apiParam {Number} [longitude] 経度（現在地から検索する場合必須）
@apiParam {Number} [latitude] 緯度（現在地から検索する場合必須）
@apiParam {Number} [zoom] 拡大倍数（現在地から検索する場合必須）
@apiParam {Number} [spot_id] スポットID（スポットをタップして検索する場合必須）
@apiParam {String} [location_name] 地名（地名で検索する場合必須）
@apiParam {String} [text_language_code] 検索文字言語（iso15924、地名で検索する場合使う）
@apiParam {Object} [filtering] 絞り込む条件（ここ以降各種検索共通）
@apiParam {String} [filtering.freeword] フリーワード検索。投稿テキストから検索。
@apiParam {Number} [filtering.post_by_user_id] 投稿者ユーザID（特定の投稿者の投稿を探すとき使う。自分にも使える）
@apiParam {Number} [filtering.like_by_user_id] いいねを付けたユーザID（主に自分がいいねを付けた投稿を探すとき使う）
@apiParam {Number[]} [filtering.categorys] カテゴリ配列
@apiParam {Number} [filtering.categorys.category_id] カテゴリID
@apiParam {Number} [filtering.sex] 性別。1:男性 2:女性
@apiParam {String} [filtering.country] 国名
@apiParam {Number} [filtering.generation] 年代
@apiParam {Number} [filtering.cost_id_min] 最低コスト
@apiParam {Number} [filtering.cost_id_max] 最高コスト
@apiParam {Number} [filtering.star_min] 最低星数
@apiParam {Number} [filtering.star_max] 最高星数
@apiParam {Number} [sort_by] 並び替え。1:人数 2:いいね 3:星数 4:新しい順
@apiParam {Number} [page] 何ページ目指定。デフォルト1ページ目。

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Number} [zoom] 拡大倍数（現在地から検索する場合同じ値を返す。地名で検索する場合デフォルト値を返す。）
@apiSuccess {Object} google_map_results Google APIから返ってきた検索結果（status=OKの場合）
@apiSuccess {Number} search_result_count 検索結果件数
@apiSuccess {Object[]} [search_results] 検索結果
@apiSuccess {Number} [search_results.article_id] 投稿ID
@apiSuccess {Number} [search_results.spot_id] スポットID
@apiSuccess {String[]} [search_results.image_urls] 画像URL配列
@apiSuccess {String} [search_results.image_urls.url] 画像URL
@apiSuccess {String} [search_results.sound_url] 音声URL
@apiSuccess {Number} [search_results.longitude] 経度
@apiSuccess {Number} [search_results.latitude] 緯度
@apiSuccess {String} [search_results.location_name] 地名
@apiSuccess {String} [search_results.user_uuid] ユーザUUID。匿名の場合空欄
@apiSuccess {String} [search_results.nickname] ニックネーム
@apiSuccess {Number} [search_results.category_id] カテゴリID。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他
@apiSuccess {Number} [search_results.cost_id] コストID。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜
@apiSuccess {String} [search_results.article_text] 投稿文書
@apiSuccess {String} [search_results.text_language_code] 投稿文書言語（iso15924）
@apiSuccess {Number} [search_results.post_timestamp] 投稿時タイムスタンプ
@apiSuccess {Number} [search_results.star] 星数
@apiSuccess {Number} [search_results.like_number] いいね数

@apiSuccessExample Success-Response:
    HTTP/1.1 200 OK
    {
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

=end
def /article/search
end
