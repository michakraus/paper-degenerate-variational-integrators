
using Weave

Weave.set_chunk_defaults!(:echo => false, :results => "raw")

include("../src/massless-charged-particle-singular.jl")


weave("weave/massless-charged-particle-singular-dvi.jmd",
         out_path = "build/massless-charged-particle-singular",
         doctype = "github",
         mod = MasslessChargedParticleSingularDVI)

weave("weave/massless-charged-particle-singular-srk.jmd",
         out_path = "build/massless-charged-particle-singular",
         doctype = "github",
         mod = MasslessChargedParticleSingularDVI)

weave("weave/massless-charged-particle-singular-firk.jmd",
         out_path = "build/massless-charged-particle-singular",
         doctype = "github",
         mod = MasslessChargedParticleSingularDVI)

weave("weave/massless-charged-particle-singular-vprk-gauss.jmd",
         out_path = "build/massless-charged-particle-singular",
         doctype = "github",
         mod = MasslessChargedParticleSingularDVI)
