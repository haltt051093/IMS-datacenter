ngAppCentral.controller('GoogleBookAPIsController', ['$scope', '$http', function ($scope, $http) {
    $scope.books = null;
    $scope.query = '';
    $scope.search = function(query) {
        var processedQuery = query.replace(' ', '+');
        $http.get('https://www.googleapis.com/books/v1/volumes?maxResults=40&q=' + processedQuery).success(function (data) {
            $scope.books = data.items;
        });
    }
    $scope.processTitle = function(book) {
        var title = '';
        var notAllowed = ['"', '<', '>', '|', '\\', '/', ':'];
        for (var i = 0; i < book.volumeInfo.title.length; i++) {
            var chr = book.volumeInfo.title[i];
            if (notAllowed.indexOf(chr) > -1) {
                title = title + '_';
            } else {
                title = title + chr;
            }
        }
        var isbn = '';
        for (var j = 0; j < book.volumeInfo.industryIdentifiers.length; j++) {
            var newIsbn = book.volumeInfo.industryIdentifiers[j].identifier;
            if (newIsbn.length > isbn.length) {
                isbn = newIsbn;
            }
        }
        if (isbn !== '') {
            title = title + ' [' + isbn + ']';
        }
        return title;
    }
    $scope.processIsbn = function(book) {
        var isbn = '';
        for (var i = 0; i < book.volumeInfo.industryIdentifiers.length; i++) {
            if (i === 0) {
                isbn = isbn + book.volumeInfo.industryIdentifiers[i].identifier;
            } else {
                isbn = isbn + ' | ' + book.volumeInfo.industryIdentifiers[i].identifier;
            }
        }
        return isbn;
    }
}]);