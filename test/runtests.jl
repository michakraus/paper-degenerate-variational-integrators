
using Test
using GeometricIntegrators
import GeometricProblems
using DegenerateVariationalIntegrators
import DegenerateVariationalIntegrators as DVI

const tableaus = (
    "Degenerate Variational"   => tableaus_dvi(),
    "Gauss-Legendre SRK"       => tableaus_srk_glrk(),
    "Gauss-Legendre FIRK"      => tableaus_firk_glrk(),
    "Gauss-Legendre VPRK"      => tableaus_vprk_glrk(),
)

const nt = 1

# All problem modules export `iodeproblem` and `Δt`, so they are addressed by their module.
const problems = (
    GeometricProblems.LotkaVolterra2dSingular,
    GeometricProblems.LotkaVolterra2dSymmetric,
    GeometricProblems.MasslessChargedParticleSingular,
    GeometricProblems.MasslessChargedParticle,
)

# Integrate a single time step. A `DomainError` is a legitimate outcome for these
# degenerate Lagrangians – a stage value may leave the domain of the logarithm – and is
# tolerated; every other exception propagates and fails the test. The suite runs the
# diverging methods on purpose and only asks whether they raise, so `verbosity = 0` keeps
# the line search from reporting its failures here.
function integrates(iode, method)
    try
        integrate(iode, method; f_abstol = 1E-14, f_reltol = 1E-14, verbosity = 0)
    catch ex
        ex isa DomainError || rethrow()
    end
    return true
end

@testset "$(nameof(problem))" for problem in problems
    iode = problem.iodeproblem(; timestep = problem.Δt, timespan = (0.0, nt * problem.Δt))

    @testset "$(family)" for (family, list) in tableaus
        # Methods that carry a time step refinement factor are integrated on the refined
        # problem, exactly as `run_list` does.
        @testset "$(run[2])" for run in list
            factor = length(run) ≥ 3 ? run[3] : 1
            @test integrates(similar(iode; timestep = timestep(iode) / factor), run[1])
        end
    end
end


# The Poincaré invariants of `run_poincare`, with a handful of sample points over a handful of time
# steps: what is asserted here is the wiring — that the ensemble is built, advected and evaluated,
# that both figures are written where the woven page expects them, and that the `DVIA`/`DVIB` time
# step refinement is honoured here as it is in `run_list`. The physics is asserted upstream, in the
# GeometricProblems test suite, where the invariant error is checked to converge at the order of
# the method.
#
# `NSURFACE_TEST` is 45 = 9·10/2, the next Padua number below the production 231; the Chebyshev
# plan rounds any other count up to one anyway.
const NLOOP_TEST = 16
const NSURFACE_TEST = 45
const NT_TEST = 3

@testset "Poincaré invariants — $(nameof(problem))" for problem in problems
    spec = (loop    = problem.f_loop,
            surface = problem.f_surface,
            first   = problem.poincare_invariant_1st,
            second  = problem.poincare_invariant_2nd)

    iode = problem.iodeproblem(; timestep = problem.Δt,
                                 timespan = (0.0, NT_TEST * problem.Δt))

    # `CMDVI` runs at the given time step, `DVIA` at a tenth of it over the same time interval.
    mktempdir() do dir
        DVI.run_poincare(spec, iode, :test, ((CMDVI(), "cmdvi"), (DVIA(), "dvia", 10)), dir;
                         nloop = NLOOP_TEST, nsurface = NSURFACE_TEST)

        for file in ("cmdvi", "dvia"), suffix in ("_poincare_1st", "_poincare_2nd")
            @test isfile(joinpath(dir, file * suffix * ".png"))
        end
    end

    # `invariant_error` is what carries the partial-result contract: it returns the invariant over
    # as many time steps as every member of the ensemble survived.
    pinv = spec.first(NLOOP_TEST)
    ts, Is, last_good, ntotal = DVI.invariant_error(pinv, iode, CMDVI(), spec.loop)

    @test last_good == ntotal == NT_TEST
    @test length(ts) == length(Is) == NT_TEST + 1
    @test all(isfinite, Is)
    @test !iszero(Is[begin])
end
