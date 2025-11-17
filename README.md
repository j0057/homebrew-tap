# J0057 Tap

## How do I install these formulae?

`brew install j0057/tap/<formula>`

Or `brew tap j0057/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "j0057/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Howto update bottle hashes

This outputs a snippet for inclusion into the recipe or whatever it's called:

```
brew install --build-bottle j0057/tap/...
brew bottle j0057/tap/...
```
