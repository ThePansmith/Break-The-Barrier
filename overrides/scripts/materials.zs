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
	.cableProperties(128, 4, 1, false)
    .flags(["disable_decomposition", "crystallizable", "generate_plate", "generate_rod", "generate_bolt_screw"])
    .build();

var certus = <material:certus_quartz>;
certus.addFlags("generate_rod", "generate_gear");

// Brick pipes
<material:brick>.addFluidPipes(1900,10,true);

// Pourable metals for crucible heating
<material:iron>.addFluid("fluid", true);
<material:wrought_iron>.addFluid("fluid", true);
<material:bronze>.addFluid("fluid", true);
<material:steel>.addFluid("fluid", true);
<material:aluminium>.addFluid("fluid", true);

val plattanium = MaterialBuilder(32000, "plattanium")
    .ingot().fluid()
    .color(0xD4B6C7)
    .flags(["generate_plate", "generate_rod", "generate_gear"])
    .components([<material:titanium> * 1, <material:platinum> * 1])
    .cableProperties(8192, 2, 1)
    .build();
