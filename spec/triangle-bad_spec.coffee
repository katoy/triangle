###
#
#
###

vows = require 'vows'
assert = require 'assert'
Triangle_bad = require '../src/triangle-bad'
Triangle_cases = require './triangle_cases'

ans = (a,b,c) ->
  Triangle_cases.cases_result_555["#{a},#{b},#{c}"]

vows.describe('Triangle_bad:正数と０')
.addBatch
  "正数と０":
    topic: () ->
      @triangle = new Triangle_bad()

    '[0..4] * [0..4] * [0..4]' : (err, browser, status) ->
      for a in [0..4]
        for b in [0..4]
          for c in [0..4]
            # kind() の結果をチェックする。
            assert.equal("0 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "0 #{a},#{b},#{c}:#{ans(a,b,c)}")

            # a,b,c の順番に kind() が依存していないことをチェックする
            assert.equal("1 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "1 #{a},#{b},#{c}:#{@triangle.kind(a,c,b)}")
            assert.equal("2 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "2 #{a},#{b},#{c}:#{@triangle.kind(b,a,c)}")
            assert.equal("3 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "3 #{a},#{b},#{c}:#{@triangle.kind(b,c,a)}")
            assert.equal("4 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "4 #{a},#{b},#{c}:#{@triangle.kind(c,a,b)}")
            assert.equal("5 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "5 #{a},#{b},#{c}:#{@triangle.kind(c,b,a)}")

  "直角三角形, その他":
    topic: () ->
      @triangle = new Triangle_bad()

    '直角三角形, その他 1' : (err, browser, status) ->
      for [a, b, c, kind] in Triangle_cases.cases_result_misc_0
        # a,b,c の順番に kind() が依存していないことをチェックする
        assert.equal("1 #{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "1 #{a},#{b},#{c}:#{kind}")
        assert.equal("2 #{a},#{b},#{c}:#{@triangle.kind(a, c, b)}", "2 #{a},#{b},#{c}:#{kind}")
        assert.equal("3 #{a},#{b},#{c}:#{@triangle.kind(b, a, c)}", "3 #{a},#{b},#{c}:#{kind}")
        assert.equal("4 #{a},#{b},#{c}:#{@triangle.kind(b, c, a)}", "4 #{a},#{b},#{c}:#{kind}")
        assert.equal("5 #{a},#{b},#{c}:#{@triangle.kind(c, a, b)}", "5 #{a},#{b},#{c}:#{kind}")
        assert.equal("6 #{a},#{b},#{c}:#{@triangle.kind(c, b, a)}", "6 #{a},#{b},#{c}:#{kind}")

    '直角三角形, その他 2' : (err, browser, status) ->
      for [a, b, c, kind] in Triangle_cases.cases_result_misc_1
        # a,b,c の順番に kind() が依存していないことをチェックする
        assert.equal("1 #{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "1 #{a},#{b},#{c}:#{kind}")
        assert.equal("2 #{a},#{b},#{c}:#{@triangle.kind(a, c, b)}", "2 #{a},#{b},#{c}:#{kind}")
        assert.equal("3 #{a},#{b},#{c}:#{@triangle.kind(b, a, c)}", "3 #{a},#{b},#{c}:#{kind}")
        assert.equal("4 #{a},#{b},#{c}:#{@triangle.kind(b, c, a)}", "4 #{a},#{b},#{c}:#{kind}")
        assert.equal("5 #{a},#{b},#{c}:#{@triangle.kind(c, a, b)}", "5 #{a},#{b},#{c}:#{kind}")
        assert.equal("6 #{a},#{b},#{c}:#{@triangle.kind(c, b, a)}", "6 #{a},#{b},#{c}:#{kind}")

  "最大・最小の整数":
    topic: () ->
      @triangle = new Triangle_bad()

    '最小の整数' : (err, browser, status) ->
      assert.equal(Triangle_bad.MIN_INT, -100)
    '最大の整数' : (err, browser, status) ->
      assert.equal(Triangle_bad.MAX_INT, 100)

  "最大 - 1":
    topic: () ->
      @triangle = new Triangle_bad()
      @max = Triangle_bad.MAX_INT
      @max_prev = @max - 1
      @max_next = @max + 1

      @min = Triangle_bad.MIN_INT
      @min_prev = @min - 1
      @min_next = @min + 1

    'x' : (err, browser, status) ->
      [a, b, c] = [@max_next, @max, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG-INPUT")

      [a, b, c] = [@max, @max, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

      [a, b, c] = [@max_prev, @max, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:ISO")

      [a, b, c] = [@max_prev, @max_prev, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:ISO")

      [a, b, c] = [@max_prev, @max_prev, @max_prev]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

      [a, b, c] = [@max/2, @max/2, @max/2]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

      [a, b, c] = [@max/2 + 1, @max/2 + 1, @max/2 + 1]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

      [a, b, c] = [@max/2 + 1, @max/2, @max/2 - 1]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NORMAL")

      [a, b, c] = [@min, @max, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}", "#{a},#{b},#{c}:NG")

      [a, b, c] = [-1, @max, @max]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

      [a, b, c] = [1, 1, @min]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

      [a, b, c] = [1, 0, @min]
      assert.equal("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

.export module

#--- End of File ---
