# API

* [Actors](#actors)
* [Base](#base)
* [Drawing](#drawing)
* [Files](#files)
* [Intermission Screens](#intermission-screens)
* [Level Data](#level-data)
* [Players](#players)
* [Sounds](#sounds)
* [Weapons](#weapons)
* [Global Objects](#global-objects)

The ZScript API (Advanced Programming Interface) is vast and has some holes which are hard to explain. Some parts are implemented in ways that don't make sense to user code, but are fine to the engine. Because of this, the API shall be documented in pseudo-ZScript which gives an idea of how it works for the modder rather than for the engine.

Note to authors: Capitalization is normalized within this documentation to encourage consistent code, and does not follow ZScript's original capitalization exactly. Similarly, argument names in methods are sometimes renamed. Note well that *arguments with defaults MAY NOT be renamed* as they are part of the API.

# Actors

<!-- toc actor -->

* [State](api-actor-State.md)

<!-- toc end -->

TODO

# Base

<!-- toc base -->

* [Array](api-base-Array.md)
* [Color](api-base-Color.md)
* [CVar](api-base-CVar.md)
* [FixedArray](api-base-FixedArray.md)
* [Object](api-base-Object.md)
* [String](api-base-String.md)
* [StringTable](api-base-StringTable.md)
* [Thinker](api-base-Thinker.md)
* [Vector](api-base-Vector.md)

<!-- toc end -->

TODO

# Drawing

<!-- toc drawing -->

* [BrokenLines](api-drawing-BrokenLines.md)
* [Console](api-drawing-Console.md)
* [Font](api-drawing-Font.md)
* [GIFont](api-drawing-GIFont.md)
* [Screen](api-drawing-Screen.md)
* [Shape2D](api-drawing-Shape2D.md)
* [TexMan](api-drawing-TexMan.md)
* [TextureID](api-drawing-TextureID.md)

<!-- toc end -->

TODO

# Files

<!-- toc files -->

* [Wads](api-files-Wads.md)

<!-- toc end -->

TODO

# Intermission Screens

<!-- toc inter -->

* [InterBackground](api-inter-InterBackground.md)
* [PatchInfo](api-inter-PatchInfo.md)
* [StatusScreen](api-inter-StatusScreen.md)
* [WBPlayerStruct](api-inter-WBPlayerStruct.md)
* [WBStartStruct](api-inter-WBStartStruct.md)

<!-- toc end -->

For legacy reasons, many intermission-related things may be prefixed with `WI` or `WB`. The abbreviation `WI` means *World Intermission* (the intermission screen was originally called "World Map" by Tom Hall) and `WB` meaning *World Buffer*, as this data was originally buffered into a specific memory address for [statistics drivers](https://doomwiki.org/wiki/Statistics_driver).

<!-- Author's Note: I am not actually sure if this naming scheme is documented anywhere else, as even source port developers I asked didn't know about it. Feel free to disseminate this information, it was an original research. --!>

# Level Data

<!-- toc level -->

* [F3DFloor](api-level-F3DFloor.md)
* [FColorMap](api-level-FColorMap.md)
* [Line](api-level-Line.md)
* [LineIdIterator](api-level-LineIdIterator.md)
* [SecPlane](api-level-SecPlane.md)
* [SecSpecial](api-level-SecSpecial.md)
* [Sector](api-level-Sector.md)
* [SectorEffect](api-level-SectorEffect.md)
* [Side](api-level-Side.md)
* [Vertex](api-level-Vertex.md)

<!-- toc end -->

TODO

# Players

<!-- toc player -->

* [PlayerClass](api-player-PlayerClass.md)
* [PlayerSkin](api-player-PlayerSkin.md)
* [Team](api-player-Team.md)

<!-- toc end -->

TODO

# Sounds

<!-- toc sound -->

* [SeqNode](api-sound-SeqNode.md)

<!-- toc end -->

TODO

# Weapons

<!-- toc wep -->

* [PSprite](api-wep-PSprite.md)

<!-- toc end -->

TODO

# Global Objects

<!-- toc global -->

* [DEHInfo](api-global-DEHInfo.md)
* [FOptionMenuSettings](api-global-FOptionMenuSettings.md)
* [GameInfoStruct](api-global-GameInfoStruct.md)
* [LevelLocals](api-global-LevelLocals.md)

<!-- toc end -->

These types are used by global variables.

<!-- toc global-data -->

* [Client](api-global-data-Client.md)
* [Constants](api-global-data-Constants.md)
* [Game](api-global-data-Game.md)
* [Information](api-global-data-Information.md)
* [Player](api-global-data-Player.md)

<!-- toc end -->

These variables are accessible in any context and are not bound by any specific object.

<!-- toc global-func -->

* [Classes](api-global-func-Classes.md)
* [Game](api-global-func-Game.md)
* [Math](api-global-func-Math.md)
* [Random](api-global-func-Random.md)
* [Sound](api-global-func-Sound.md)
* [System](api-global-func-System.md)

<!-- toc end -->

These functions are accessible in any context and are not bound by any specific object.

<!-- EOF -->
