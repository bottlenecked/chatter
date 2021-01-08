# Chatter

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Instantiate postgres & admin tool by running `docker-compose up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Tests
Feature tests are using Wallaby which in turn uses the `chromedriver` executable for issueing commands against the browser.

### Chromedriver MacOS setup
```bash
brew install chromedriver --cask
xattr -d com.apple.quarantine /usr/local/bin/chromedriver
```
**IMPORTANT**: make sure that `chromedriver --version` matches your chrome version (menubar -> Chrome -> About Google Chrome) or you're in for some real surprises

_Note_: if you're getting HTTPoison errors similar to

```bash
** (RuntimeError) Wallaby had an internal issue with HTTPoison:
%HTTPoison.Error{id: nil, reason: :checkout_timeout}
%HTTPoison.Error{id: nil, reason: :econnrefused}
%HTTPoison.Error{id: nil, reason: :closed}
```

then try running your tests with `mix test --max-cases=1`. This will avoid running tests in parallel (wallaby has an httppoison pooling issue)