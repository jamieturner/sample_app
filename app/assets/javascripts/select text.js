// Get user selection text on page
function getSelectedText() {
    if (window.getSelection) {
        return window.getSelection();
    } else if (document.selection) {
        return document.selection.createRange().text;
    }
    return '';
}

$(document).ready(function () {
    $('#copy1').click(function () {
        $('#input1').val(getSelectedText());
    });
    $('#copy2').click(function () {
        $('#input2').val(getSelectedText());
    });
    $('#copy3').click(function () {
        $('#input3').val(getSelectedText());
    });
});