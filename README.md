# unique

Prevents a block from returning the same object twice.

## Setup

Add it to your project's `Gemfile` (preferred) or

```sh
$ gem install unique
```

## Usage

require 'unique'

Unique.next! do
  #...
end

### example
```ruby
1.9.3-p551 :029 > Unique.next!{ rand(0..5) }
 => 1
1.9.3-p551 :030 > Unique.next!{ rand(0..5) }
 => 5
1.9.3-p551 :031 > Unique.next!{ rand(0..5) }
 => 4
1.9.3-p551 :032 > Unique.next!{ rand(0..5) }
 => 2
1.9.3-p551 :033 > Unique.next!{ rand(0..5) }
 => 3
1.9.3-p551 :034 > Unique.next!{ rand(0..5) }
 => 0
1.9.3-p551 :035 > Unique.next!{ rand(0..5) }
Unique::NoUniqueValues: An unused, unique object could not be found (["(irb)", 35])
  from (irb):21:in `block in next'
  from (irb):19:in `loop'
  from (irb):19:in `next'
  from (irb):35
  from /home/devbox/.rvm/rubies/ruby-1.9.3-p551/bin/irb:12:in `<main>'
1.9.3-p551 :036 >
```

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434)

## License
[ISC](https://github.com/b264/unique/blob/master/LICENSE.txt)
