// enable validation for hidden fields
$.validator.setDefaults({
    ignore: []
});

// add jquery unobtrusive validation adapter
$.validator.unobtrusive.adapters.add('customrequired', [],
    function (options) {
        options.rules['customrequired'] = {
        };
        options.messages['customrequired'] = options.message;
    }
);