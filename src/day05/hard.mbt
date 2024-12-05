///|
pub fn solve_day05_hard(input : Input) -> Output {
  let mut ans = 0
  let edges = input.0
  let updates = input.1
  let banned = @hashset.new()
  edges.each(fn { edge => banned.add((edge.1, edge.0)) })

  //
  fn topo_sort(update : Array[Int]) -> Array[Int] {
    let nodes = @hashset.from_array(update)
    let in_degree = Map::from_iter(update.iter().map(fn { a => (a, 0) }))
    edges.each(
      fn {
        edge =>
          if nodes.contains(edge.0) && nodes.contains(edge.1) {
            in_degree[edge.1] = in_degree.get_or_default(edge.1, 0) + 1
          }
      },
    )
    let order = []
    let queue = @queue.new()
    nodes.each(
      fn {
        node => if in_degree.get_or_default(node, 0) == 0 { queue.push(node) }
      },
    )
    while not(queue.is_empty()) {
      let cur = queue.pop().unwrap()
      order.push(cur)
      edges.each(
        fn {
          edge =>
            if edge.0 == cur {
              in_degree[edge.1] = in_degree.get_or_default(edge.1, 0) - 1
              if in_degree.get_or_default(edge.1, 0) == 0 {
                queue.push(edge.1)
              }
            }
        },
      )
    }
    order
  }

  //
  updates.each(
    fn {
      update => {
        let mut flag = true
        for i = 0; i < update.length() && flag; i = i + 1 {
          for j = i + 1; j < update.length(); j = j + 1 {
            if banned.contains((update[i], update[j])) {
              flag = false
              break
            }
          }
        }
        if not(flag) {
          let update = topo_sort(update)
          ans += update[update.length() / 2]
        }
      }
    },
  )
  ans
}
