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

class Triangle_bad extends Triangle_base

  kind: (a, b, c) ->
    if (a < Triangle_bad.MIN_INT) || (Triangle_bad.MAX_INT < a) || (b < Triangle_bad.MIN_INT) || (Triangle_bad.MAX_INT < b) || (c < Triangle_bad.MIN_INT < b) || (Triangle_bad.MAX_INT < c)
      return 'NG-INPUT'

    if (a <= 0 ) || (b <= 0) || (c <= 0)
      return 'NG'

    # 計算途中で overflow することがあるのを補足する。
    if (a + b > Triangle_bad.MAX_INT) || (b + c > Triangle_bad.MAX_INT) || ( c + a > Triangle_bad.MAX_INT)
      throw "overflow! a + b = #{a + b}, b + c = #{b + c}, c + a = #{c + a}"
    if (a * a > Triangle_bad.MAX_INT) || (b * b > Triangle_bad.MAX_INT) || ( c * c > Triangle_bad.MAX_INT)
      throw "overflow! a^2 = #{a * a}, b^2 = #{b * b}, c^2 = #{c*c}, a^2 + b^2 = #{a*a + b*b}"
    if (a + b < Triangle_bad.MIN_INT) || (b + c < Triangle_bad.MIN_INT) || ( c + a < Triangle_bad.MIN_INT)
      throw "overflow! a + b = #{a + b}, b + c = #{b + c}, c + a = #{c + a}"

    if ( a + b <= c) || (b + c <= a) || ( c + a<= b)
      return 'NG'
    else if (a == b) && (a == c)
      return 'REGULAR'
    else if ( a*a + b*b == c*c)
      return 'RIGHT'
    else if (a == b) || ( b == c) || (c == a)
      return 'ISO'

    return 'NORMAL'

module.exports = Triangle_bad
