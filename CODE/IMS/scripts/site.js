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

$.fn.tooltip = function (tooltip_text) {
    // Mouse enters the target element
    $(this).on("mouseover", function () {
        // Make the tooltip visible
        $("#tooltip").css("display", "inline");

        // Set custom text
        $("#tooltip").text(tooltip_text);

        // Start listening to the mousemove event, memory is allocated for it
        $(this).on("mousemove", function (event) {
            var x = event.pageX; // get mouse X position relative to the page (screen)
            var y = event.pageY; // get mouse Y position
            x = x + 32;  // move it to the right from the cursor
            y = y - 16;   // move it up
            $("#tooltip").css({ left: x, top: y });
        });
    });

    // Mouse leaves the target element
    $(this).off("mouseout", function () {
        // Stop listening to the mousemove event, memory is released
        $(this).off("mousemove");
    });

    $(this).on("mouseout", function () {
        // Hide the tooltip
        $("#tooltip").css("display", "none");
    });

}