# API

<!-- vim-markdown-toc GFM -->

* [Actors](#actors)
* [Base](#base)
* [Drawing](#drawing)
* [Event Handling](#event-handling)
* [Files](#files)
* [Intermission Screens](#intermission-screens)
* [Level Data](#level-data)
* [Players](#players)
* [Sounds](#sounds)
* [Weapons](#weapons)
* [Global Objects](#global-objects)

<!-- vim-markdown-toc -->

The ZScript API (Advanced Programming Interface) is vast and has some holes
which are hard to explain. Some parts are implemented in ways that don't make
sense to user code, but are fine to the engine. Because of this, the API shall
be documented in pseudo-ZScript which gives an idea of how it works for the
modder rather than for the engine.

# Actors

<!-- inter-toc actor -->

* [State](api/actor/State.md)

<!-- end -->

TODO

# Base

<!-- inter-toc base -->

* [Array](api/base/Array.md)
* [CVar](api/base/CVar.md)
* [Color](api/base/Color.md)
* [FixedArray](api/base/FixedArray.md)
* [Object](api/base/Object.md)
* [StringTable](api/base/StringTable.md)
* [String](api/base/String.md)
* [Thinker](api/base/Thinker.md)
* [Vector](api/base/Vector.md)

<!-- end -->

TODO

# Drawing

<!-- inter-toc drawing -->

* [BrokenLines](api/drawing/BrokenLines.md)
* [Console](api/drawing/Console.md)
* [Font](api/drawing/Font.md)
* [GIFont](api/drawing/GIFont.md)
* [Screen](api/drawing/Screen.md)
* [Shape2D](api/drawing/Shape2D.md)
* [TexMan](api/drawing/TexMan.md)
* [TextureID](api/drawing/TextureID.md)

<!-- end -->

TODO

# Event Handling

<!-- inter-toc events -->

* [ConsoleEvent](api/events/ConsoleEvent.md)
* [EventHandler](api/events/EventHandler.md)
* [RenderEvent](api/events/RenderEvent.md)
* [ReplaceEvent](api/events/ReplaceEvent.md)
* [StaticEventHandler](api/events/StaticEventHandler.md)

<!-- end -->

TODO

# Files

<!-- inter-toc files -->

* [Wads](api/files/Wads.md)

<!-- end -->

TODO

# Intermission Screens

<!-- inter-toc inter -->

* [InterBackground](api/inter/InterBackground.md)
* [PatchInfo](api/inter/PatchInfo.md)
* [StatusScreen](api/inter/StatusScreen.md)
* [WBPlayerStruct](api/inter/WBPlayerStruct.md)
* [WBStartStruct](api/inter/WBStartStruct.md)

<!-- end -->

For legacy reasons, many intermission-related things may be prefixed with `WI`
or `WB`. The abbreviation `WI` means *World Intermission* (the intermission
screen was originally called "World Map" by Tom Hall) and `WB` meaning *World
Buffer*, as this data was originally buffered into a specific memory address
for [statistics drivers][1].

[1]: https://doomwiki.org/wiki/Statistics_driver

# Level Data

<!-- inter-toc level -->

* [F3DFloor](api/level/F3DFloor.md)
* [FColorMap](api/level/FColorMap.md)
* [LineIdIterator](api/level/LineIdIterator.md)
* [Line](api/level/Line.md)
* [SecPlane](api/level/SecPlane.md)
* [SecSpecial](api/level/SecSpecial.md)
* [SectorEffect](api/level/SectorEffect.md)
* [SectorTagIterator](api/level/SectorTagIterator.md)
* [Sector](api/level/Sector.md)
* [Side](api/level/Side.md)
* [Vertex](api/level/Vertex.md)

<!-- end -->

TODO

# Players

<!-- inter-toc player -->

* [PlayerClass](api/player/PlayerClass.md)
* [PlayerSkin](api/player/PlayerSkin.md)
* [Team](api/player/Team.md)

<!-- end -->

TODO

# Sounds

<!-- inter-toc sound -->

* [SeqNode](api/sound/SeqNode.md)

<!-- end -->

TODO

# Weapons

<!-- inter-toc weapon -->

* [PSprite](api/weapon/PSprite.md)

<!-- end -->

TODO

# Global Objects

<!-- inter-toc global/data -->

* [Client](api/global/data/Client.md)
* [Constants](api/global/data/Constants.md)
* [Game](api/global/data/Game.md)
* [Information](api/global/data/Information.md)
* [Player](api/global/data/Player.md)

<!-- end -->

These variables are accessible in any context and are not bound by any specific
object. Generally these mirror global information within the engine itself.

<!-- inter-toc global/func -->

* [Classes](api/global/func/Classes.md)
* [Game](api/global/func/Game.md)
* [Math](api/global/func/Math.md)
* [Random](api/global/func/Random.md)
* [Sound](api/global/func/Sound.md)
* [System](api/global/func/System.md)

<!-- end -->

These functions are accessible in any context and are not bound by any specific
object. Generally these are utility functions.

<!-- inter-toc global/type -->

* [DehInfo](api/global/type/DehInfo.md)
* [FOptionMenuSettings](api/global/type/FOptionMenuSettings.md)
* [GameInfoStruct](api/global/type/GameInfoStruct.md)
* [LevelLocals](api/global/type/LevelLocals.md)

<!-- end -->

These are the types used by global variables.

<!-- EOF -->
