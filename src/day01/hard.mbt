///|
pub fn solve_day01_hard(input : Input) -> Int {
  let map = Map::new()
  input.each(
    fn {
      el =>
        if map.contains(el.1) {
          map[el.1] = map[el.1].unwrap() + 1
        } else {
          map[el.1] = 1
        }
    },
  )
  let mut ans = 0
  input.each(
    fn { el => if map.contains(el.0) { ans += map[el.0].unwrap() * el.0 } },
  )
  ans
}
