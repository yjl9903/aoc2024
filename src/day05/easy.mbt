///|
pub fn solve_day05_easy(input : Input) -> Output {
  let mut ans = 0
  let edges = input.0
  let updates = input.1
  let banned = @hashset.new()
  edges.each(fn { edge => banned.add((edge.1, edge.0)) })
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
        if flag {
          ans += update[update.length() / 2]
        }
      }
    },
  )
  ans
}
