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

class Triangle
  @MAX_INT: 100
  @MIN_INT: -100

  kind: (a, b, c) ->
    if (a < Triangle.MIN_INT) || (Triangle.MAX_INT < a) || (b < Triangle.MIN_INT) || (Triangle.MAX_INT < b) || (c < Triangle.MIN_INT) || (Triangle.MAX_INT < c)
      return 'NG-INPUT'

    if (a <= 0 ) || (b <= 0) || (c <= 0)
      return 'NG'

    # 計算途中で overflow/inder することがあるのと補足する。
    if (c - b < Triangle.MIN_INT) || (a - c < Triangle.MIN_INT) || (b - a < Triangle.MIN_INT)
      throw "underflow! c - a = #{c - a}, a - c = #{a - c}, b - a = #{b - a}"
    if (c - a > Triangle.MAX_INT) || (a - c > Triangle.MAX_INT) || (b - a > Triangle.MAX_INT)
      throw "underflow! c - a = #{c - a}, a - c = #{a - c}, b - a = #{b - a}"


    if ( a <= c - b) || (b <= a - c) || ( c <= b - a)
      # a + b は [MIN_INF, MAX_ONG]を超えることがあるので (a + b < c) の判定は (a < c -b) とする。
      # c - b は [MIN_INT, MAX_INT] を超えることはない。
      return 'NG'
    else if (a == b) && (a == c)
      return 'REGULAR'
    else if (a == b) || ( b == c) || (c == a)
      return 'ISO'
    return 'NORMAL'

module.exports = Triangle

console.log (new Triangle).kind(0,0,0)