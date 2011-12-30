###
# ３つの整数をあたえたら、それを偏の長さとする三角形の形状を判定する。
#　　kind(a,b,c)
#       "NG"        三角形ができない, 入力値が範囲外
#       "REGULAR"   正三角形
#       "ISO"       二等辺三角形
#       "NORMAL"    一般の三角形
#
#    MAX_INT  入力妥当な最大値
#    MIN_ING  入力打倒な最小値
###

class Triangle_bad
  @MAX_INT: 100
  @MIN_INT: -100

  kind: (a, b, c) ->
    if (a < Triangle_bad.MIN_INT) || (Triangle_bad.MAX_INT < a) || (b < Triangle_bad.MIN_INT) || (Triangle_bad.MAX_INT < b) || (c < Triangle_bad.MIN_INT < b) || (Triangle_bad.MAX_INT < c)
      return 'NG-INPUT'

    if (a <= 0 ) || (b <= 0) || (c <= 0)
      return 'NG'

    # 計算途中で overflow/underflow することがあるのと補足する。
    if (a + b > Triangle_bad.MAX_INT) || (b + c > Triangle_bad.MAX_INT) || ( c + a > Triangle_bad.MAX_INT)
      throw "overflow! a + b = #{a + b}, b + c = #{b + c}, c + a = #{c + a}"
    if (a + b < Triangle_bad.MIN_INT) || (b + c < Triangle_bad.MIN_INT) || ( c + a < Triangle_bad.MIN_INT)
      throw "underflow! a + b = #{a + b}, b + c = #{b + c}, c + a = #{c + a}"

    if ( a + b <= c) || (b + c <= a) || ( c + a<= b)
      return 'NG'
    else if (a == b) && (a == c)
      return 'REGULAR'
    else if (a == b) || ( b == c) || (c == a)
      return 'ISO'

    return 'NORMAL'

module.exports = Triangle_bad

