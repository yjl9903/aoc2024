///|
pub fn solve_day07_hard(input : Input) -> Output {
  let mut ans = 0L
  input.each(
    fn {
      equation => {
        let (lhs, rhs) = equation
        let n = rhs.length()
        let mut flag = false
        fn dfs(i : Int, sum : Int64) {
          if i == n {
            if sum == lhs {
              flag = true
            }
            return
          }
          if flag {
            return
          }
          dfs(i + 1, sum + rhs[i])
          dfs(i + 1, sum * rhs[i])
          match concat(sum, rhs[i]) {
            Some(v) => dfs(i + 1, v)
            None => ()
          }
        }

        dfs(1, rhs[0])
        if flag {
          ans += lhs
        }
      }
    },
  )
  ans
}

///|
fn concat(lhs : Int64, rhs : Int64) -> Int64? {
  match @strconv.parse_int64?(lhs.to_string() + rhs.to_string()) {
    Ok(v) => Some(v)
    _ => None
  }
}
