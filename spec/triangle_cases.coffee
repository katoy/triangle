###
#
#
###

class Triangle_cases
  # [0..4] x [0..4] x [0..4] の網羅テスト
  @cases_result_555 :  {
    '0,0,0': 'NG'
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

  # See
  #  - http://www2.nkansai.ne.jp/users/yoshioka/pitago.htm
  #   > 三平方の定理

  # 直角三角形、その他
  @cases_result_misc_0 :  [
      [90,90,90,   'REGULAR']
    , [90,90,1,    'ISO']
    , [90,45,45,   'NG']
    ]

  @cases_result_misc_1 :  [
      [3,4,5,      'RIGHT']
    , [5,12,13,    'RIGHT']
    , [6,8,10,     'RIGHT']
    , [7,24,25,    'RIGHT']
    , [8,15,17,    'RIGHT']
    , [9,12,15,    'RIGHT']
    , [9,40,41,    'RIGHT']
    , [10,24,26,   'RIGHT']
    , [11,60,61,   'RIGHT']
    , [12,16,20,   'RIGHT']
    , [12,35,37,   'RIGHT']
    , [13,84,85,   'RIGHT']
    , [14,48,50,   'RIGHT']
    , [15,20,25,   'RIGHT']
    , [15,36,39,   'RIGHT']
    , [15,112,113, 'NG-INPUT'] # RIBHT
    , [16,63,65,   'RIGHT']
    , [17,144,145, 'NG-INPUT'] # RIGHT
    , [18,24,30,   'RIGHT']
    , [18,80,82,   'RIGHT']
    , [19,180,181, 'NG-INPUT'] # RIGHT
    , [20,21,29,   'RIGHT']
    , [20,48,52,   'RIGHT']
    , [20,99,101,  'NG-INPUT']
    , [21,28,35,   'RIGHT']
    , [21,72,75,   'RIGHT']
    , [22,120,122, 'NG-INPUT'] # RIGHT
    , [24,32,40,   'RIGHT']
    , [24,45,51,   'RIGHT']
    , [24,70,74,   'RIGHT']
    , [24,143,145, 'NG-INPUT'] # RIGHT
    , [25,60,65,   'RIGHT']
    , [26,168,170, 'NG-INPUT'] # RIGHT
    , [27,36,45,   'RIGHT']
    , [27,120,123, 'NG-INPUT'] # RIGHT
    , [28,45,53,   'RIGHT']
    , [28,96,100,  'RIGHT']
    , [28,195,197, 'NG-INPUT'] # RIGHT
    , [30,40,50,   'RIGHT']
  ]

module.exports = Triangle_cases

#--- End of File ---
