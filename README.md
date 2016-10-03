[![Build Status](https://travis-ci.org/b264/unique.svg?branch=master)](https://travis-ci.org/b264/unique)
# unique

A lightweight Ruby gem with zero dependencies that prevents a block from returning the same object twice.

## Setup

Add it to your project's `Gemfile` (preferred) or

```sh
$ gem install unique
```

## Usage

```ruby
require 'unique'

Unique.next! do
  #...
end
```

### Example
```ruby
1.9.3-p551 :001 > Unique.next!{ rand(5) }
 => 0
1.9.3-p551 :002 > Unique.next!{ rand(5) }
 => 4
1.9.3-p551 :003 > Unique.next!{ rand(5) }
 => 1
1.9.3-p551 :004 > Unique.next!{ rand(5) }
 => 2
1.9.3-p551 :005 > Unique.next!{ rand(5) }
 => 3
1.9.3-p551 :006 > Unique.next!{ rand(5) }
Unique::NoUniqueObjects: An unused, unique object could not be found in 4096 tries (["(irb)", 6])
  from /home/devbox/code/unique/lib/unique.rb:22:in `block in next!'
  from /home/devbox/code/unique/lib/unique.rb:20:in `loop'
  from /home/devbox/code/unique/lib/unique.rb:20:in `next!'
  from (irb):6
  from /home/devbox/.rvm/rubies/ruby-1.9.3-p551/bin/irb:12:in `<main>'
1.9.3-p551 :007 >
```

## Config

The maximum number of times the block will be yielded looking for a unique object.  Default is 4096.

```ruby
Unique.max_tries= 10
```

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434)

## License
[ISC](https://github.com/b264/unique/blob/master/LICENSE.txt)
