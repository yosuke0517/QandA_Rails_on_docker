// $(function(){
//     console.log('hello')
//     CKEDITOR.replace('editor', {});
// });
$(function(){
ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
        console.error( error );
    } );
    config.width = 500;
    config.height = 400;
});