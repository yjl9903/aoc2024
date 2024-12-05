/// parse String to Int
pub fn parse_int(t : String) -> Int {
  @strconv.parse_int?(t).unwrap()
}

/// parse String to a list of Int, with splitor " "
pub fn parse_ints(t : String, split~ : String = " ") -> Array[Int] {
  t
  .split(split)
  .filter(fn { t => t.length() > 0 })
  .map(fn { t => parse_int(t) })
  .to_array()
}
