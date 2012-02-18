// "use strict";

MyAppTestX = TestCase("MyAppTestX");

var wait_time = 1000;

function call_ajax() {
    jstestdriver.console.log("------- call_ajax: ");
    try {
        
        var ret = $.ajax({
            async: false,
            cache: false,        
            type: 'POST',
            dataType: 'jsonp',
            url: 'http://localhost:3000/triangle_0',
            crossDomain: true,

            data: {a: $("#data_a").val(),
                   b: $("#data_b").val(),
                   c: $("#data_c").val()
                  },
            success: function(data) {
                jstestdriver.console.log("------- success: " + data);
                if (data.err !== "") {
                    $("#result").text(data.err);
                } else {
                    $("#result").text(triangle_name(data.ans));
                }
            },
            error: function(XMLHttpRequest, textStatus, error) {
                jstestdriver.console.log("------- error: " + error);
                alert(error);
            },
            complete: function() {
                jstestdriver.console.log("------- complete: ");
            }
        });
        jstestdriver.console.log("------- return from $.ajax");
    } catch(e) {
        jstestdriver.console.log("------- catch error: " + e);
    }
    
    jstestdriver.console.log("------- return call_ajax");
};

MyAppTestX.prototype.setUp = function () {
    /*:DOC +=
      <input id="data_a" name="data_a" class="required hen"/>
      <input id="data_b" name="data_b" class="required hen"/>
      <input id="data_c" name="data_c" class="required hen"/>
      <input id="my_submit_0" name="my_submit_0" type="button" value="È½Äê0"/>
      <input id="my_submit_1" name="my_submit_1" type="button" value="È½Äê1"/>
      <spawn id="result">xxxx</spawn>
    */
};

MyAppTestX.prototype.test001 = function () {    
    
    // jstestdriver.console.log("------- " + document.getElementById('data_a'));
 
    document.getElementById('data_a').value = "1";
    document.getElementById('data_b').value = "1";
    document.getElementById('data_c').value = "1";

    jstestdriver.console.log("------- : start");
    call_ajax();
    jstestdriver.console.log("------- : finish");
    
    var result = document.getElementById('result').innerHTML;
    assertEquals("Test '1', '1', '1'", result, 'empty');    
};
