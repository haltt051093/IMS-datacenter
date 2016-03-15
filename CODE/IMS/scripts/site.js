function get(url, success, fail) {
    $.ajax({
        url: url,
        type: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    })
    .success(success)
    .error(fail);
}

function post(url, data, success, fail) {
    $.ajax({
        url: url,
        data: JSON.stringify(data),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    })
    .success(success)
    .error(fail);
}