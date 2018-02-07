# Casper::Unique::File

Helper to use mkstemp on MRI ruby. This gem provides the create module method that creates a uniquely named file inside the specified folder. 
The filename has six characters and the created file is empty. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'casper-unique-file'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install casper-unique-file

## Usage

Just call Casper::Unique::File::create passing the name of the folder where the file should be created and the extension if needed. Returns the unique file name. On failure returns nil.
```sh
[ casper-unique-file ⇣⇡ master ᚶ ] $ ./bin/console
2.1.5 :001 > Casper::Unique::File::create('/tmp', '.pdf')
 => "/tmp/ZtkM4u.pdf"
2.1.5 :002 >
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake clean compile` compile the C code. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/casper2020/casper-unique-file.
