###
#
#
###
assert = require 'assert'
Triangle = require '../src/triangle.js'
Triangle_cases = require '../spec/triangle_cases'
util = require 'util'

ans = (a,b,c) ->
  # cases_result_555["#{a},#{b},#{c}"]
  Triangle_cases.cases_result_555[[a,b,c]]

describe "function", ->
  it "should has function kind", (done) ->
    assert.ok(Triangle.kind)
    done()

describe  "正数と０", ->
  it "should [0..4] * [0..4] * [0..4]", (done) ->
    assert.ok(Triangle.kind)
    for a in [0..4]
      for b in [0..4]
        for c in [0..4]
          # kind() の結果をチェックする。
          assert.equal("0 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "0 #{a},#{b},#{c}:#{ans(a,c,b)}")

          # a,b,c の順番に kind() が依存していないことをチェックする
          assert.equal("1 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "1 #{a},#{b},#{c}:#{Triangle.kind(a,c,b)}")
          assert.equal("2 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "2 #{a},#{b},#{c}:#{Triangle.kind(b,a,c)}")
          assert.equal("3 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "3 #{a},#{b},#{c}:#{Triangle.kind(b,c,a)}")
          assert.equal("4 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "4 #{a},#{b},#{c}:#{Triangle.kind(c,a,b)}")
          assert.equal("5 #{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "5 #{a},#{b},#{c}:#{Triangle.kind(c,b,a)}")

    done() 

describe "直角三角形, その他", ->
  it "直角三角形, その他 1", (done) ->
    for [a,b,c,kind] in Triangle_cases.cases_result_misc_0
      # a,b,c の順番に kind() が依存していないことをチェックする
      assert.equal("1 #{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "1 #{a},#{b},#{c}:#{kind}")
      assert.equal("2 #{a},#{b},#{c}:#{Triangle.kind(a, c, b)}", "2 #{a},#{b},#{c}:#{kind}")
      assert.equal("3 #{a},#{b},#{c}:#{Triangle.kind(b, a, c)}", "3 #{a},#{b},#{c}:#{kind}")
      assert.equal("4 #{a},#{b},#{c}:#{Triangle.kind(b, c, a)}", "4 #{a},#{b},#{c}:#{kind}")
      assert.equal("5 #{a},#{b},#{c}:#{Triangle.kind(c, a, b)}", "5 #{a},#{b},#{c}:#{kind}")
      assert.equal("6 #{a},#{b},#{c}:#{Triangle.kind(c, b, a)}", "6 #{a},#{b},#{c}:#{kind}")
    done()

  it '直角三角形, その他 2', (done) ->
    for [a,b,c,kind] in Triangle_cases.cases_result_misc_1
      # a,b,c の順番に kind() が依存していないことをチェックする
      assert.equal("1 #{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "1 #{a},#{b},#{c}:#{kind}")
      assert.equal("2 #{a},#{b},#{c}:#{Triangle.kind(a, c, b)}", "2 #{a},#{b},#{c}:#{kind}")
      assert.equal("3 #{a},#{b},#{c}:#{Triangle.kind(b, a, c)}", "3 #{a},#{b},#{c}:#{kind}")
      assert.equal("4 #{a},#{b},#{c}:#{Triangle.kind(b, c, a)}", "4 #{a},#{b},#{c}:#{kind}")
      assert.equal("5 #{a},#{b},#{c}:#{Triangle.kind(c, a, b)}", "5 #{a},#{b},#{c}:#{kind}")
      assert.equal("6 #{a},#{b},#{c}:#{Triangle.kind(c, b, a)}", "6 #{a},#{b},#{c}:#{kind}")
    done()

describe "最大・最小の整数",  ->
  it '最小の整数', (done)  ->
    assert.equal(Triangle.MIN_INT, -100)
    done()      

  it '最大の整数', (done) ->
    assert.equal(Triangle.MAX_INT, 100)
    done()

describe "Triangle:最大 - 1", ->

  it 'x', (done) ->
    @max = Triangle.MAX_INT
    @max_prev = @max - 1
    @max_next = @max + 1
    @min = Triangle.MIN_INT

    [a, b, c] = [@max_next, @max, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG-INPUT")

    [a, b, c] = [@max, @max, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max_prev, @max, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:ISO")

    [a, b, c] = [@max_prev, @max_prev, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:ISO")

    [a, b, c] = [@max_prev, @max_prev, @max_prev]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max/2, @max/2, @max/2]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max/2 + 1, @max/2 + 1, @max/2 + 1]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max/2 + 1, @max/2, @max/2 - 1]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NORMAL")

    [a, b, c] = [@min, @max, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b ,c)}", "#{a},#{b},#{c}:NG")

    [a, b, c] = [-1, @max, @max]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

    [a, b, c] = [1, 1, @min]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

    [a, b, c] = [1, 0, @min]
    assert.equal("#{a},#{b},#{c}:#{Triangle.kind(a, b, c)}", "#{a},#{b},#{c}:NG")

    done()

#--- End of File ---
