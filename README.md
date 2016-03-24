# MarsRover

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mars_rover`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation
Install bundle gem and run bundle install in working directory.

```ruby
gem install bundle && bundle
```
Build and install the gem.

```ruby
rake install
```

## Usage
After the installation simply run the program with command:

```ruby
marsrover
```
The program will read the input from **STDIN** and moves the mars rover according to given instruction string.

First line of input should be top right co-ordinate of mars map.

The bottom left is always assumed to be (0,0).

The second line should be the number of mars rover (test case) to be expected.

The second line is followed by the current postion of mars rover and the move instructions.


Allowed moves are:

    R : Turns the direction of rover to right
    L : Turns the direction of rover to left
    M : Moves the rover one unit to current direction


For an example:

    Test Input:
    5 5
    2
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM
    Expected Output:
    1 3 N
    5 1 E


Get the help message with:

```ruby
marsrover -h
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bishwahng/mars_rover. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

