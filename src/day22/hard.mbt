///|
pub fn solve_day22_hard(input : Input) -> Int {
  let len = 2001
  let prices = input.map(fn {
    line => {
      let arr = Array::make(len, 0)
      let mut sec = line
      for i in 0..<len {
        arr[i] = (sec % 10).to_int()
        sec = generate(sec)
      }
      arr
    }
  })
  let delta = prices.map(fn {
    prices => {
      let arr = Array::make(len, 0)
      for i in 1..<len {
        arr[i] = prices[i] - prices[i - 1]
      }
      arr
    }
  })
  let mut ans = 0
  let all = Map::new()
  for i in 0..<prices.length() {
    let prices = prices[i]
    let delta = delta[i]
    let visited = Map::new()
    for i in 4..<len {
      let seq = (delta[i - 3], delta[i - 2], delta[i - 1], delta[i])
      if not(visited.contains(seq)) {
        visited.set(seq, prices[i])
        all.set(seq, all.get_or_default(seq, 0) + prices[i])
      }
    }
  }
  for _seq, value in all {
    // if value > ans {
    //   println("\{_seq} : \{value}")
    // }
    ans = @math.maximum(ans, value)
  }
  ans
}
