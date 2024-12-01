pub fn read_input_of_day(day : Int) -> Array[String] {
  let content = @fs.read_file_to_string?(path="./assets/day\{day}/input.txt").unwrap()
  content.trim_space().split("\n").to_array()
}
