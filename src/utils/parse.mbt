pub fn parse_int(t : String) -> Int {
  @strconv.parse_int?(t).unwrap()
}

pub fn parse_ints(t : String) -> Array[Int] {
  t
  .split(" ")
  .filter(fn { t => t.length() > 0 })
  .map(fn { t => parse_int(t) })
  .to_array()
}
