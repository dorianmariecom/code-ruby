# Repository Guidelines

## Project Structure & Module Organization

- `lib/` — Core source. Classes live under the `Code` namespace and mirror paths (e.g., `lib/code/object/http.rb` → `Code::Object::Http`). Entry files: `lib/code.rb`, `lib/code-ruby.rb`.
- `bin/` — Executables and tooling shims: `bin/code` (CLI), `bin/rspec`, `bin/rubocop`, `bin/bundle`, `bin/bundler-audit`.
- `spec/` — RSpec tests. Shared setup in `spec/spec_helper.rb` (WebMock + Sinatra test app). File names end with `_spec.rb`.
- `docs/` — Reference docs (e.g., operator precedence).
- Root — `Gemfile`, `code-ruby.gemspec`, `Rakefile` (RSpec default), `.rubocop.yml`, `VERSION`.

## Build, Test, and Development Commands

- Install: `bundle install`
- Run all tests: `bundle exec rake` or `bin/rspec`
- Run one file/example: `bin/rspec spec/code_spec.rb:42`
- Lint: `bin/rubocop` (auto-fix: `bin/rubocop -A`)
- Security audit: `bin/bundler-audit update && bin/bundler-audit check`
- Build gem: `gem build code-ruby.gemspec`
- CLI examples: `bin/code -h`, `bin/code -p '1+2'`, `bin/code -t 2 'loop { }'`

## Coding Style & Naming Conventions

- Ruby 3.4.5; 2-space indentation; keep `# frozen_string_literal: true`.
- Follow `.rubocop.yml`; prefer small, single-responsibility classes under `lib/code/...` reflecting their constants.
- File names: snake_case; tests mirror source paths under `spec/` with `_spec.rb` suffix.

## Testing Guidelines

- Framework: RSpec. Network calls are disabled via WebMock; use the provided `FakeHttpBin` rack app for HTTP behavior.
- Add focused specs near the feature (e.g., parser under `spec/code/parser/*`, objects under `spec/code/object/*`).
- For language-level behaviors, extend `spec/code_spec.rb` with input → output examples.
- Ensure new behavior has at least one positive and one edge/failure case.

## Commit & Pull Request Guidelines

- Commits: short, imperative subjects (e.g., "fix parser whitespace"). Version bumps (`VERSION`, `vX.Y.Z`) are handled by maintainers.
- PRs: include a clear description, reproduction or CLI examples, and links to issues. Update docs in `docs/` when grammar/precedence changes.
- Keep diffs minimal and focused; include tests and run `bin/rubocop` before submitting.

## Security & Configuration Tips

- Tooling versions: see `.tool-versions`, `.ruby-version`, `.node-version`, `.npm-version`.
- Tests must not reach the network; rely on stubs/fixtures. Prefer timeouts (`-t/--timeout`) when evaluating untrusted input with `bin/code`.
