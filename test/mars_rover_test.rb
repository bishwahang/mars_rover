require 'test_helper'

class MarsRoverTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MarsRover::VERSION
  end

  def test_that_it_executes_the_instruction_correctly
    with_stdin do |console|
      console.puts "5 5"
      console.puts "2"
      console.puts "1 2 N"
      console.puts "LMLMLMLMM"
      console.puts "3 3 E"
      console.puts "MMRMMRMRRM"
      assert_output("1 3 N\n5 1 E\n",nil) { MarsRover.run }
    end
  end

  def test_that_it_raises_invalid_instruction
    with_stdin do |console|
      console.puts "5 5"
      console.puts "1"
      console.puts "1 2 N"
      console.puts "Q"
      exception = assert_raises(Exception) { MarsRover.run }
      assert_match(/invalid instruction/, exception.message)
    end
  end

  def test_that_it_raises_invalid_move
    with_stdin do |console|
      console.puts "2 2"
      console.puts "1"
      console.puts "0 0 E"
      console.puts "MMM"
      exception = assert_raises(Exception) { MarsRover.run }
      assert_match(/invalid move/, exception.message)
    end
    with_stdin do |console|
      console.puts "2 2"
      console.puts "1"
      console.puts "0 0 W"
      console.puts "M"
      exception = assert_raises(Exception) { MarsRover.run }
      assert_match(/invalid move/, exception.message)
    end
  end


  # source: http://stackoverflow.com/a/16950202/2537705
  def with_stdin
    stdin = $stdin             # remember $stdin
    $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
    yield write                # pass pipe's "write end" to block
  ensure
    write.close                # close pipe
    $stdin = stdin             # restore $stdin
  end
end
