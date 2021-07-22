# The Witcher 3 - Perk fixes

## Fix Undying
The way the undying perk was implemented in vanilla had three flaws:
 - The cooldown mechanism could break if you happened to save your game while undying was on cooldown, leaving it in a "in cooldown" state when it could never go out of cooldown.
 - The provided healing was always set to 100% no matter the level of the perk
 - The healing didn't take in account the damage received. Making it seems the undying perk didn't work most of the time

The fix addresses all of these issues:
 - The cooldown is now implemented properly using a timestamp to make is save/reload safe
 - The healing actually uses the perk values from the XML files
 - If the damage received were still going to kill you after the healing from the perk, you will be left at around 100 health and the damage will be reduced to 50, leaving you at 50 health. (This was done to make sure damage procs took effect)