///|
pub fn solve_day03_easy(input : Input) -> Output {
  let mut ans = 0
  for input in input {
    let mut i = 0
    while i < input.length() {
      let j = i
      if i + 4 < input.length() &&
        input[i] == 'm' &&
        input[i + 1] == 'u' &&
        input[i + 2] == 'l' &&
        input[i + 3] == '(' {
        i += 4
        let mut flag = true
        let mut n1 = 0
        let mut n2 = 0
        while i < input.length() && input[i] != ',' {
          if '0' <= input[i] && input[i] <= '9' {
            n1 = n1 * 10 + (input[i].to_int() - '0'.to_int())
          } else {
            flag = false
            break
          }
          i += 1
        }
        if i < input.length() && input[i] == ',' {
          i += 1
          while i < input.length() && input[i] != ')' {
            if '0' <= input[i] && input[i] <= '9' {
              n2 = n2 * 10 + (input[i].to_int() - '0'.to_int())
            } else {
              flag = false
              break
            }
            i += 1
          }
          if i < input.length() && input[i] == ')' {
            i += 1
            if flag {
              // println("mul(\{n1},\{n2})")
              ans += n1 * n2
              continue
            }
          }
        }
      }
      i = j + 1
    }
  }
  ans
}
