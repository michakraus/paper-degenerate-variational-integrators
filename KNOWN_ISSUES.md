# Known issues

### K1 · The body of issue #1 names the wrong Aqua form

- location: `test/quality/aqua.jl:6`
- evidence: `gh issue view 1 -R michakraus/paper-degenerate-variational-integrators` says the file
  marks the check `stale_deps = (; broken = true)`; the file uses `stale_deps = false` and
  `@test_broken isempty(Aqua.find_stale_deps(...))  # issue #1`
- kind: docs
- found: 2026-09-27

### K2 · `integrates` accepts every `DomainError`, so a method that always raises one passes

- location: `test/tableau_lists.jl:28`
- evidence: `test/tableau_lists.jl:28–35` catches every `DomainError` and returns `true`;
  `@test integrates(...)` fails only on another exception type
- kind: defect
- found: 2026-09-27; the code is the same as in `test/runtests.jl` on `origin/main`

### K3 · The `problems` tuple is defined twice

- location: `test/tableau_lists.jl:15`
- evidence: `test/tableau_lists.jl:15–21` and `test/common.jl:7–13` hold the same comment and
  six-line tuple; a helper `test/helpers/problems.jl` would hold it once
- kind: defect
- found: 2026-09-27

### K4 · The solver-options comment cites a stale GIB line and stale step counts

- location: `src/common.jl:138`
- evidence: `src/common.jl:138` cites `GeometricIntegratorsBase/src/integrator.jl:47`; in GIB
  0.6.5 to 0.6.9 the `merge(default_options(method, problem), options)` of the
  `GeometricIntegrator` constructor is at line 46. `src/common.jl:142-148` give the step counts of
  `ctdvi` and `cmdvi` measured with dependency versions older than the ones `origin/main` resolves.
  The fix names `default_options` and the `GeometricIntegrator` constructor that merges it, not a
  line number
- kind: docs
- found: 2026-08-14 (the citation's commit 330064b)
