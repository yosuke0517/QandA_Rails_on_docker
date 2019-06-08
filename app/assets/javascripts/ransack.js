// //リロードしなくてもjsが動くようにする
// $(document).on('turbolinks:load', function(){
//     //このアプリケーション(document)の、formというid('#form')で、キーボードが押され指が離れた瞬間(.on('keyup'...))、eという引数を取って以下のことをしなさい(function(e))
//     $(document).on('keyup', '#search_form', function(e){
//         //キャンセル可能なイベントをキャンセル
//         e.preventDefault();
//         //この要素に入力された語句を取得し($(this).val())、前後の不要な空白を取り除いた($.trim(...);)上でinputという変数に(var input =)代入
//         var input = $.trim($(this).val());
//
//         $.ajax({ //ajax通信で以下のことを行います
//             url: '/', //urlを指定
//             type: 'GET', //メソッドを指定
//             data: ('keyword=' + input), //コントローラーに渡すデータを'keyword=input(入力された文字のことですね)'にするように指定
//             processData: false, //おまじない
//             contentType: false, //おまじない
//             dataType: 'json' //データ形式を指定
//         })
//     });
// });

