pub fn read_input_of_day(day : Int) -> Array[String] {
  let day = if day < 10 { "0\{day}" } else { day.to_string() }
  let content = @fs.read_file_to_string?(path="./assets/day\{day}/input.txt").unwrap()
  content.trim_space().split("\n").to_array()
}
