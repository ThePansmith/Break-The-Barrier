#loader gregtech
#priority 100

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialRegistry;

// AE2 resources
var charged_certus = MaterialBuilder(32001, "charged_certus_quartz")
    .dust()
    .ore()
    .color(0xb8d4d9)
    .iconSet("quartz")
    .flags(["disable_decomposition", "crystallizable"])
    .build();

var fluix = MaterialBuilder(32002, "fluix")
    .dust()
	.ore()
    .ingot()
    .color(0x822fe0)
    .iconSet("METALLIC")
	.cableProperties(128, 2, 4, false)
    .flags(["disable_decomposition", "crystallizable", "generate_plate", "generate_rod", "generate_bolt_screw"])
    .build();

var certus = <material:certus_quartz>;
certus.addFlags("generate_rod", "generate_gear");

<material:brick>.addFluidPipes(1900,10,true);

## Pourable metals for crucible heating
<material:iron>.addFluid("fluid", true);
<material:wrought_iron>.addFluid("fluid", true);
<material:bronze>.addFluid("fluid", true);
<material:steel>.addFluid("fluid", true);
<material:aluminium>.addFluid("fluid", true);
