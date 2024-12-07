///| parse String to Int
pub fn parse_int(t : String) -> Int {
  @strconv.parse_int?(t).unwrap()
}

///| parse String to Int64
pub fn parse_int64(t : String) -> Int64 {
  @strconv.parse_int64?(t).unwrap()
}

///| parse String to a list of Int, with splitor " "
pub fn parse_ints(t : String, split~ : String = " ") -> Array[Int] {
  t
  .split(split)
  .filter(fn { t => t.length() > 0 })
  .map(fn { t => parse_int(t) })
  .to_array()
}

///| parse String to a list of Int64, with splitor " "
pub fn parse_int64s(t : String, split~ : String = " ") -> Array[Int64] {
  t
  .split(split)
  .filter(fn { t => t.length() > 0 })
  .map(fn { t => parse_int64(t) })
  .to_array()
}
