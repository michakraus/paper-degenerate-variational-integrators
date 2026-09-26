using Aqua
using Test
using DegenerateVariationalIntegrators

# `Documenter` and `Weave` are in `[deps]` for the `weave/` scripts, not for `src/`.
Aqua.test_all(DegenerateVariationalIntegrators; stale_deps = false)
@test_broken isempty(Aqua.find_stale_deps(Base.PkgId(DegenerateVariationalIntegrators)))  # issue #1
