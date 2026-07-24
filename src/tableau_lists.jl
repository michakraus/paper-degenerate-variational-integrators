
# The degenerate variational integrators of the paper. `DVIA` and `DVIB` are of first order
# and therefore integrated with a ten times finer time step over the same time interval (the
# third element of the entry), as in the paper; `CTDVI` and `CMDVI` are of second order and
# run with the same time step as the Runge-Kutta methods below.
function tableaus_dvi()
    (
        ( DVIA(),                "dvia",  10 ),
        ( DVIB(),                "dvib",  10 ),
        ( CTDVI(),               "ctdvi"      ),
        ( CMDVI(),               "cmdvi"      ),
    )
end

function tableaus_vprk_glrk()
    (
        ( VPRKGauss(1),          "vprk_gauss1" ),
        ( VPRKGauss(2),          "vprk_gauss2" ),
        ( VPRKGauss(3),          "vprk_gauss3" ),
        ( VPRKGauss(4),          "vprk_gauss4" ),
        ( VPRKGauss(5),          "vprk_gauss5" ),
        ( VPRKGauss(6),          "vprk_gauss6" ),
    )
end

function tableaus_srk_glrk()
    (
        ( DVRK(Gauss(1)),        "srk_gauss1" ),
        ( DVRK(Gauss(2)),        "srk_gauss2" ),
        ( DVRK(Gauss(3)),        "srk_gauss3" ),
        ( DVRK(Gauss(4)),        "srk_gauss4" ),
        ( DVRK(Gauss(5)),        "srk_gauss5" ),
        ( DVRK(Gauss(6)),        "srk_gauss6" ),
    )
end

function tableaus_firk_glrk()
    (
        ( Gauss(1),              "firk_gauss1" ),
        ( Gauss(2),              "firk_gauss2" ),
        ( Gauss(3),              "firk_gauss3" ),
        ( Gauss(4),              "firk_gauss4" ),
        ( Gauss(5),              "firk_gauss5" ),
        ( Gauss(6),              "firk_gauss6" ),
    )
end
