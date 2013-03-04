###
# ３つの整数をあたえたら、それを偏の長さとする三角形の形状を判定する。
#　　kind(a,b,c)
#       "NG"        三角形ができない, 入力値が範囲外
#       "REGULAR"   正三角形
#       "ISO"       二等辺三角形
#       "NORMAL"    一般の三角形
#       "RIGHT"     直角三角形
#       "NG-INPUT"  エラー, 入力値が範囲外
#
#    Triangle.MAX_INT  入力妥当な最大値
#    Triangle.MIN_ING  入力打倒な最小値
###

Triangle_base = require './triangle_base'

kind = (a, b, c) ->
  if (a < Triangle.MIN_INT) || (Triangle.MAX_INT < a) || (b < Triangle.MIN_INT) || (Triangle.MAX_INT < b) || (c < Triangle.MIN_INT) || (Triangle.MAX_INT < c)
    return 'NG-INPUT'

  return 'NG' if (a <= 0 ) || (b <= 0) || (c <= 0)

  return 'REGULAR' if (a == b) && (a == c)

  # 計算途中で overflow することがあるのを補足する。
  if (c - b < Triangle.MIN_INT) || (a - c < Triangle.MIN_INT) || (b - a < Triangle.MIN_INT)
    throw "overflow! c - b = #{c - b}, a - c = #{a - c}, b - a = #{b - a}"
  if (c - a > Triangle.MAX_INT) || (a - c > Triangle.MAX_INT) || (b - a > Triangle.MAX_INT)
    throw "overflow! c - a = #{c - a}, a - c = #{a - c}, b - a = #{b - a}"

  if ( a <= c - b) || (b <= a - c) || ( c <= b - a)
    # a + b は [MIN_INF, MAX_ONG]を超えることがあるので (a + b < c) の判定は (a < c -b) とする。
    # c - b は [MIN_INT, MAX_INT] を超えることはない。
    return 'NG'
  else
    # See - http://www.nag-j.co.jp/nagcourse/numerical/quality/section3/section3.htm
    #     > 数値解の品質：数値解に関する問題点

    # ソートする
    [a, b, c]  = [a, b, c].sort (a, b) -> (a - b)

    s = a + b
    c0 = Math.sqrt( (a/s) * (a/s) + (b/s) * (b/s)) * s
    if (Math.abs(c0 - c) < Triangle.DELTA)
      return 'RIGHT'
    else if (a == b) || ( b == c) || (c == a)
      return 'ISO'

  return 'NORMAL'


class Triangle extends Triangle_base
  kind: kind

module.exports = Triangle
module.exports.kind = kind

