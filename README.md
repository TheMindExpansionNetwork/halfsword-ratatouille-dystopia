# Ratatouille: Dystopia Edition

**The First Official Mode for Half-Sword**

> "In the ruins of the old world, a rat discovered the secret of cooking...  
> with a frying pan to the face."

Welcome to the Chef Apocalypse.

This is a complete, ridiculous, post-apocalyptic chef experience where **anyone can cook** — especially when the world has already ended.

Frying pans. Rolling pins. Cleavers. Pure kitchen chaos.

---

## What This Mod Actually Does (Right Now)

**Core Experience:**
- Type `KitchenDystopia` (or `ChefApocalypse`) and the **entire game changes**.
- Time slows down globally → fights feel more dramatic and "slow-motion chef combat".
- You get powerful kitchen-themed abilities (stronger swings = "pan power", big health buffs, extreme slow-mo "Pan Time").
- All text, commands, and flavor are written in heavy **Ratatouille + post-apocalyptic chef** style.
- v0.3 adds starter visual prop overrides: expect more pans, plates, and kitchen clutter appearing in the world thanks to the included demo pak.

**Kitchen Theming:**
- Everything is kitchen-themed in name and feel: frying pans, rolling pins, cleavers, "Iron Chef", "Pan Time", "Ratatouille Rage".
- The goal is that it *feels* like everyone is fighting in a ruined kitchen with kitchen tools.

**Visual Changes:**
- v0.3 ships a starter `.pak` (RatatouilleVisuals_Demo.pak) that includes cooking utensil meshes (pans, plates, boards) in the props locations. This demonstrates the override path and seeds more kitchen props/pots into the world.
- Weapons still use original models for now (full swaps in progress).
- Barrels will become pots in the next cook pass.

This is now a **gameplay + visuals starter + atmosphere mod**. Full weapon mesh swaps coming in next cook pass.

## Visual Assets
v0.3 includes starter prop overrides (more pans & pots in the world) + the full dystopian Lua mode. Full weapon mesh swaps coming in next cook pass.

The demo pak mounts at `/HalfswordUE5/Content/...` and is installed automatically by the updated `install.ps1` / `install.bat` into your game's `Content/Paks/`.

---

## Quick Install (Easiest)

1. Download this repo as a ZIP.
2. Extract it somewhere.
3. Run `install.ps1` (best on Windows) or `install.bat`.
4. The installer copies both the Lua mod (KitchenMayhem) **and** the visual props pak (Paks/RatatouilleVisuals_Demo.pak) to the right places.
5. Start Half-Sword.
6. Open the console (`~` or `Insert` key).
7. Type `KitchenDystopia` (or `ChefApocalypse`) to turn on the full chef apocalypse — time warp + kitchen visuals active.

The installer puts the mod + pak in the correct folders automatically (UE4SS/Mods/ and Content/Paks/).

---

## Manual Install

1. You need **UE4SS 3.x** installed in your Half-Sword folder.
2. Copy the `KitchenMayhem` folder into:
   ```
   ...\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods\
   ```
3. (For visuals) Copy `RatatouilleVisuals_Demo.pak` (or all from Paks/) into:
   ```
   ...\Half Sword\HalfswordUE5\Content\Paks\
   ```
4. Launch the game and type the commands in the console. (The pak provides starter kitchen prop overrides.)

---

## Commands

| Command            | What it does                              |
|--------------------|-------------------------------------------|
| `KitchenDystopia`  | Toggles the full dystopian kitchen mode   |
| `ChefApocalypse`   | Same as above                             |
| `IronChef`         | Big health + swing power buff             |
| `PanTime`          | Extreme slow motion (very dramatic)       |
| `ChefSlow`         | Slow time down                            |
| `ChefFast`         | Speed time up                             |
| `ChefNormal`       | Reset time to normal                      |

---

## The Vibe

This mod is pure nonsense done right.

Imagine *Ratatouille* if it took place after the world ended and the only remaining form of fine dining was beating each other to death with kitchen equipment.

"Anyone can cook.  
Not everyone survives."

---

## Generated Assets

We made custom promotional images and a short concept video for this mod using AI (because of course we did).

They're in the `assets/` folder (or will be added shortly).

---

## Music Recommendations

For maximum immersion, play some old French accordion or absurd kitchen jazz while the world burns.

See the `music/` folder for suggestions (all royalty-free / public domain friendly).

---

## Credits

- Built with the **Half-Sword Autonomous Mod Factory** by Grok
- UE4SS Lua patterns from the Half-Sword modding community
- Visuals & video concept generated with Grok’s image/video tools
- Special thanks to every rat who ever believed they could open a restaurant in a nuclear winter

---

## Links

- Tools & Factory: https://github.com/TheMindExpansionNetwork/halfsword-autonomous-mod-factory
- All Mods Workshop (dev): https://github.com/TheMindExpansionNetwork/halfsword-mod-workshop

---

**This is the first official public release from the autonomous system.**

More ridiculous modes coming soon.

Until then… stay in the kitchen, chef.

*Bon appétit, you beautiful disaster.* 🔥🍳🐀