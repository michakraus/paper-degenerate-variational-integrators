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
- **Dependabot opens the `[compat]` bumps**, weekly, and ignores the standard libraries.
- **`codecov.yml`** sets the project and patch checks to a 1 % threshold.
