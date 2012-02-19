// "use strict";

var MyAppTest01 = AsyncTestCase("MyAppTest01");

var wait_time = 1000;

function call_ajax(kind, a, b, c) {
    var ret;
    try {
        $.ajax({
            // async: false,
            cache: false,        
            type: 'POST',
            dataType: 'jsonp',
            url: 'http://localhost:3000/triangle_' + kind,
            crossDomain: true,

            data: {a: a, b: b, c: c},
            success: function(data) {
                if (data.err !== "") {                    
                    $("#result").text(data.err);
                } else {
                    $("#result").text(data.ans);
                }
            },
            error: function(XMLHttpRequest, textStatus, error) {
                jstestdriver.console.log("------- error: " + error);
                alert(error);
            },
            complete: function() {
            }
        });
    } catch(e) {
        jstestdriver.console.log("------- catch error: " + e);
    }
};

MyAppTest01.prototype.setUp = function () {
    /*:DOC +=
      <spawn id="result"></spawn>
    */
    $("#result").text('');
};

MyAppTest01.prototype.test001 = function (queue) {
    var state = 0;                

    queue.call('Step 1: call_ajax', function() {
        ++state;        
        call_ajax(0, 1, 1, 1);
    });

    queue.call('Step 2: schedule the window to increment our variable 5 seconds from now.', function(callbacks) {
        var myCallback = callbacks.add(function() {
            ++state;
        });
        window.setTimeout(myCallback, 1000);
    });
    
    queue.call('Step 3: then assert our state variable changed', function() {
        assertEquals(2, state);
        var result = $("#result").text();
        assertEquals(result, "REGULAR");
    });

};

MyAppTest01.prototype.test002 = function (queue) {
    var state = 0;                

    queue.call('Step 1: call_ajax', function() {
        ++state;
        call_ajax(0, 3, 4, 5);
    });

    queue.call('Step 2: schedule the window to increment our variable 5 seconds from now.', function(callbacks) {
        var myCallback = callbacks.add(function() {
            ++state;
        });
        window.setTimeout(myCallback, 1000);
    });
    
    queue.call('Step 3: then assert our state variable changed', function() {
        assertEquals(2, state);
        var result = $("#result").text();
        assertEquals(result, "RIGHT");
    });

};
