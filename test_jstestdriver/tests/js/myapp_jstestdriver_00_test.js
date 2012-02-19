"use strict";

var MyAppTest00 = AsyncTestCase("MyAppTest00");

MyAppTest00.prototype.setUp = function () {
    /*:DOC +=
      <span>テスト</span>
      <input id="data_a" name="data_a"/>
      <input id="data_b" name="data_b"/>
      <input id="data_c" name="data_c"/>
      <input id="my_submit_0" name="my_submit_0" type="button" value="0"/>
      <input id="my_submit_1" name="my_submit_1" type="button" value="1"/>
      <spawn id="result"></spawn>
    */
    $("#result").text('');
};

MyAppTest00.prototype.test001 = function (queue) {
    var state = 0;                

    queue.call('Step 1: submit 0', function() {
        ++state;        
        $("#data_a").val("1");
        $("#data_b").val("1");
        $("#data_c").val("1");
        $("#my_submit_0").click();
        // jstestdriver.console.log("------- click: " + $("#my_submit_0").click);
    });

    queue.call('Step 2: schedule the window to increment our variable 5 seconds from now.', function(callbacks) {
        var myCallback = callbacks.add(function() {
            ++state;
        });
        window.setTimeout(myCallback, 5000);
    });
    
    queue.call('Step 3: then assert our state variable changed', function() {
        assertEquals(2, state);
        var result = $("#result").text();
        // jstestdriver.console.log("------- result: " + result );
        assertEquals(result, "REGULAR");
    });

};
