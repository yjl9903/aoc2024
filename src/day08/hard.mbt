///|
pub fn solve_day08_hard(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let anti = @hashset.new()
  let atena : Map[Char, Array[(Int, Int)]] = Map::new()
  for i in 0..<n {
    for j in 0..<m {
      if input[i][j] != '.' {
        match atena.get(input[i][j]) {
          Some(arr) => arr.push((i, j))
          None => atena.set(input[i][j], [(i, j)])
        }
      }
    }
  }
  for pos in atena.values() {
    for i in 0..<pos.length() {
      for j in (i + 1)..<pos.length() {
        let lhs = pos[i]
        let rhs = pos[j]
        let dx = rhs.0 - lhs.0
        let dy = rhs.1 - lhs.1

        //
        let mut first = (lhs.0, lhs.1)
        anti.add(first)
        while true {
          first = (first.0 - dx, first.1 - dy)
          match input.get(first) {
            Some(_) => {
              anti.add(first)
              input[first.0][first.1] = '#'
            }
            None => break
          }
        }

        //
        let mut second = (rhs.0, rhs.1)
        anti.add(second)
        while true {
          second = (second.0 + dx, second.1 + dy)
          match input.get(second) {
            Some(_) => {
              anti.add(second)
              input[second.0][second.1] = '#'
            }
            None => break
          }
        }
      }
    }
  }
  anti.size()
}
