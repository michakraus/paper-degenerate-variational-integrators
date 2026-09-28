# Changelog

All notable changes to DegenerateVariationalIntegrators.jl are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

This record begins with this file. The repository has earlier history and two releases — v0.1.0
and v0.2.0 — which carry no entries here.

**When a measured number changes, the entry says why** — a fix, a dependency bump, a different
tolerance, a different machine. A results table that silently differs from last month's is the
failure this prevents.

## [Unreleased]

### Changed

- **The `[compat]` floor of GeometricIntegrators is 0.18.1**, in `Project.toml` and
  `test/Project.toml`. GeometricIntegrators 0.18.0 requires GeometricIntegratorsBase 0.5, which
  contradicts the floors GeometricIntegratorsBase 0.6 and SimpleSolvers 0.11, so the old floor
  `"0.18"` could never install. Compat-only; no behaviour changes.
- **CI runs the shared workflow of the other experiment and package repositories.** The test matrix
  is Julia `min` (the `[compat] julia` floor, 1.10) and `1` on Linux, macOS and Windows, with
  `pre` and `nightly` as advisory jobs. Coverage is uploaded from the `min` Linux job only. The
  `lts` alias gives way to `min`, and the job names change with it, so the required checks of branch
  protection can be one fixed list across all repositories. The old CI ran on every push to any
  branch; the new one runs on a push to `main` or `master`, on tags, on pull requests, and on
  manual dispatch, so a push to a topic branch without a pull request runs no CI. A new `Doctests`
  job runs on Ubuntu. It skips itself here, because the repository has no `docs/Project.toml`.
- **The documentation workflow is `Documenter.yml`**, formerly `Documentation.yaml`. The weave
  pipeline is unchanged; only the action versions move to the current majors. The reference in
  `docs/Makefile` uses the new name.
- **Dependabot opens the `[compat]` bumps**, weekly, for the root `Project.toml` only, and ignores
  the standard libraries.
- **An advisory `Downgrade - ubuntu-latest` job tests the `[compat]` lower bounds.** It resolves
  each direct dependency of the root `Project.toml` to its lower bound on the lowest Julia and runs
  the suite there. It is not a required check.
- **`codecov.yml`** sets the project and patch checks to a 1 % threshold.
