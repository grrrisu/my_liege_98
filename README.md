## README

### Development

#### Installation

```
> brew install redis
> brew install postgresql
> bin/setup
```

#### Run

```
> bundle exec sidekiq -C config/sidekiq.yml
> bundle exec rails server
```
