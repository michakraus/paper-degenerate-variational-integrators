using Aqua
using DegenerateVariationalIntegrators

# `Documenter` and `Weave` are in `[deps]` for the `weave/` scripts, not for `src/` (issue #1).
# Aqua's `stale_deps` takes no `broken` option, so the two are ignored by name and any other
# stale dependency still fails.
Aqua.test_all(
    DegenerateVariationalIntegrators;
    stale_deps = (; ignore = [:Documenter, :Weave]),
)
