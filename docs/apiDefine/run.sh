#!/bin/bash
rm -f marcopanda/*.*

#<?php main(); ?>

php $0
apidoc -i marcopanda/ -o apidoc/ -t mytemplate/  --line-ending=CRLF
exit

<?php

function main() {
    
    define("ROOT", dirname(__FILE__));
    define("SOURCE_PATH", ROOT. "/source");
    define("OUTPUT_PATH", ROOT. "/marcopanda");
    
    //echo SOURCE_PATH, "\n";
    $list = scandir(SOURCE_PATH);
    
    foreach($list as $key => $value) {
        $file_path = SOURCE_PATH. "/". $value;
        $path_parts = pathinfo($file_path);
        if($path_parts['extension'] == 'rb') {
            $contents = file_get_contents($file_path);
            $contents = convert_to_rpc2($contents);
            $apiGroup = "";
            $apiName = "";
            
            preg_match('/^@apiName\s(.*)[^\r\n]*/m', $contents, $matches);
            if(isset($matches[1])) {
                $apiName = $matches[1];
            }
            preg_match('/^@apiGroup\s(.*)[^\r\n]*/m', $contents, $matches);
            if(isset($matches[1])) {
                $apiGroup = $matches[1];
            }
            $output_file_path = OUTPUT_PATH. "/". $apiGroup. ".rb";
            $handle = fopen($output_file_path, "a+");
            fwrite($handle, "=begin\n");
            fwrite($handle, $contents. "\n");
            if($apiName != "/init" && $apiName != "/user/password/active") { // 初期化API以外、UUIDNotExistの共通レスポンスを追加
                fwrite($handle, <<<EOF

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
EOF
);
            }
            fwrite($handle, <<<EOF

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
    }
EOF
);
            fwrite($handle, "=end\n");
            fwrite($handle, "def ". $apiName. "\nend\n");
            fclose($handle);
        }
    }
    
    //print_r($list);
    //echo "\n";

}

function convert_to_rpc2($contents) {
    $contents = convert_http_method_and_url($contents);
    $contents = convert_apiExample($contents);
    $contents = convertResponse($contents);
    
    return $contents;
}

function convert_http_method_and_url($contents) {
    $apiGroup = "";
    $apiName = "";
    preg_match('/^@apiName\s(.*)[^\r\n]*/m', $contents, $matches);
    if(isset($matches[1])) {
        $apiName = $matches[1];
    }
    preg_match('/^@apiGroup\s(.*)[^\r\n]*/m', $contents, $matches);
    if(isset($matches[1])) {
        $apiGroup = $matches[1];
    }
    //preg_match('/^@api\s(.*)[^\r\n]*/m', $contents, $matches);
    preg_match('/^@api\s{(.*)}\s(.*)[^\r\n]*/m', $contents, $matches);
    if(isset($matches[2])) {
        preg_match('/^(.*)\s(.*)$/m', $matches[2], $matches2);
        if(isset($matches2[1])) {
            $url = $matches2[1];
            //$api_title = substr($matches[2], strpos($url, $matches[2]) + strlen($url));
            $replace_to_row = "@api {post} /v1/rpc ". $apiName;
            $contents = str_replace($matches[0], $replace_to_row, $contents);
        }
    }
    
    return $contents;
}

function convert_apiExample($contents) {
    $apiGroup = "";
    $apiName = "";
    preg_match('/^@apiName\s(.*)[^\r\n]*/m', $contents, $matches);
    if(isset($matches[1])) {
        $apiName = $matches[1];
    }
    preg_match('/^@apiGroup\s(.*)[^\r\n]*/m', $contents, $matches);
    if(isset($matches[1])) {
        $apiGroup = $matches[1];
    }
    
    preg_match_all('/^curl\s(.*)[^\r\n]*/m', $contents, $matches);
    foreach($matches[0] as $key => $value) {
        $array = preg_split("/[\s]+/", $value);
        //echo "before\n";print_r($array);
        $i_key = array_search('-i', $array);
        if($i_key === false) {
            $i_key = 0;
        }
        
        $d_key = array_search('-d', $array);
        if($d_key !== false) {
            $post_body = $array[$d_key + 1];
            $post_body = substr($post_body, 1, strlen($post_body) - 2);
            $post_body = '\'{"jsonrpc": "2.0", "method": "'. $apiName. '", "id": 1, "params": '. $post_body. '}\'';
            $array[$d_key + 1] = $post_body;
        } else if($apiName != '/opus/binary/post') {
            $post_body = '\'{"jsonrpc": "2.0", "method": "'. $apiName. '", "id": 1, "params": ""}\'';
            array_splice($array, $i_key + 1, 0, array('-d', $post_body));
            //echo "after body\n";print_r($array);
        }
        
        $x_key = array_search('-X', $array);
        if($x_key !== false) {
            $array[$x_key + 1] = 'POST';
        } else if($apiName != '/opus/binary/post') {
            array_splice($array, $i_key + 1, 0, array('-X', 'POST'));
            //echo "after post\n";print_r($array);
        }
        //echo "after\n";print_r($array);
        if($apiName != '/opus/binary/post') {
            $array[count($array) - 1] = 'http://api.otoba.dev.vc/v1/rpc';
            $value_to_replace = implode(' ', $array);
            $contents = str_replace($value, $value_to_replace, $contents);
        }
        
    }

    return $contents;
}

function convertResponse($contents) {
    preg_match_all('/^@apiSuccessExample\s(.*)[^\r\n]*/m', $contents, $matches);
    //print_r($matches);
    
    $rows = split("\n", $contents);
    //print_r($rows);
    
    for($i = count($matches[0]) - 1; $i >= 0; $i--) {
        $start_line = array_search($matches[0][$i], $rows);
        $end_line = count($rows);
        if($i < count($matches[0]) - 1) {
            $end_line = array_search($matches[0][$i + 1], $rows);
        }
        $replaces = array_slice($rows, $start_line + 2, $end_line - $start_line - 2); 
        for($j = 0; $j < $end_line - $start_line - 2 - 1; $j++) {
            $replaces[$j] = "    ". $replaces[$j];
        }
        //print_r($replaces);
        $head_rows = array(
            '    {',
            '        "jsonrpc": "2.0",',
            '        "id": "1",',
            '        "result":');
        $tail_rows = array(
            '    }');
        array_splice($replaces, 0, 0, $head_rows);
        array_splice($replaces, count($replaces), 0, $tail_rows);
        //print_r($replaces);
        array_splice($rows, $start_line + 2, $end_line - $start_line - 2, $replaces);
    }
    $contents = implode("\n", $rows);
    return $contents;
}

?>
