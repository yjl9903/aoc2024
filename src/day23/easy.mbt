///|
pub fn solve_day23_easy(input : Input) -> Output {
  let nodes = @hashset.new()
  input.each(fn {
    l => {
      nodes.add(l.0)
      nodes.add(l.1)
    }
  })
  let nodes = nodes.iter().to_array()
  let edges = @hashset.from_array(input)
  let mut ans = 0
  for x in 0..<nodes.length() {
    for y in (x + 1)..<nodes.length() {
      for z in (y + 1)..<nodes.length() {
        let x = nodes[x]
        let y = nodes[y]
        let z = nodes[z]
        if x.starts_with("t") || y.starts_with("t") || z.starts_with("t") {
          let c1 = edges.contains((x, y)) || edges.contains((y, x))
          let c2 = edges.contains((x, z)) || edges.contains((z, x))
          let c3 = edges.contains((y, z)) || edges.contains((z, y))
          if c1 && c2 && c3 {
            ans += 1
          }
        }
      }
    }
  }
  ans
}
