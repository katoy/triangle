// 三角形の形状判定

"use strict";

var wait_time = 1000;

module("async test", {
    setup: function() {
	stop();
	setTimeout(function(){
            $("#result").val("");
            $("#data_a").val("");
            $("#data_b").val("");
            $("#data_c").val("");

	    // ok(true);
	    start();
	}, 100);
   },
    
    teardown: function() {
	stop();
	setTimeout(function(){
	    // ok(true);
	    start();
	}, 100);
    }
});

asyncTest("判定 1: '', '', ''", function() {
    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:empty b:empty c:empty ");
	start();
    }, wait_time);

});

asyncTest("判定 1: '', '', 1", function() {    
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:empty b:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1: 1,'', ''", function() {    
    $("#data_a").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "b:empty c:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1:'', 1, ''", function() {    
    $("#data_b").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:empty c:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1:'', 1 1", function() {    
    $("#data_b").val("1");
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1:1 '' 1", function() {    
    $("#data_a").val("1");
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "b:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1:'' 1 1", function() {    
    $("#data_b").val("1");
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:empty ");
	start();
    }, wait_time);
});

asyncTest("判定 1:a 1 1: a:NG-INPUT", function() {    
    $("#data_a").val("a");
    $("#data_b").val("1");
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:NG-INPUT ");
	start();
    }, wait_time);
});

asyncTest("判定 1:1.1 1.2 1.3: NG-INPUT", function() {    
    $("#data_a").val("1.1");
    $("#data_b").val("1.2");
    $("#data_c").val("1.3");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "a:NG-INPUT b:NG-INPUT c:NG-INPUT ");
	start();
    }, wait_time);
});

asyncTest("判定 1:1 1 1: 正三角形", function() {    
    $("#data_a").val("1");
    $("#data_b").val("1");
    $("#data_c").val("1");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "正三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:100 100 100: 正三角形", function() {    
    $("#data_a").val("100");
    $("#data_b").val("100");
    $("#data_c").val("100");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "正三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:101 101 101: NG-INPUT", function() {    
    $("#data_a").val("101");
    $("#data_b").val("101");
    $("#data_c").val("101");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "NG-INPUT");
	start();
    }, wait_time);
});

asyncTest("判定 1:1 2 2: 二等辺三角形", function() {    
    $("#data_a").val("1");
    $("#data_b").val("2");
    $("#data_c").val("2");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "二等辺三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:2 3 4: 一般の三角形", function() {    
    $("#data_a").val("2");
    $("#data_b").val("3");
    $("#data_c").val("4");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "一般の三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:3 4 5; 直角三角形", function() {    
    $("#data_a").val("3");
    $("#data_b").val("4");
    $("#data_c").val("5");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "直角三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:0 1 2: 三角形が作れません", function() {    
    $("#data_a").val("0");
    $("#data_b").val("1");
    $("#data_c").val("2");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "三角形が作れません");
	start();
    }, wait_time);
});

asyncTest("判定 1:1 2 3: 三角形が作れません", function() {    
    $("#data_a").val("1");
    $("#data_b").val("2");
    $("#data_c").val("3");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "三角形が作れません");
	start();
    }, wait_time);
});

asyncTest("判定 1:100 99 98: 一般の三角形", function() {    
    $("#data_a").val("100");
    $("#data_b").val("99");
    $("#data_c").val("98");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "一般の三角形");
	start();
    }, wait_time);
});

asyncTest("判定 1:30 40 50: 直角三角形", function() {    
    $("#data_a").val("30");
    $("#data_b").val("40");
    $("#data_c").val("50");

    $("#result").val("");
    $("#my_submit_1").click();
    setTimeout(function(){
	equal($('#result').text(), "直角三角形");
	start();
    }, wait_time);
});


