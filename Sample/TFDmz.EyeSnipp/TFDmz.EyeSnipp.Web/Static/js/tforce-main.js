// Thanks: http://stackoverflow.com/questions/4656843/jquery-get-querystring-from-url
function decomplexQueryString() {
    var result = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        result.push(hash[0]);
        result[hash[0]] = hash[1];
    }
    return result;
}