///|
pub fn solve_day01_easy(input : Input) -> Output {
  let left = input.map(fn { i => i.0 })
  let right = input.map(fn { i => i.1 })
  left.sort()
  left.sort()
  right.sort()
  right.sort()
  let mut sum = 0
  for i = 0; i < input.length(); i = i + 1 {
    sum += @int.abs(left[i] - right[i])
  }
  sum
}
