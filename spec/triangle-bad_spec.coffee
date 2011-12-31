###
#
#
###

Triangle_bad = require '../src/triangle-bad'
Triangle_cases = require './triangle_cases'

cases_result_555 = Triangle_cases.cases_result_555

ans = (a,b,c) ->
  cases_result_555["#{a},#{b},#{c}"]

describe 'Triangle_bad:正数と０', ->
  beforeEach ->
    @triangle = new Triangle_bad()

  it 'Triangle:負の数', ->
    for a in [0..4]
      for b in [0..4]
        for c in [0..4]
          # kind() の結果をチェックする。
          expect("#{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("#{a},#{b},#{c}:#{ans(a,b,c)}")

          # a,b,c の順番に kind() が依存していないことをチェックする
          expect("1 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("1 #{a},#{b},#{c}:#{@triangle.kind(a,c,b)}")
          expect("2 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("2 #{a},#{b},#{c}:#{@triangle.kind(b,a,c)}")
          expect("3 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("3 #{a},#{b},#{c}:#{@triangle.kind(b,c,a)}")
          expect("4 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("4 #{a},#{b},#{c}:#{@triangle.kind(c,a,b)}")
          expect("5 #{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("5 #{a},#{b},#{c}:#{@triangle.kind(c,b,a)}")

describe 'Triangle_bad:最大・最小の整数', ->
  beforeEach ->
    @triangle = new Triangle_bad()

  it '最小の整数', ->
    expect(Triangle_bad.MIN_INT).toEqual(-100)
  it '最大の整数', ->
    expect(Triangle_bad.MAX_INT).toEqual(100)

describe 'Triangle_bad:最大 - 1', ->
  beforeEach ->
    @triangle = new Triangle_bad()
    @max = Triangle_bad.MAX_INT
    @max_prev = @max - 1
    @max_next = @max + 1

    @min = Triangle_bad.MIN_INT
    @min_prev = @min - 1
    @min_next = @min + 1

  it 'x', ->
    [a, b, c] = [@max, @max, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max_prev, @max, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:ISO")

    [a, b, c] = [@max_prev, @max_prev, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:ISO")

    [a, b, c] = [@max_prev, @max_prev, @max_prev]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max_next, @max, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:NG-INPUT")

    [a, b, c] = [@max/2, @max/2, @max/2]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max/2 + 1, @max/2 + 1, @max/2 + 1]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:REGULAR")

    [a, b, c] = [@max/2 + 1, @max/2, @max/2 - 1]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:NORMAL")

    [a, b, c] = [@min, @max, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b ,c)}").toEqual("#{a},#{b},#{c}:NG")

    [a, b, c] = [-1, @max, @max]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:NG")

    [a, b, c] = [1, 1, @min]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:NG")

    [a, b, c] = [1, 0, @min]
    expect("#{a},#{b},#{c}:#{@triangle.kind(a, b, c)}").toEqual("#{a},#{b},#{c}:NG")

#--- End of File ---
