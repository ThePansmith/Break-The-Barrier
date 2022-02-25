#priorty 1000

for oreDictEntry in oreDict.entries{
	if (oreDictEntry.name).startsWith("craftingTool"){
		val fixedEntry = oreDict.get("fixed" + oreDictEntry.name);
		for item in oreDictEntry.items{
			fixedEntry.addItems([item.withEmptyTag()]);
		}
	}
}