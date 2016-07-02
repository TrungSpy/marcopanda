@api {Post} /map/search 地図検索
@apiVersion 0.1.0
@apiName /map/search
@apiGroup map
@apiSampleRequest off

@apiDescription 地図検索。

@apiParam {String} [user_uuid] ユーザID（ログインしている場合必須）
@apiParam {Number} [longitude] 経度（現在地から検索する場合必須）
@apiParam {Number} [latitude] 緯度（現在地から検索する場合必須）
@apiParam {Number} [zoom] 拡大倍数（現在地から検索する場合必須）
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
@apiParam {Number} [sort_by] 並び替え。1:人数 2:いいね 3:星数 4:新しい順（最近１ヶ月以内投稿多い順）

@apiSuccess {String} [error] エラーコード
@apiSuccess {String[]} [message] エラーメッセージ
@apiSuccess {Number} [zoom] 拡大倍数（現在地から検索する場合同じ値を返す。地名で検索する場合デフォルト値を返す。）
@apiSuccess {Object} google_map_results Google APIから返ってきた検索結果（status=OKの場合）
@apiSuccess {Object[]} search_results 検索結果
@apiSuccess {Number} [search_results.longitude] 経度
@apiSuccess {Number} [search_results.latitude] 緯度
@apiSuccess {Number} [search_results.spot_id] スポットID
@apiSuccess {String} [search_results.location_name] 地名
@apiSuccess {Number} [search_results.category_id] カテゴリID。1:温泉 2:レストラン 3:ホテル 4:観光スポット 5:交通 6:ショッピング 7:イベント 8:公共施設 9:アミューズメント 10:病院 99:その他
@apiSuccess {String[]} [search_results.color] スポット色
@apiSuccess {String} [search_results.color.rgb] スポット色のRGB形式。例：#99ee66
@apiSuccess {Number} [search_results.color.r] Red、範囲：0〜255。例：99
@apiSuccess {Number} [search_results.color.g] Green、範囲：0〜255。例：241
@apiSuccess {Number} [search_results.color.b] Blue、範囲：0〜255。例：150
@apiSuccess {Number} [search_results.color.a] Alpha、範囲：0〜1。例：0.5
@apiSuccess {Number} [search_results.cost_id] コストID。1:¥0 2:¥1〜¥1,000 3:¥1,001〜¥2,000 4:¥2,001〜¥5,000 5:¥5,001〜¥10,000 6:¥10,001〜
@apiSuccess {Number} [search_results.star] 星数
@apiSuccess {Number} [search_results.article_number] 投稿数
@apiSuccess {Number} [search_results.like_number] いいね数
@apiSuccess {Number} [search_results.score] スコア（並び順により算出お勧め度）

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
