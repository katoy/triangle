$(function () {
    function triangle_name(s) {
        if (s == 'NORMAL') {
            return "一般の三角形";
        } else if (s == 'ISO') {
            return "二等辺三角形";
        } else if (s == 'REGULAR') {
            return "正三角形";
        } else if (s == 'RIGHT') {
            return "直角三角形";
        }
        return s;
    }

    $(".required").watermark("Required", "watermark");

    $("#my_submit").click( function() {
        $.ajax({
            type: 'POST',
            url: '/triangle',
            data: {a: $("#data_a").val(),
                   b: $("#data_b").val(),
                   c: $("#data_c").val()
                  },
            beforeSend: function() {
            },
            success: function(data) {
                if (data.err !== "") {                    
                    $("#result").text(data.err);
                } else {                    
                    $("#result").text(triangle_name(data.triangle));
                }
            },
            error: function() {
                alert(data.err);
            },
            complete: function() {
            }
        });
    });
});
