#loader gregtech
#priority 100

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialRegistry;

// Recipes for chemchain fluids
var ammonium_nitrate = MaterialBuilder(32004, "ammonium_nitrate")
    .fluid()
    .color(0xeeeee4) 
    .build();
ammonium_nitrate.setFormula("NH4NO3", true);