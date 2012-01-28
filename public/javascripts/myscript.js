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
        } else if (s == 'NG') {
            return "三角形が作れません";
        }
        return s;
    }

    $(".required").watermark("Required", "watermark");

    $("#my_submit_0").click( function() {
        $.ajax({
            type: 'POST',
            url: '/triangle_0',
            data: {a: $("#data_a").val(),
                   b: $("#data_b").val(),
                   c: $("#data_c").val()
                  },
            beforeSend: function() {
                $('#my_submit_0').attr('disabled','disabled');
                $('#result').html('送信中...').fadeIn(200);
            },
            success: function(data) {
                if (data.err !== "") {                    
                    $("#result").text(data.err);
                } else {                    
                    $("#result").text(triangle_name(data.ans));
                }
            },
            error: function() {
                alert(data.err);
            },
            complete: function() {
                $('#my_submit_0').removeAttr('disabled');
            }
        });
    });

    $("#my_submit_1").click( function() {
        $("#result").text('');
        $.ajax({
            type: 'POST',
            url: '/triangle_1',            
            data: {a: $("#data_a").val(),
                   b: $("#data_b").val(),
                   c: $("#data_c").val()
                  },
            beforeSend: function() {
                $('#my_submit_1').attr('disabled','disabled');
                $('#result').html('送信中...').fadeIn(200);
            },
            success: function(data) {
                if (data.err !== "") {                    
                    $("#result").text(data.err);
                } else {                    
                    $("#result").text(triangle_name(data.ans));
                }
            },
            error: function() {
                alert(data.err);
            },
            complete: function() {
                $('#my_submit_1').removeAttr('disabled');
            }
        });
    });

});
