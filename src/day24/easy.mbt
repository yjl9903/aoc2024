///|
pub fn solve_day24_easy(input : Input) -> Output {
  let out = run(input)
  let mut ans = 0L
  for value in out {
    ans = ans * 2L + value.to_int64()
  }
  ans
}

///|
fn run(input : Input) -> Array[Int] {
  let map = Map::new()
  input.0.each(fn { line => map.set(line.0, line.1) })
  while true {
    let mut changed = false
    for g in input.1 {
      let v1 = map.get(g.0)
      let v2 = map.get(g.2)
      let v3 = map.get(g.3)
      match (v1, v2, v3) {
        (Some(v1), Some(v2), None) => {
          let out = match g.1 {
            AND => v1 & v2
            OR => v1 | v2
            XOR => v1 ^ v2
          }
          map.set(g.3, out)
          changed = true
        }
        _ => ()
      }
    }
    if not(changed) {
      break
    }
  }
  let res = @sorted_map.new()
  for key, value in map {
    if key.starts_with("z") {
      res[key] = value
    }
  }
  let out = []
  for value in res.values() {
    out.push(value)
  }
  out.rev()
}
