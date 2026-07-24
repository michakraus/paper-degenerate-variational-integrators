
using Test
using GeometricIntegrators
using GeometricProblems.LotkaVolterra2d
using GeometricProblems.LotkaVolterra2d: Δt
using DegenerateVariationalIntegrators

const tableaus = (
    tableaus_vprk_glrk(),
    tableaus_srk_glrk(),
    tableaus_firk_glrk(),
)

const iode = lotka_volterra_2d_iode()
const nt = 1

for list in tableaus
    for run in list
        tab, file = run

        if length(run) ≥ 3
            integrator = run[3]
        else
            integrator = Integrator
        end

        @test_nowarn begin
            sol = Solution(iode, Δt, nt)
            int = integrator(iode, tab, Δt)
            try
                integrate!(int, sol)
            catch ex
                if isa(ex, DomainError)
                    @warn("DOMAIN ERROR: Integrator crashed")
                else
                    throw(ex)
                end
            end
        end
    end
end
