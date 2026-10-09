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

- **`test/Project.toml` no longer repeats the root's bounds.** Its `[compat]` entries for
  GeometricIntegrators (`"0.18.1"`) and GeometricProblems (`"0.8.3, 0.9"`) are removed: a
  dependency of the root `Project.toml` takes its bound from the root alone, and a copy in
  `test/Project.toml` can only duplicate or narrow it. The test-only entries (Aqua, SafeTestsets)
  stay. Compat-only; no behaviour changes.
- **The floors rise to Julia 1.11, GeometricIntegrators `"0.18.6"`, GeometricIntegratorsBase
  `"0.6.9"`, GeometricProblems `"0.9.1"`, PoincareInvariants `"0.5.1"` and SimpleSolvers
  `"0.14.1"`**, in `Project.toml`, because GeometricBase 0.15 declares its stubs public and
  requires Julia 1.11. Compat-only; no source file changes.
- **The Weave floor rises to `"0.10.11"`.** Up to 0.10.10 it caps Highlights at 0.4, and so
  DocStringExtensions at 0.8, while GeometricProblems 0.9.1 needs DocStringExtensions 0.9 through
  EulerLagrange 0.5.2 and Symbolics 7. Compat-only; no behaviour changes.
- **CI runs the shared workflow of the other experiment and package repositories.** The test matrix
  is Julia `min` (the `[compat] julia` floor, 1.11) and `1` on Linux, macOS and Windows, with
  `pre` and `nightly` as advisory jobs. Coverage is uploaded from the `1` Linux job only, and a
  test job saves the Julia cache only when it succeeds. The `lts` alias gives way to `min`, and the job names change with it, so the required checks of branch
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
