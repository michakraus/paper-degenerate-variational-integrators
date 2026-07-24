using GeometricIntegrators
using Weave

GeometricIntegrators.set_config(:verbosity, 0)

Weave.set_chunk_defaults!(:echo => false, :error => true, :results => "raw")

include("../src/lotka-volterra-2d-symmetric.jl")

weave("../weave/lotka-volterra-2d-symmetric-vprk-gauss.jmd",
         out_path = "src/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)

weave("../weave/lotka-volterra-2d-symmetric-firk.jmd",
         out_path = "src/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)

weave("../weave/lotka-volterra-2d-symmetric-srk.jmd",
         out_path = "src/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)
