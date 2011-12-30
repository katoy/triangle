###
#
#
###

Triangle_bad = require '../src/triangle-bad'

cases_results555 = {
    '0,0,0': 'NG'
  , '0,0,1': 'NG'
  , '0,0,0': 'NG'
  , '0,0,1': 'NG'
  , '0,0,2': 'NG'
  , '0,0,3': 'NG'
  , '0,0,4': 'NG'
  , '0,1,0': 'NG'
  , '0,1,1': 'NG'
  , '0,1,2': 'NG'
  , '0,1,3': 'NG'
  , '0,1,4': 'NG'
  , '0,2,0': 'NG'
  , '0,2,1': 'NG'
  , '0,2,2': 'NG'
  , '0,2,3': 'NG'
  , '0,2,4': 'NG'
  , '0,3,0': 'NG'
  , '0,3,1': 'NG'
  , '0,3,2': 'NG'
  , '0,3,3': 'NG'
  , '0,3,4': 'NG'
  , '0,4,0': 'NG'
  , '0,4,1': 'NG'
  , '0,4,2': 'NG'
  , '0,4,3': 'NG'
  , '0,4,4': 'NG'

  , '1,0,0': 'NG'
  , '1,0,1': 'NG'
  , '1,0,2': 'NG'
  , '1,0,3': 'NG'
  , '1,0,4': 'NG'
  , '1,1,0': 'NG'
  , '1,1,1': 'REGULAR'
  , '1,1,2': 'NG'
  , '1,1,3': 'NG'
  , '1,1,4': 'NG'
  , '1,2,0': 'NG'
  , '1,2,1': 'NG'
  , '1,2,2': 'ISO'
  , '1,2,3': 'NG'
  , '1,2,4': 'NG'
  , '1,3,0': 'NG'
  , '1,3,1': 'NG'
  , '1,3,2': 'NG'
  , '1,3,3': 'ISO'
  , '1,3,4': 'NG'
  , '1,4,0': 'NG'
  , '1,4,1': 'NG'
  , '1,4,2': 'NG'
  , '1,4,3': 'NG'
  , '1,4,4': 'ISO'
  , '2,0,0': 'NG'
  , '2,0,1': 'NG'
  , '2,0,2': 'NG'
  , '2,0,3': 'NG'
  , '2,0,4': 'NG'
  , '2,1,0': 'NG'
  , '2,1,1': 'NG'
  , '2,1,2': 'ISO'
  , '2,1,3': 'NG'
  , '2,1,4': 'NG'
  , '2,2,0': 'NG'
  , '2,2,1': 'ISO'
  , '2,2,2': 'REGULAR'
  , '2,2,3': 'ISO'
  , '2,2,4': 'NG'
  , '2,3,0': 'NG'
  , '2,3,1': 'NG'
  , '2,3,2': 'ISO'
  , '2,3,3': 'ISO'
  , '2,3,4': 'NORMAL'
  , '2,4,0': 'NG'
  , '2,4,1': 'NG'
  , '2,4,2': 'NG'
  , '2,4,3': 'NORMAL'
  , '2,4,4': 'ISO'
  , '3,0,0': 'NG'
  , '3,0,1': 'NG'
  , '3,0,2': 'NG'
  , '3,0,3': 'NG'
  , '3,0,4': 'NG'
  , '3,1,0': 'NG'
  , '3,1,1': 'NG'
  , '3,1,2': 'NG'
  , '3,1,3': 'ISO'
  , '3,1,4': 'NG'
  , '3,2,0': 'NG'
  , '3,2,1': 'NG'
  , '3,2,2': 'ISO'
  , '3,2,3': 'ISO'
  , '3,2,4': 'NORMAL'
  , '3,3,0': 'NG'
  , '3,3,1': 'ISO'
  , '3,3,2': 'ISO'
  , '3,3,3': 'REGULAR'
  , '3,3,4': 'ISO'
  , '3,4,0': 'NG'
  , '3,4,1': 'NG'
  , '3,4,2': 'NORMAL'
  , '3,4,3': 'ISO'
  , '3,4,4': 'ISO'
  , '4,0,0': 'NG'
  , '4,0,1': 'NG'
  , '4,0,2': 'NG'
  , '4,0,3': 'NG'
  , '4,0,4': 'NG'
  , '4,1,0': 'NG'
  , '4,1,1': 'NG'
  , '4,1,2': 'NG'
  , '4,1,3': 'NG'
  , '4,1,4': 'ISO'
  , '4,2,0': 'NG'
  , '4,2,1': 'NG'
  , '4,2,2': 'NG'
  , '4,2,3': 'NORMAL'
  , '4,2,4': 'ISO'
  , '4,3,0': 'NG'
  , '4,3,1': 'NG'
  , '4,3,2': 'NORMAL'
  , '4,3,3': 'ISO'
  , '4,3,4': 'ISO'
  , '4,4,0': 'NG'
  , '4,4,1': 'ISO'
  , '4,4,2': 'ISO'
  , '4,4,3': 'ISO'
  , '4,4,4': 'REGULAR'
}

ans = (a,b,c) ->
  cases_results555["#{a},#{b},#{c}"]

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
