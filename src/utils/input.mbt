pub fn read_input_of_day(day : Int, example~ : Bool = false) -> Array[String] {
  let day = if day < 10 { "0\{day}" } else { day.to_string() }
  let file = if example { "example.txt" } else { "input.txt" }
  let content = @fs.read_file_to_string?(path="./assets/day\{day}/\{file}").unwrap()
  content.trim_space().split("\n").to_array()
}
