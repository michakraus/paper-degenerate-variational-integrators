# Known issues

## KI-1 · docs · Issue #1 names the wrong Aqua form

The last line of issue #1 says that `test/quality/aqua.jl` marks the check
`stale_deps = (; broken = true)`. The file uses `stale_deps = false` and
`@test_broken isempty(Aqua.find_stale_deps(...))  # issue #1` (`test/quality/aqua.jl:6–7`).
Evidence: `gh issue view 1 -R michakraus/paper-degenerate-variational-integrators`.
Fix: edit the issue body.

## KI-2 · defect · `integrates` accepts every `DomainError`

`test/tableau_lists.jl:28–35` (moved verbatim from `test/runtests.jl`) catches every
`DomainError` and returns `true`. So `@test integrates(...)` fails only on another exception
type, and a method that always raises a `DomainError` passes.

## KI-3 · size · The `problems` tuple is defined twice

`test/tableau_lists.jl:16–21` and `test/common.jl:8–13` hold the same six-line `problems` tuple
with the same comment. Fix: move it to `test/helpers/problems.jl` and include that from both files.
