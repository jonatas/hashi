# Hashi

This project is a prototype to process a simple image and plot dots instead of
image to generate a structure to produce some hashi art.

I'm collecting chopsticks and I have hundreds of them now. I'd like to get an
image and make holes to attach them.

## Installation

    $ git clone git@github.com:jonatas/hashi.git

## Usage

    $ cd hashi
    $ bin/hashi-dots image.jpg

It will generate another `image-dots.jpg` and will replace all not white pixels
with black circles depending on the parameters you use. The default circle ratio
is 10 and the padding is 30.

    $ bin/hashi-dots image.jpg 5 25

## Development

This is a experimental project. Do not loose your time here. I don't have specs
and it's just a prototype.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jonatas/hashi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hashi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hashi/blob/master/CODE_OF_CONDUCT.md).
