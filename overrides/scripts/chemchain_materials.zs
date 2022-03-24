#loader gregtech
#priority 100

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialRegistry;

// Recipes for chemchain fluids

// Ammonium Nitrate
var ammonium_nitrate = MaterialBuilder(32004, "ammonium_nitrate")
    .fluid()
    .color(0xeeeee4) 
    .build();
ammonium_nitrate.setFormula("NH4NO3", true);

// Platline

var aqua_regia = MaterialBuilder(32005, "aqua_regia")
    .fluid()
    .color(0xeeeee4) 
    .build();
aqua_regia.setFormula("(HNO3)(HCL)", true);