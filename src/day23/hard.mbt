///|
pub fn solve_day23_hard(input : Input) -> String {
  let nodes = @hashset.new()
  input.each(fn {
    l => {
      nodes.add(l.0)
      nodes.add(l.1)
    }
  })
  let edges = @hashset.from_array(input)
  let rng = @random.new()
  fn rand(upper : Int) -> Int {
    rng.int(limit=upper)
  }

  let mut ans = []
  for _ in 0..<10000 {
    let nodes = nodes.iter().to_array()
    let nodes = nodes.shuffle(rand~)
    let cur = []
    for node in nodes {
      if cur.is_empty() {
        cur.push(node)
      } else {
        let mut flag = true
        for prev in cur {
          if not(edges.contains((prev, node))) &&
            not(edges.contains((node, prev))) {
            flag = false
            break
          }
        }
        if flag {
          cur.push(node)
        }
      }
    }
    if cur.length() > ans.length() {
      ans = cur
    }
  }
  ans.sort()
  String::concat(ans, separator=",")
}
