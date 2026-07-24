
using GeometricIntegrators.Integrators
using GeometricIntegrators.Tableaus

function tableaus_vprk_glrk()
    (
        ( TableauVPGLRK(1),          "vprk_glrk1" ),
        ( TableauVPGLRK(2),          "vprk_glrk2" ),
        ( TableauVPGLRK(3),          "vprk_glrk3" ),
        ( TableauVPGLRK(4),          "vprk_glrk4" ),
        ( TableauVPGLRK(5),          "vprk_glrk5" ),
        ( TableauVPGLRK(6),          "vprk_glrk6" ),
    )
end

function tableaus_srk_glrk()
    (
        ( TableauGauss(1),          "srk_glrk1",      IntegratorSRKimplicit ),
        ( TableauGauss(2),          "srk_glrk2",      IntegratorSRKimplicit ),
        ( TableauGauss(3),          "srk_glrk3",      IntegratorSRKimplicit ),
        ( TableauGauss(4),          "srk_glrk4",      IntegratorSRKimplicit ),
        ( TableauGauss(5),          "srk_glrk5",      IntegratorSRKimplicit ),
        ( TableauGauss(6),          "srk_glrk6",      IntegratorSRKimplicit ),
    )
end

function tableaus_firk_glrk()
    (
        ( TableauGauss(1),          "firk_glrk1",     IntegratorFIRKimplicit ),
        ( TableauGauss(2),          "firk_glrk2",     IntegratorFIRKimplicit ),
        ( TableauGauss(3),          "firk_glrk3",     IntegratorFIRKimplicit ),
        ( TableauGauss(4),          "firk_glrk4",     IntegratorFIRKimplicit ),
        ( TableauGauss(5),          "firk_glrk5",     IntegratorFIRKimplicit ),
        ( TableauGauss(6),          "firk_glrk6",     IntegratorFIRKimplicit ),
    )
end
