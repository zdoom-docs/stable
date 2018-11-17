Table of Contents
=================

<!-- vim-markdown-toc GFM -->

* [Introduction](#introduction)
* [Language](#language)
   * [Translation Unit](#translation-unit)
   * [Versions](#versions)
   * [Top-level](#top-level)
   * [Class definitions](#class-definitions)
      * [Class flags](#class-flags)
      * [Class content](#class-content)
      * [Property definitions](#property-definitions)
      * [Default blocks](#default-blocks)
      * [State definitions](#state-definitions)
   * [Structure definitions](#structure-definitions)
      * [Structure flags](#structure-flags)
      * [Structure content](#structure-content)
   * [Enumeration definitions](#enumeration-definitions)
   * [Constant definitions](#constant-definitions)
   * [Static array definitions](#static-array-definitions)
   * [Include directives](#include-directives)
   * [Types](#types)
      * [Integers](#integers)
      * [Floating-point types](#floating-point-types)
      * [Strings](#strings)
      * [Names](#names)
      * [Color](#color)
      * [Vectors](#vectors)
      * [Fixed-size arrays](#fixed-size-arrays)
      * [Dynamic-size arrays](#dynamic-size-arrays)
      * [Maps](#maps)
      * [Class type references](#class-type-references)
      * [User types](#user-types)
      * [Read-only types](#read-only-types)
      * [Other types](#other-types)
   * [Expressions and Operators](#expressions-and-operators)
      * [Literals](#literals)
         * [String literals](#string-literals)
         * [Class type literals](#class-type-literals)
         * [Name literals](#name-literals)
         * [Integer literals](#integer-literals)
         * [Float literals](#float-literals)
         * [Boolean literals](#boolean-literals)
         * [Null pointer](#null-pointer)
      * [Expressions](#expressions)
         * [Primary expressions](#primary-expressions)
            * [Vector literals](#vector-literals)
         * [Postfix expressions](#postfix-expressions)
         * [Unary expressions](#unary-expressions)
         * [Binary expressions](#binary-expressions)
            * [Assignment expressions](#assignment-expressions)
         * [Ternary expression](#ternary-expression)
   * [Statements](#statements)
      * [Compound statements](#compound-statements)
      * [Expression statements](#expression-statements)
      * [Conditional statements](#conditional-statements)
      * [Switch statements](#switch-statements)
      * [Loop statements](#loop-statements)
      * [Control flow statements](#control-flow-statements)
      * [Local variable statements](#local-variable-statements)
      * [Multi-assignment statements](#multi-assignment-statements)
      * [Static array statements](#static-array-statements)
      * [Null statements](#null-statements)
   * [Member declarations](#member-declarations)
      * [Member declaration flags](#member-declaration-flags)
   * [Method definitions](#method-definitions)
      * [Method definition flags](#method-definition-flags)
* [Concepts](#concepts)
   * [Action Scoping](#action-scoping)
   * [Object Scoping](#object-scoping)
   * [Format String](#format-string)
   * [Sprite](#sprite)
   * [Game Tick](#game-tick)
   * [Interpolation](#interpolation)
* [API](#api)
   * [Type symbols](#type-symbols)
      * [Integer types](#integer-types)
      * [Floating-point types](#floating-point-types-1)
   * [Globals](#globals)
      * [Global functions](#global-functions)
         * [Class handling](#class-handling)
         * [Random number generation](#random-number-generation)
         * [Math](#math)
         * [Game](#game)
         * [Sound](#sound)
         * [System](#system)
      * [Global variables](#global-variables)
         * [Static info](#static-info)
         * [Game state](#game-state)
         * [Client](#client)
         * [Players](#players)
   * [Built-in Types](#built-in-types)
      * [Array](#array)
      * [Color](#color-1)
      * [FixedArray](#fixedarray)
      * [String](#string)
      * [TextureID](#textureid)
      * [Vector2/Vector3](#vector2vector3)
   * [Base Objects](#base-objects)
      * [Object](#object)
      * [Thinker](#thinker)
      * [CVar](#cvar)
      * [GIFont](#gifont)
      * [State](#state)
      * [StringTable](#stringtable)
   * [Global Data](#global-data)
      * [DehInfo](#dehinfo)
      * [GameInfoStruct](#gameinfostruct)
      * [LevelLocals](#levellocals)
   * [Level Data](#level-data)
      * [Vertex](#vertex)
      * [Side](#side)
      * [Line](#line)
      * [Sector](#sector)
      * [SectorPortal](#sectorportal)
      * [SectorEffect](#sectoreffect)
      * [SectorAction](#sectoraction)
      * [SecSpecial](#secspecial)
      * [SecPlane](#secplane)
      * [F3DFloor](#f3dfloor)
      * [FColorMap](#fcolormap)
      * [SectorTagIterator](#sectortagiterator)
      * [LineIdIterator](#lineiditerator)
   * [Players](#players-1)
      * [PlayerInfo](#playerinfo)
      * [PlayerClass](#playerclass)
      * [PlayerSkin](#playerskin)
      * [Team](#team)
   * [Weapons](#weapons)
      * [PSprite](#psprite)
      * [Weapon](#weapon)
   * [Drawing](#drawing)
      * [BrokenLines](#brokenlines)
      * [Console](#console)
      * [Font](#font)
      * [Shape2D](#shape2d)
      * [Screen](#screen)
      * [TexMan](#texman)
   * [Sounds](#sounds)
      * [SeqNode](#seqnode)
* [Glossary](#glossary)
   * [Examples](#examples)
      * [Examples: Class headers](#examples-class-headers)
      * [Examples: Class definitions](#examples-class-definitions)
      * [Examples: Property definitions](#examples-property-definitions)
      * [Examples: Structure definitions](#examples-structure-definitions)
      * [Examples: Enumeration definitions](#examples-enumeration-definitions)
      * [Examples: Constant definitions](#examples-constant-definitions)
      * [Examples: Include directives](#examples-include-directives)
      * [Examples: Expression statements](#examples-expression-statements)
      * [Examples: Conditional statements](#examples-conditional-statements)
      * [Examples: Switch statements](#examples-switch-statements)
      * [Examples: Control flow statements](#examples-control-flow-statements)
      * [Examples: Multi-assignment statements](#examples-multi-assignment-statements)
      * [Examples: Member declarations](#examples-member-declarations)
   * [Class Tree](#class-tree)
   * [Structure List](#structure-list)

<!-- vim-markdown-toc -->

Introduction
============

ZScript is a new (circa 2017) scripting language that has sprung from the ceasing of ZDoom and the subsequent reprisal of GZDoom as mainline. It is similar to Java, though it has many deficiencies, oddities and other such issues. Despite this, it is still the most powerful Doom modding tool since straight up source editing, and will likely stay that way for a while until Eternity Engine inevitably becomes competition-worthy with scripting additions.

This documentation serves as an introduction to and informal specification of the ZScript language from a programmer's viewpoint. It should also be useful for non-programmers looking for specifics on the inner workings of the language and more information on the functions and properties provided to it.

ZScript runs in a virtual machine much like ACS, although because it is *not* compiled to bytecode and uses an object-oriented structure, the virtual machine is far more complex, and also therefore quite a bit slower. ZScript may only be read from source files by the engine, which has several benefits as well as detriments. It is the opinion of the author that this is a bad solution, but the author will refrain from going on a several-paragraph tirade about why bytecode is always better than source, even if it is an optional component.

In any case, here we are. This documentation will detail all aspects of ZScript, from the language and type system to the API and finer details. This document is distributed under the [CC0 public domain license](https://creativecommons.org/publicdomain/zero/1.0/legalcode) in the hope that it is useful reference and serves as a solid basis for further writings. This document was originally written by Alison Sanderson (Marrub.) Attribution is encouraged but not required.

Language
========

Translation Unit
----------------

Full ZScript files are referred to as "translation units." This terminology comes from the C standard, and refers simply to the entirety of a ZScript source file. ZScript files are looked for in lumps named `zscript` with any extension. The standard extension is `.txt`, but `.zsc` and `.zs` are common as well. The author of this documentation prefers `.zsc`.

The base translation unit `zscript` may start with a version directive, then followed by any number of top-level definitions and `#include` directives. Included translation units may not have version directives.

All keywords and identifiers in ZScript are case insensitive.

Versions
--------

A version directive may be placed at the very beginning of a ZScript file, the syntax being:

```
version "num"
```

Where `num` is the ZScript version to use. By default ZScript is `version "2.3"`, the original ZScript specification. This old version is not supported by this documentation and it is highly encouraged to always use the latest version of ZScript. The minimum version supported by this documentation is 3.0.

Here is a list of differences between ZScript versions:

Version 3.1

- Added `UserCmd`.
- Added `PlayerPawn::CROUCHSPEED`.
- Added `PlayerPawn::TURN180_TICKS`.
- Added `PlayerPawn::FireWeapon`.
- Added `PlayerPawn::FireWeaponAlt`.
- Added `PlayerPawn::CheckWeaponFire`.
- Added `PlayerPawn::CheckWeaponChange`.
- Added `PlayerPawn::TickPSprites`.
- Added `PlayerPawn::DeathThink`.
- Added `PlayerPawn::CheckFOV`.
- Added `PlayerPawn::CheckCheats`.
- Added `PlayerPawn::CheckFrozen`.
- Added `PlayerPawn::CrouchMove`.
- Added `PlayerPawn::CheckCrouch`.
- Added `PlayerPawn::ForwardThrust`.
- Added `PlayerPawn::Bob`.
- Added `PlayerPawn::TweakSpeeds`.
- Added `PlayerPawn::MovePlayer`.
- Added `PlayerPawn::CheckPitch`.
- Added `PlayerPawn::CheckJump`.
- Added `PlayerPawn::CheckMoveUpDown`.
- Added `PlayerPawn::HandleMovement`.
- Added `PlayerPawn::CheckUndoMorph`.
- Added `PlayerPawn::CheckPoison`.
- Added `PlayerPawn::CheckDegeneration`.
- Added `PlayerPawn::CheckAirSupply`.
- Added `PlayerPawn::PlayerThink`.
- Added `PlayerPawn::CheckMusicChange`.
- Added `PlayerPawn::CalcHeight`.
- Added `PlayerPawn::CheckEnvironment`.
- Added `PlayerPawn::CheckUse`.
- Added `PlayerPawn::CheckWeaponButtons`.
- Added `PlayerPawn::BestWeapon`.
- Added `PlayerInfo::Cmd`.
- Added `PlayerInfo::Original_Cmd`.
- Added `PlayerInfo::IsTotallyFrozen`.
- Added `PlayerInfo::Uncrouch`.
- Added `ListMenuItemSlider::mDrawX`.
- Added `SBarInfo::GetProtrusion`.
- Added `Actor::ORIG_FRICTION`.
- Added `Actor::ORIG_FRICTION_FACTOR`.
- Added `Actor::CheckFakeFloorTriggers`.
- Added `global LocalViewPitch`.
- Added `LevelLocals::AllowRespawn`.
- Added `LevelLocals::IsJumpingAllowed`.
- Added `LevelLocals::IsCrouchingAllowed`.
- Added `LevelLocals::IsFreelookAllowed`.
- Added `LAF_OVERRIDEZ`.
- Added `HarmonyStatusBar`.
- Added `SVELight`.
- Added `SVEFlagSpot*`.
- Added override for `DoomStatusBar::DrawAutomapHUD`.
- Added override for `SBarInfoWrapper::GetProtrusion`.
- Added `offsetz` parameter to `Actor::LineAttack`.
- Made `PlayerInfo::Cls` not `readonly`.

Version 3.2

- Added `+ZDOOMTRANS`.
- Added `+DYNAMICLIGHT.ADDITIVE`.
- Added `+DYNAMICLIGHT.SUBTRACTIVE`.
- Added `+DYNAMICLIGHT.ATTENUATE`.
- Added `FCheckPosition::PortalGroup`.
- Added `Actor::FloatBobStrength`.
- Added `Actor::CameraFOV`.
- Added `Actor::RenderHidden`.
- Added `Actor::RenderRequired`.
- Added `Actor::CheckPortalTransition`.
- Added `Actor::A_SoundVolume`.
- Added `Font::CR_ICE`.
- Added `Font::CR_FIRE`.
- Added `Font::CR_SAPPHIRE`.
- Added `Font::CR_TEAL`.
- Added `Font::TEXTCOLOR_ICE`.
- Added `Font::TEXTCOLOR_FIRE`.
- Added `Font::TEXTCOLOR_SAPPHIRE`.
- Added `Font::TEXTCOLOR_TEAL`.
- Added `Thinker::STAT_USER`.
- Added `Thinker::STAT_USER_MAX`.
- Added `DropItem::Amount`.
- Added `LevelLocals::GiveSecret`.
- Added `String::IndexOf`.
- Added `String::LastIndexOf`.
- Added `String::ToUpper`.
- Added `String::ToLower`.
- Added `String::ToInt`.
- Added `String::ToDouble`.
- Added `Shader`.
- Added `TEXTCOLOR_ICE`.
- Added `TEXTCOLOR_FIRE`.
- Added `TEXTCOLOR_SAPPHIRE`.
- Added `TEXTCOLOR_TEAL`.
- Added `ActorRenderFeatureFlag`.
- Fixed `BlockLinesIterator::Create*` returning the wrong type.
- Changed `Screen::SetCameraToTexture`'s `fov` parameter to `double`.

Version 3.2.1

- Added `GameInfoStruct::mSliderColor`.

Version 3.2.2

- Added `PlayerPawn::GetClassicFlight`.
- Added `Actor::Warp`.
- Added `TexMan::GetName`.
- Added `CVar::GetBool`.
- Added `CVar::SetBool`.
- Added `Wads::CheckNumForFullName`.
- Added `Wads::FindLump`.
- Added `Wads::ReadLump`.
- Added `Wads::FindLumpNamespace`.
- Added `String::Remove`.
- Added `String::Split`.
- Added `LAF_TARGETISSOURCE`.
- Added `LAF_ABSOFFSET`.
- Added `LAF_ABSPOSITION`.
- Added `EmptyTokenType`.
- Added `offsetforward` and `offsetside` parameters for `Actor::LineAttack`.
- Added `endIndex` parameter for `String::LastIndexOf`.
- Made `Array::Find` be `const`.
- Made `Array::Max` be `const`.

Version 3.2.3

- Made `Ceiling::CreateCeiling` be `static`.

Version 3.2.4

- Added `DMG_NO_PAIN`.

Version 3.2.5

- Added `Actor::CheckMove`.
- Added `Screen::DrawLine`.
- Added `LevelLocals::PixelStretch`.
- Added `LevelLocals::Vec2Diff`.
- Added `LevelLocals::Vec3Diff`.
- Added `ECheckMoveFlags`.
- Added `SKILLP_PlayerRespawn`.
- Added `alpha2` parameter to `Actor::A_SetBlend`.
- Changed `Thinker::Tics2Seconds`' logic.

Version 3.3

- Default parameters in overridden virtual functions are now an error.
- Added `Inventory::AltHUDIcon`.
- Added `StrifeDialogueNode::MenuClassName`.
- Added `StrifeDialogueNode::UserData`.
- Added `OptionMenuItemLabeledSubmenu`.
- Added `OptionMenuItemCommand::mCloseOnSelect`.
- Added `OptionMenuItemOptionBase::IsGrayed`.
- Added `DynamicLight::SpotInnerAngle`.
- Added `DynamicLight::SpotOuterAngle`.
- Added `SpotLight* classes`.
- Added `HudMessageBase`.
- Added `BaseStatusBar::EHUDMSGLayer`.
- Added `BaseStatusBar::DI_MIRROR`.
- Added `BaseStatusBar::AttachMessage`.
- Added `BaseStatusBar::DetachMessage`.
- Added `BaseStatusBar::DetachMessageID`.
- Added `BaseStatusBar::DetachAllMessages`.
- Added `FLineTargetData`.
- Added `Actor::FriendlySeeBlocks`.
- Added `Actor::Distance2DSquared`.
- Added `Actor::Distance3DSquared`.
- Added `Actor::LineTrace`.
- Added `Actor::GetRadiusDamage`.
- Added `Actor::ACS_ScriptCall`.
- Added `Screen::GetViewWindow`.
- Added `Object::S_GetLength`.
- Added `ETrace*`, `ELineTier`, `ELineTraceFlags`.
- Added `TraceResults`.
- Added `LineTracer`.
- Added `LevelLocals::SkyTexture1`.
- Added `LevelLocals::SkyTexture2`.
- Added `LevelLocals::SkySpeed1`.
- Added `LevelLocals::SkySpeed2`.
- Added `LevelLocals::GetChecksum`.
- Added `LevelLocals::ChangeSky`.
- Added `SectorEffect::GetSector`.
- Added `CHAN_LOOP`.
- Added `Array` specialization for `Object`.
- Added `WorldEvent::ActivatedLine`.
- Added `WorldEvent::ShouldActivate`.
- Added `StaticEventHandler::WorldLinePreActivated`.
- Added `StaticEventHandler::WorldLineActivated`.
- Added `StaticEventHandler::PostUiTick`.
- Added `Sector::FloorData`.
- Added `Sector::CeilingData`.
- Added `Sector::LightingData`.
- Added `ReverbEdit`.
- Renamed `DynamicLight::ELightType::SpotLight` to `DummyLight`.
- Made `Side::V1` be `clearscope`.
- Made `Side::V2` be `clearscope`.
- Made `SecPlane::ZatPoint` be `clearscope`.
- Made `SecPlane::HeightDiff` be `const`.
- Made `Weapon::CheckAmmo` and `Weapon::DepleteAmmo` be `virtual`.

Version 3.3.1

- Made `A_SetSize`'s `radius` parameter have a default.
- Made all `DehInfo` members `readonly`.
- Made all `State` members `readonly`.
- Made `Side::Sector` and `Side::Linedef` be `readonly`.

Version 3.3.2

- Added `SPAC`.
- Added `Line::Activate`.
- Added `Line::RemoteActivate`.

Version 3.4

- Added `Actor::OnGiveSecret`.
- Added `LevelLocals::Vec2Offset`.
- Added `LevelLocals::Vec2OffsetZ`.
- Added `LevelLocals::Vec3Offset`.
- Added `WorldEvent::ActivationType`.
- Added `Line::ESide`.
- Added `DTA_Desaturate`.
- Added `DTA_Color`.
- Added `DTA_FlipY`.
- Added `DTA_SrcX`.
- Added `DTA_SrcY`.
- Added `DTA_SrcWidth`.
- Added `DTA_SrcHeight`.
- Added "`internal`" keyword.
- Made `LevelLocals::SectorPortals` be `internal`.
- Made `Sector::Portals` be `internal`.
- Changed `PlayerPawn::ResetAirSupply`'s `playgasp` default to `true`.

Version 3.5

- Added `Menu::SetVideoMode`.
- Added `DTA_LegacyRenderStyle`.
- Added `Shape2D`.
- Added `Screen::DrawShape`.
- Added `MeansOfDeath` parameter to `Actor::Die`.
- Replaced `ListMenuItemPlayerDisplay::mTranslation` with `mBaseColor` and `mAddColor`.

Version 3.5.1

- Added `String::RightIndexOf`.
- Made `Actor::DeltaAngle` be `clearscope`.
- Made `Actor::AbsAngle` be `clearscope`.
- Made `Actor::AngleToVector` be `clearscope`.
- Made `Actor::RotateVector` be `clearscope`.
- Made `Actor::Normalize180` be `clearscope`.
- Made `Actor::BobSin` be `clearscope`.
- Made `Actor::GetDefaultSpeed` be `clearscope`.
- Made `Actor::FindState` be `clearscope`.
- Made `Actor::GetDropItems` be `clearscope`.
- Deprecated `String::LastIndexOf`.

Version 3.6

- Added `Inventory::OnDrop`.
- Added `GLTextureGLOptions`.
- Added `Actor::A_CheckForResurrection`.
- Added `Actor::A_RaiseSelf`.
- Added `Actor::CanRaise`.
- Added `Actor::Revive`.
- Added `Screen::DrawThickLine`.
- Added `LevelLocals::SphericalCoords`.
- Added `StaticEventHandler::CheckReplacement`.
- Added `StaticEventHandler::NewGame`.
- Added `DMG_EXPLOSION`.
- Added `TRF_SOLIDACTORS`, `TRF_BLOCKUSE`, and `TRF_BLOCKSELF`.
- Made `StatusScreen::End` be `virtual`.

Top-level
---------

A ZScript file can have one of several things at the top level of the file, following a version directive:

- Class definitions
- Structure definitions
- Enumeration definitions
- Constant definitions
- Include directives

Class definitions
-----------------

A class defines an object type within ZScript, and is most of what you'll be creating within the language.

All classes inherit from other classes. The base class can be set within the class header, but if it is not the class will automatically inherit from Object.

Classes are subject to Scoping. They are also implicitly reference values, and therefore can be null. Use `new` to instantiate a new class object.

Classes that inherit from Actor can replace other actors when spawned in maps, and can also be used freely in `DECORATE`. Actors have states, which will not be explained in this document as they are already well-documented on the ZDoom wiki.

A class is formed with the syntax:

```
class Name [: BaseClass] [Class flags...]
{
   [Class content...]
}
```

Or, alternatively, the rest of the file can be used as class content. Note that with this syntax you cannot use include directives afterward:

```
class Name [: BaseClass] [Class flags...];

[Class content...]
```

If the class is defined within the same archive as the current file, then one can continue a class definition with the syntax:

```
extend class Name
```

In place of the class header.

### Class flags

| Flag                    | Description                                                                    |
| ----                    | -----------                                                                    |
| `abstract`              | Cannot be instantiated with `new`.                                             |
| `native`                | Class is from the engine. Only usable internally.                              |
| `play`                  | Class has Play scope.                                                          |
| `replaces ReplaceClass` | Replaces `ReplaceClass` with this class. Only works with descendants of Actor. |
| `ui`                    | Class has UI scope.                                                            |
| `version("ver")`        | Restricted to ZScript version `ver` or higher.                                 |

### Class content

Class contents are an optional list of various things logically contained within the class, including:

- Member declarations
- Method definitions
- Property definitions
- Default blocks
- State definitions
- Enumeration definitions
- Structure definitions
- Constant definitions
- Static array definitions

### Property definitions

Property definitions are used within classes to define defaultable attributes on actors. They are not valid on classes not derived from Actor.

When registered, a property will be available in the `default` block as `ClassName.PropertyName`. Properties can be given multiple members to initialize.

Property definitions take the form `property Name: Member list...;`.

Properties defined in ZScript are usable from `DECORATE`.

### Default blocks

Default blocks are used on classes derived from Actor to create an overridable list of defaults to properties, allowing for swift creation of flexible actor types.

In `DECORATE`, this is everything that isn't in the `states` block, but in ZScript, for syntax flexibility purposes, it must be enclosed in a block with `default` at the beginning, formed:

```
default
{
   Default statement list...
}
```

Default statements include flags and properties. Flags are the same as `DECORATE`, though sub-actor flags require their prefix, and can optionally be followed by a semicolon. Properties are the same as `DECORATE`, with a terminating semicolon required.

### State definitions

These are the same as `DECORATE`, but states that do not have function blocks require terminating semicolons. Double quotes around `####` and `----` are no longer required. State blocks can be subject to Action Scoping with the syntax `states(Scope)`.

Structure definitions
---------------------

A structure is an object type that does not inherit from Object and is not always (though occasionally is) a reference type, unlike classes. Structures marked as `native` are passed by-reference to and from the engine in an implicit pseudo-type `Pointer<T>`, and `null` can be passed in their place. Also note that this means the engine can return `null` structures. Non-native structures cannot be passed as arguments or returned normally.

Structures are preferred for basic compound data types that do not need to be instanced and are often used as a way of generalizing code. They cannot be returned from functions.

Structures are subject to Scoping.

A structure takes the form of:

```
struct Name [Structure flags...]
{
   [Structure content...]
}
```

Optionally followed by a semicolon.

### Structure flags

| Flag             | Description                                                             |
| ----             | -----------                                                             |
| `clearscope`     | Structure has Data scope. Default.                                      |
| `native`         | Structure is from the engine. Only usable internally.                   |
| `play`           | Structure has Play scope.                                               |
| `ui`             | Structure has UI scope.                                                 |
| `version("ver")` | Restricted to ZScript version `ver` or higher.                          |

### Structure content

Structure contents are an optional list of various things logically contained within the structure, including:

- Member declarations
- Method definitions
- Enumeration definitions
- Constant definitions

Enumeration definitions
-----------------------

An enumeration is a list of named numbers, which by default will be incremental from 0. By default they decay to the type `int`, but the default decay type can be set manually.

An enumeration definition takes the form:

```
enum Name [: IntegerType]
{
   [Enumerator...]
}
```

Optionally followed by a semicolon.

Enumerators can either be incremental (from the last enumerator or 0 if there is none) or explicitly set with the basic syntax `enumerator = value`. Enumerators must be followed by a comma unless it is the end of the list.

Constant definitions
--------------------

Constants are simple named values. They are created with the syntax:

```
const Name = value;
```

Constants are not assignable. Their type is inferred from their value, so if you wish for them to have a specific type, you must cast the value to that type.

Static array definitions
-------------------------

Similar to constants, static arrays are named values, but for an array. They are created with the syntax:

```
static const Type name[] = {
   [Expression list...]
};
```

Or:

```
static const Type[] name = {
   [Expression list...]
};
```

Static arrays cannot be multi-dimensional, unlike normal arrays.

Include directives
------------------

Include directives include other files to be processed by the ZScript compiler, allowing you to organize and separate code into different files. Their syntax is simple:

```
#include "filename"
```

Note that included filenames will conflict with other mods. If two mods have a file named `zscript/MyCoolClasses.zsc` and both include it, expecting to get different files, the engine will fail to load with a script error.

To avoid this, it is suggested to place your ZScript code under a uniquely named sub-folder.

Types
-----

ZScript has several categories of types: Integer types, floating-point (decimal) types, strings, vectors, names, classes, et al. There are a wide variety of ways to use these types, as well as a wide variety of places they are used.

Types determine what kind of value an object stores, how it acts within an expression, etc. All objects, constants and enumerations have a type. Argument lists use types to ensure a function is used properly.

Most basic types have methods attached to them, and both integer and floating-point type names have symbols accessible from them. See the API section for more information.

### Integers

Integer types are basic integral numbers. They include:

| Name     | Usable as argument | Bits | Lowest value   | Highest value |
| ----     | :----------------: | :--: | -----------:   | :------------ |
| `int`    | Yes                | 32   | -2,147,483,648 | 2,147,483,647 |
| `uint`   | Yes                | 32   | 0              | 4,294,967,296 |
| `int16`  | No                 | 16   | -32,768        | 32,767        |
| `uint16` | No                 | 16   | 0              | 65,535        |
| `int8`   | No                 | 8    | -128           | 127           |
| `uint8`  | No                 | 8    | 0              | 255           |

### Floating-point types

Floating-point types hold exponents, generally represented as regular decimal numbers. There are two such types available to ZScript:

| Name      | Usable as argument | Notes                                                              |
| ----      | :----------------: | -----                                                              |
| `double`  | Yes                | 64-bit floating-point number.                                      |
| `float`   | Yes (64 bits)      | 32-bit in structures and classes, 64-bit otherwise.                |
| `float64` | Yes                | Alias for `double`.                                                |
| `float32` | No                 | 32-bit floating-point number. Not implemented correctly, unusable. |

### Strings

| Name      | Usable as argument |
| ----      | :----------------: |
| `string`  | Yes                |

The `string` type is a mutable, garbage-collected string reference type. Strings are not structures or classes, however there are methods attached to the type, detailed in the API section.

### Names

| Name      | Usable as argument |
| ----      | :----------------: |
| `name`    | Yes                |

The `name` type is an indexed string. While their contents are the same as a string, their actual value is merely an integer which can be compared far quicker than a string. Names are used for many internal purposes such as damage type names. Strings are implicitly cast to names.

### Color

| Name      | Usable as argument |
| ----      | :----------------: |
| `color`   | Yes                |

The `color` type can be converted from a string using the `X11RGB` lump or a hex color in the format `#RRGGBB`, or with either `color(R, G, B)` or `color(A, R, G, B)`.

### Vectors

| Name      | Usable as argument |
| ----      | :----------------: |
| `vector2` | Yes                |
| `vector3` | Yes                |

There are two vector types in ZScript, `vector2` and `vector3`, which hold two and three members, respectively. Their members can be accessed through `x`, `y` and (for `vector3`,) `z`. `vector3` can additionally get the X and Y components as a `vector2` with `xy`.

Vectors can use many operators and even have special ones to themselves. See the Expressions and Operators section for more information.

### Fixed-size arrays

| Name         | Usable as argument |
| ----         | :----------------: |
| `Type[size]` | No                 |

Fixed-size arrays take the form `Type[size]`. They hold `size` number of `Type` elements, which can be accessed with the array access operator. Multi-dimensional arrays are also supported.

### Dynamic-size arrays

| Name          | Usable as argument |
| ----          | :----------------: |
| `array<Type>` | Yes                |

Dynamically sized arrays take the form `array<Type>`, and hold an arbitrary number of `Type` elements, which can be accessed with the array access operator.

Dynamic-sized arrays do not have their lifetime scoped to their current block, so:

```
for(int i = 0; i < 5; i++)
{
   array<int> a;
   a.Push(0);
}
```

Will result in an array with 5 elements.

Dynamically sized arrays also cannot store other dynamically sized arrays, or `struct` objects.

### Maps

| Name              | Usable as argument |
| ----              | :----------------: |
| `map<Type, Type>` | No                 |

Map types take the form `map<Type, Type>`. They are not yet implemented.

### Class type references

| Name          | Usable as argument |
| ----          | :----------------: |
| `class<Type>` | Yes                |
| `class`       | Yes                |

Class type references are used to describe a concrete *type* rather than an object. They simply take the form `class`, and can be restrained to descendants of a type with the syntax `class<Type>`. Strings are implicitly cast to class type references.

### User types

| Name                   | Usable as argument |
| ----                   | :----------------: |
| Any class object       | Yes                |
| `native struct` object | Yes                |
| User `struct` object   | No                 |
| `@Type`                | Yes                |

Any other identifier used as a type will resolve to a user class, structure or enumeration type.

Identifiers prefixed with `@` are native pointers to objects (as opposed to objects placed directly in the structure's data.) This is not usable in user code.

A type name that is within a specific scope can be accessed by prefixing it with a `.`. The type `.MyClass.MySubStructure` will resolve to the type `MySubStructure` contained within `MyClass`.

### Read-only types

| Name             | Usable as argument |
| ----             | :----------------: |
| `readonly<Type>` | Yes                |

A read-only type, as its name implies, may only be read from, and is effectively immutable. They take the form `readonly<Type>`. Do note that this is separate from the member declaration flag.

### Other types

| Name         | Usable as argument | Description                                                     |
| ----         | :----------------: | -----------                                                     |
| `bool`       | Yes                | Holds one of two values: `true` or `false`.                     |
| `sound`      | Yes                | Holds a sound reference.                                        |
| `spriteid`   | Yes                | Holds a sprite reference.                                       |
| `state`      | Yes                | A reference to an actor state.                                  |
| `statelabel` | Yes                | The name of an actor state.                                     |
| `textureid`  | Yes                | Holds a texture reference.                                      |
| `void`       | No                 | Alias for `None`. Unknown purpose, likely implementation error. |
| `voidptr`    | No                 | A pointer to a real memory address. Implementation detail.      |

Strings will implicitly convert to `sound` and `statelabel`.

Expressions and Operators
-------------------------

### Literals

Much like C or most other programming languages, ZScript has object literals, including string literals, integer literals, float literals, name literals, boolean literals, and the null pointer.

#### String literals

String literals take the same form as in C:

```
"text here"
```

String literals have character escapes, which are formed with a backslash and a character. Character escapes include:

| Spelling                | Output                                          |
| --------                | ------                                          |
| `\"`                    | A literal `"`.                                  |
| `\\`                    | A literal `\`.                                  |
| `\` followed by newline | Concatenates the next line with this one.       |
| `\a`                    | Byte `0x07` (`BEL` - bell, anachronism.)        |
| `\b`                    | Byte `0x08` (`BS` - backspace, anachronism.)    |
| `\c`                    | Byte `0x1c` (`TEXTCOLOR_ESCAPE`.)               |
| `\f`                    | Byte `0x0c` (`FF` - form feed, anachronism.)    |
| `\n`                    | Byte `0x0a` (`LF` - new line.)                  |
| `\t`                    | Byte `0x09` (`HT` - tab.)                       |
| `\r`                    | Byte `0x0d` (`CR` - return.)                    |
| `\v`                    | Byte `0x0b` (`VT` - vertical tab, anachronism.) |
| `\?`                    | A literal `?` (obsolete anachronism.)           |
| `\xnn`                  | Byte `0xnn`.                                    |
| `\Xnn`                  | Byte `0xnn`.                                    |
| `\nnn`                  | Byte `0nnn` (octal.)                            |

To quote [cppreference](https://en.cppreference.com/w/cpp/language/escape), "of the octal escape sequences, `\0` is the most useful because it represents the terminating null character in null-terminated strings."

String literals, also like C and C++, will be concatenated when put directly next to each other. For example, this:

```
"text 1" "text 2"
```

Will be parsed as a single string literal with the text `"text 1text 2"`.

#### Class type literals

Class type literals take the same form as string literals, but do note that they are not the same.

#### Name literals

Name literals are similar to string literals, though they use apostrophes instead of quote marks:

```
'text here'
```

They do not concatenate like string literals, and do not have character escapes.

#### Integer literals

Integer literals are formed similarly to C. They may take one of three forms, and be typed `uint` or `int` based on whether there is a `u` or `U` at the end or not.

The parser also supports an optional `l`/`L` suffix as in C, though it does not actually do anything, and it is advised you do not use it for potential forward compatibility purposes.

Integer literals can be in the basic base-10/decimal form:

```
1234567890 // int
500u       // uint
```

Base-16/hexadecimal form, which may use upper- or lower-case decimals and `0x` prefix, depending on user preference:

```
0x123456789ABCDEF0
0XaBcDeF0 // don't do this, please.
0x7fff
0x7FFFFFFF
```

And, base-8/octal form, prefixed with a `0`:

```
0777
0414444
```

#### Float literals

Float literals, much like integer literals, are formed similarly to C, but they do not support hex-float notation. Float literals support exponent notation.

The parser supports an optional `f`/`F` suffix as in C, though it does not actually do anything, and it is advised you do not use it for potential forward compatibility purposes.

Float literals can be formed in a few ways:

```
0.5 //=> 0.5
.5  //=> 0.5
1.  //=> 1.0
```

And with exponents:

```
0.5e+2 //=> 50
50e-2  //=> 0.5
```

#### Boolean literals

The two boolean literals are spelled `false` and `true`, and much like C, can decay to the integer literals `0` and `1`.

#### Null pointer

The null pointer literal is spelled `null` and represents an object that does not exist in memory. Like C, it is not equivalent to the integer literal `0`, and is more similar to C++'s `nullptr`.

### Expressions

Expressions contain literals or other such *expressions* of objects, including arithmetic and various conditions.

#### Primary expressions

Basic expressions, also known as primary expressions, can be one of:

- An identifier for a constant or variable.
- The `Super` keyword.
- Any object literal.
- A vector literal.
- An expression in parentheses.

Identifiers work as you expect, they reference a variable or constant. The `Super` keyword references the parent type or any member within it.

##### Vector literals

Vector literals are not under object literals as they are not constants in the same manner as other literals, since they contain expressions within them. As such, they are expressions, not proper value-based literals. They can be formed with:

```
(x, y)    //=> vector2, where x is not a vector2
(x, y)    //=> vector3, where x *is* a vector2
(x, y, z) //=> vector3
```

All components must have type `double`.

#### Postfix expressions

Postfix expressions are affixed at the end of an expression, and are used for a large variety of things, although the actual amount of postfix expressions is small:

| Form                    | Description                                                                                      |
| ----                    | -----------                                                                                      |
| `a([Argument list...])` | Function call.                                                                                   |
| `Type(a)`               | Type cast.                                                                                       |
| `(class<Type>)(a)`      | Class type reference cast.                                                                       |
| `a[b]`                  | Array access.                                                                                    |
| `a.b`                   | Member access.                                                                                   |
| `a++`                   | Post-increment. This increments (adds 1 to) the object after the expression is evaluated.        |
| `a--`                   | Post-decrement. This decrements (subtracts 1 from) the object after the expression is evaluated. |

#### Unary expressions

Unary expressions are affixed at the beginning of an expression. The simplest example of a unary expression is the negation operator, `-`, as in `-500`. Unary expressions include:

| Form        | Description                                                                           |
| ----        | -----------                                                                           |
| `-a`        | Negation.                                                                             |
| `!a`        | Logical negation, "not."                                                              |
| `++a`       | Pre-increment. This adds 1 to the object and evaluates as the resulting value.        |
| `--a`       | Pre-decrement. This subtracts 1 from the object and evaluates as the resulting value. |
| `~a`        | Bitwise negation. Flips all bits in an integer.                                       |
| `+a`        | Affirmation. Does not actually do anything.                                           |
| `alignof a` | Evaluates the alignment of the type of an expression. Unknown purpose.                |
| `sizeof a`  | Evaluates the size of the type of an expression. Unknown purpose.                     |

#### Binary expressions

Binary expressions operate on two expressions, and are the most common kind of expression. They are used inline like regular math syntax, i.e. `1 + 1`. Binary expressions include:

| Form        | Description                                                                       |
| ----        | -----------                                                                       |
| `a + b`     | Addition.                                                                         |
| `a - b`     | Subtraction.                                                                      |
| `a * b`     | Multiplication.                                                                   |
| `a / b`     | Division quotient.                                                                |
| `a % b`     | Division remainder, also known as "modulus." Unlike C, this works on floats, too. |
| `a ** b`    | Exponent ("power of.")                                                            |
| `a << b`    | Left bitwise shift.                                                               |
| `a >> b`    | Right bitwise shift.                                                              |
| `a >>> b`   | Right unsigned bitwise shift.                                                     |
| `a cross b` | Vector cross-product.                                                             |
| `a dot b`   | Vector dot-product.                                                               |
| `a .. b`    | Concatenation, creates a string from two values.                                  |
| `a < b`     | `true` if `a` is less than `b`.                                                   |
| `a > b`     | `true` if `a` is greater than `b`.                                                |
| `a <= b`    | `true` if `a` is less than or equal to `b`.                                       |
| `a >= b`    | `true` if `a` is greater than or equal to `b`.                                    |
| `a == b`    | `true` if `a` is equal to `b`.                                                    |
| `a != b`    | `true` if `a` is not equal to `b`.                                                |
| `a ~== b`   | `true` if `a` is approximately equal to `b`. For strings this is a case-insensitive comparison, for floats and vectors this checks if the difference between the two is smaller than ε. |
| `a && b`    | `true` if `a` and `b` are both `true`.                                            |
| `a \|\| b`  | `true` if `a` or `b` is `true`.                                                   |
| `a is "b"`  | `true` if `a`'s type is equal to or a descendant of `b`.                          |
| `a <>= b`   | Signed difference between `a` and `b`.                                            |
| `a & b`     | Bitwise AND.                                                                      |
| `a ^ b`     | Bitwise XOR.                                                                      |
| `a \| b`    | Bitwise OR.                                                                       |
| `a::b`      | Scope operator. Not implemented yet.                                              |

##### Assignment expressions

Assignment expressions are a subset of binary expressions which *are never constant expressions*. They assign a value to another value, as one might guess.

| Form       | Description               |
| ----       | -----------               |
| `a = b`    | Assigns `b` to `a`.       |
| `a += b`   | Assigns `a + b` to `a`.   |
| `a -= b`   | Assigns `a - b` to `a`.   |
| `a *= b`   | Assigns `a * b` to `a`.   |
| `a /= b`   | Assigns `a / b` to `a`.   |
| `a %= b`   | Assigns `a % b` to `a`.   |
| `a <<= b`  | Assigns `a << b` to `a`.  |
| `a >>= b`  | Assigns `a >> b` to `a`.  |
| `a >>>= b` | Assigns `a >>> b` to `a`. |
| `a \|= b`  | Assigns `a \| b` to `a`.  |
| `a &= b`   | Assigns `a & b` to `a`.   |
| `a ^= b`   | Assigns `a ^ b` to `a`.   |

#### Ternary expression

The ternary expression is formed `a ? b : c`, and will evaluate to `b` if `a` is `true`, or `c` if it is `false`.

Statements
----------

All functions are made up of a list of *statements* enclosed with left and right braces, which in and of itself is a statement called a *compound statement*, or *block*.

### Compound statements

A compound statement is formed as:

```
{
   [Statement list...]
}
```

Note that the statement list is optional, so an empty compound statement `{}` is entirely valid.

### Expression statements

An expression statement is the single most common type of statement in just about any programming language. In ZScript, exactly like C and C++, an expression statement is simply formed with any expression followed by a semicolon. Function calls and variable assignments are expressions, for instance, so it is quite clear why they are common.

### Conditional statements

A conditional statement will, conditionally, choose a statement (or none) to execute. They work the same as in C and ACS.

### Switch statements

A switch statement takes an expression of integer or name type and selects a labeled statement to run. They work the same as in C and ACS.

### Loop statements

ZScript has five loop statements, `for`, `while`, `until`, `do while` and `do until`. `for`, `while` and `do while` work the same as in C, C++ and ACS, while `until` and `do until` do the inverse of `while` and `do while`.

The `for` loop takes a limited statement and two optional expressions: The statement for when the loop begins (which is scoped to the loop,) one expression for checking if the loop should break, and one which is executed every time the loop iterates.

The `while` loop simply takes one expression for checking if the loop should break, equivalent to `for(; a;)`.

The `until` loop is equivalent to `while(!a)`.

`do while` and `do until` will only check the expression after the first iteration is complete. The `do while` and `do until` loops are formed as such:

```
do
   Statement
while(a) // unlike C, you don't need a semicolon here

do
   Statement
until(a)
```

### Control flow statements

As in C, there are three control flow statements that manipulate where the program will execute statements next, which are available contextually. They are `continue`, `break` and `return`.

`continue` is available in loop statements and will continue to the next iteration immediately.

`break` is available in loop statements and switch statements, and will break out of the containing statement early.

`return` is available in functions. If the function does not return any values, it may only be spelled `return;` and will simply exit the function early. If the function does return values, it takes a comma-separated list for each value returned.

### Local variable statements

Local variable statements are formed in one of 3 ways. The `let` keyword can be used to automatically determine the type of the variable from the initializer, while the other two syntaxes use an explicit type, and initialization is optional.

```
Type a;
Type a[Expression]; // alternate syntax for local array

let a = b;
Type a = b;
Type a = {Expression list...}; // for fixed size array types
Type a[Expression] = {Expression list...};
```

### Multi-assignment statements

Expressions or functions that return multiple values can be assigned into multiple variables with the syntax:

```
[Expression list...] = Expression;
```

### Static array statements

Static arrays can be defined normally as a statement.

### Null statements

A null statement does nothing, and is formed `;`. It is similar to an empty compound statement.

Member declarations
-------------------

Member declarations define data within a structure or class that can be accessed directly within methods of the object (or its derived classes,) or indirectly from instances of it with the member access operator.

A member declaration is formed as so:

```
[Member declaration flags...] Type name;
```

Or, if you want multiple members with the same type and flags:

```
[Member declaration flags...] Type name[, name...];
```

Note that the types `Font` and `CVar` are unserializable as members and must be marked transient.

### Member declaration flags

| Flag                | Description                                                                                                         |
| ----                | -----------                                                                                                         |
| `deprecated("ver")` | If accessed, a script warning will occur on load if the archive version is greater than `ver`.                      |
| `internal`          | Member is only writable from the base resource archive (`gzdoom.pk3`.)                                              |
| `meta`              | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them. |
| `native`            | Member is from the engine. Only usable internally.                                                                  |
| `play`              | Member has Play scope.                                                                                              |
| `private`           | Member is not visible to any class but this one.                                                                    |
| `protected`         | Member is not visible to any class but this one and any descendants of it.                                          |
| `readonly`          | Member is not writable.                                                                                             |
| `transient`         | Member is not saved into save games. Required for unserializable objects and recommended for UI context objects.    |
| `ui`                | Member has UI scope.                                                                                                |
| `version("ver")`    | Restricted to ZScript version `ver` or higher.                                                                      |

Method definitions
------------------

Method definitions define functions within a structure or class that can be accessed directly within other methods of the object (or its derived classes,) or indirectly from instances of it with the member access operator.

Methods marked as `virtual` may have their functionality overridden by derived classes, and in those overrides one can use the `Super` keyword to call the parent function.

Methods are formed as so:

```
[Method definition flags...] Type[, Type...] name([Argument list...]) [const]
{
   [Function body here]
}
```

If `const` is placed after the function signature and before the function body, the method will not be allowed to modify any members in the object instance it's being called on.

The keyword `void` can be used in place of a type (or type list) to have a method which does not have any return value. Similarly, one can place `void` where the argument list might be, although this is redundant as having no argument list at all is allowed.

Arguments of methods may only be of certain types due to technical limitations. See the type table for a list of which are usable and which are not.

### Method definition flags

| Flag                | Description                                                                                    |
| ----                | -----------                                                                                    |
| `action(scope)`     | Same as `action`, but has a specified action scope. See "Action Scoping" for more information. |
| `action`            | Method has implicit `owner` and `state` parameters, mostly useful on weapons.                  |
| `clearscope`        | Method has Data scope.                                                                         |
| `deprecated("ver")` | If accessed, a script warning will occur on load if the archive version is greater than `ver`. |
| `final`             | Virtual method cannot be further overridden from derived classes.                              |
| `native`            | Method is from the engine. Only usable internally.                                             |
| `override`          | Method is overriding a base class' virtual method.                                             |
| `play`              | Method has Play scope.                                                                         |
| `private`           | Method is not visible to any class but this one.                                               |
| `protected`         | Method is not visible to any class but this one and any descendants of it.                     |
| `static`            | Function is not a method, but a global function without a `self` pointer.                      |
| `ui`                | Method has UI scope.                                                                           |
| `vararg`            | Method doesn't type-check arguments after `...`. Only usable internally.                       |
| `version("ver")`    | Restricted to ZScript version `ver` or higher.                                                 |
| `virtual`           | Method can be overridden in derived classes.                                                   |
| `virtualscope`      | Method has scope of the type of the object it's being called on.                               |

Concepts
========

Action Scoping
--------------

On classes derived from Actor, states and methods can be scoped to a certain subset of uses. This is mainly to differentiate actions which take place in inventory items and weapons, and actions which take place in the actual game map. The available scopes are:

| Name      | Description                                   |
| ----      | -----------                                   |
| `actor`   | Actions are called from an actual map object. |
| `item`    | Actions are called from an inventory item.    |
| `overlay` | Actions are called from a weapon overlay.     |
| `weapon`  | Actions are called from a weapon.             |

Object Scoping
--------------

Most objects are subject to object scoping, which restricts the way data can be used in certain contexts. This is to ensure that the game simulation does not get changed by the UI, for instance, or that the game simulation doesn't read from the UI and break network synchronization. In other words, it is to prevent a multitude of errors that arise when data is modified or read from the wrong places.

There are three scopes in ZScript: Play, UI, and Data (also known as "`clearscope`.") The Play scope is used for objects that are part of the game simulation and interact with the world in some way or another, while the UI scope is for objects that have no correlation with the world besides perhaps reading information from it. The Data scope is shared between the two, and must be used carefully.

Here is a chart of data access possibilities for each scope:

|                   | Data scope | Play scope | UI scope   |
| -                 | ---------- | ---------- | ---------- |
| From Data context | Read/write | Read-only  | No access  |
| From Play context | Read/write | Read/write | No access  |
| From UI context   | Read/write | Read-only  | Read/write |

Format String
-------------

A format string is a string that specifies the format of a conversion from arbitrary data to a contiguous character string. A format string contains normal characters and *conversion specifiers*. See [this page](https://en.cppreference.com/w/c/io/fprintf) for more information. Differences between C's `printf` and ZScript formats include:

- Since there's no `char` type, `int` is used for `%c`.
- `%s` also works for `name`.
- No `%n` specifier.
- An additional conversion specifier `%B` exists which converts a number to binary.
- An additional conversion specifier `%H` exists which works like `%g` but automatically selects the smallest appropriate precision.

Sprite
------

A sprite is stored in two numbers: the *sprite ID* (represented by the `spriteid` type or sometimes `int`) and the *sprite frame* (represented by an `int` or `uint8` usually.) The rotation is generally irrelevant as only the `0` (front rotation) frame is used in most contexts. The sprite frame is, unlike the file and state block representations, not a character, but an integer. The number `0` for instance represents the letter `A`, `1` to `B`, etc.

For more information on sprites and rotations, please refer to [the Doom Wiki article on sprites](https://doomwiki.org/wiki/Sprite).

Game Tick
---------

The Doom engine, as long as it has existed and into every faithful-enough port of it, no matter how different from the source material, runs the game simulation in the same way:

- Input events are processed.

   Keyboard, mouse, gamepad, etc. if a local player, the demo file if watching a demo, packets over the internet in networked games.

- The game is *ticked*.

   Every 1/35th of a second that passes, a new "game tick" takes place, also referred to as *gametic*, *tick* or simply *tic*.

- The game is rendered.

   All information from the *current* game tick is rendered. This usually happens more often than the game is actually ticked. In ZDoom, Eternity Engine, and some other ports, the information is interpolated between the last and current game tick when there is extra time available to give smoother rendering.

Interpolation
-------------

TODO

API
===

The ZScript API is vast and has some holes which are hard to explain. Some parts are implemented in ways that don't make sense to user code, but are fine to the engine. Because of this, the API shall be documented in pseudo-ZScript which gives an idea of how it works for the modder rather than for the engine.

Type symbols
------------

Integer and floating-point types have symbols which can be accessed through `typename.name`. Here is a list of them.

### Integer types

- `Max`

   Maximum value of type.

- `Min`

   Minimum value of type.

### Floating-point types

- `Dig`

   Number of decimal digits in type.

- `Epsilon`

   ε value of type.

- `Infinity`

   ∞ value of type.

- `Mant_Dig`

   Number of mantissa bits in type.

- `Max`

   Maximum value of type.

- `Max_Exp`

   Maximum exponent bits value of type.

- `Max_10_Exp`

   Maximum exponent of type.

- `Min_Denormal`

   Minimum positive subnormal value of type.

- `Min_Exp`

   Minimum exponent bits value of type.

- `Min_Normal`

   Minimum value of type.

- `Min_10_Exp`

   Minimum exponent of type.

- `NaN`

   Not-a-Number value of type.

Globals
-------

### Global functions

#### Class handling

```
Type GetDefaultByType(TypeName);
Type New(class typename = ThisClass);
```

- `GetDefaultByType`

   Gets the default value of any built-in type.

- `New`

   Typically spelled lowercase (`new`), creates an object with type `typename`. Defaults to using the class of the calling object.

#### Random number generation

All of these functions may have `[identifier]` between the function name and the argument list to specify a named RNG table to use.

```
double FRandom(double min, double max);
double FRandomPick(double...);
int    Random(int min = 0, int max = 255);
int    Random2(uint mask = uint.Max);
int    RandomPick(int...);
void   SetRandomSeed(uint num);
```

- `FRandom`

   Returns a random float between `min` and `max`.

- `FRandomPick`

   Same as `RandomPick`, but with floats.

- `Random`

   Returns a random integer between `min` and `max`.

- `Random2`

   Returns a random integer value between `-mask` and `mask`. `mask` is used as a bit mask, so it is recommended to use a value of one less than a power of two (i.e. 3, 7, 15, 31, 63, 127, 255...)

- `RandomPick`

   Returns one of the provided parameters randomly.

- `SetRandomSeed`

   Sets the seed of the RNG table to `num`.

#### Math

```
Type   Abs(Type n);
double ATan2(double y, double x);
uint   BAM(double angle);
Type   Clamp(Type n, Type minimum, Type maximum);
Type   Max(Type n, Type maximum);
Type   Min(Type n, Type minimum);
double VectorAngle(double x, double y);
```

- `Abs`

   Returns `|n|` (absolute of `n`.)

- `ATan2`

   Computes the arctangent of `y / x` using the arguments' signs to determine the correct quadrant.

- `BAM`

   Returns a byte angle of `angle` (`degrees * (0x40000000 / 90.0)`.)

- `Clamp`

   Returns `n` if `n` is more than `minimum` and less than `maximum`, or either of those values if it is not.

- `Max`

   Returns `n` if `n` is less than `maximum`, or `maximum`.

- `Min`

   Returns `n` if `n` is more than `minimum`, or `minimum`.

- `VectorAngle`

   Same as `ATan2`, but with arguments reversed.

#### Game

```
string G_SkillName();
int    G_SkillPropertyInt(int p);
double G_SkillPropertyFloat(int p);

vector3, int G_PickDeathmatchStart();
vector3, int G_PickPlayerStart(int pnum, int flags = 0);
```

- `G_SkillName`

   The name of the skill in play.

- `G_SkillPropertyInt`

   Returns a skill property. `p` may be:

   | Name                   |
   | ----                   |
   | `SKILLP_ACSReturn`     |
   | `SKILLP_AutoUseHealth` |
   | `SKILLP_DisableCheats` |
   | `SKILLP_EasyBossBrain` |
   | `SKILLP_EasyKey`       |
   | `SKILLP_FastMonsters`  |
   | `SKILLP_Infight`       |
   | `SKILLP_NoPain`        |
   | `SKILLP_PlayerRespawn` |
   | `SKILLP_RespawnLimit`  |
   | `SKILLP_Respawn`       |
   | `SKILLP_SlowMonsters`  |
   | `SKILLP_SpawnFilter`   |

- `G_SkillPropertyFloat`

   Returns a skill property. `p` may be:

   | Name                    |
   | ----                    |
   | `SKILLP_Aggressiveness` |
   | `SKILLP_AmmoFactor`     |
   | `SKILLP_ArmorFactor`    |
   | `SKILLP_DamageFactor`   |
   | `SKILLP_DropAmmoFactor` |
   | `SKILLP_FriendlyHealth` |
   | `SKILLP_HealthFactor`   |
   | `SKILLP_MonsterHealth`  |

- `G_PickDeathmatchStart`

   Returns the position and angle of a random deathmatch start location.

- `G_PickPlayerStart`

   Returns the position and angle of a player start for player `pnum`. `flags` may be:

   | Name                  | Description                                               |
   | ----                  | -----------                                               |
   | `PPS_FORCERANDOM`     | Always picks a random player spawn for this player.       |
   | `PPS_NOBLOCKINGCHECK` | Does not check if an object is blocking the player spawn. |

#### Sound

```
void  SetMusicVolume(float vol);
bool  S_ChangeMusic(string music_name, int order = 0, bool looping = true, bool force = false);
float S_GetLength(sound sound_id);
void  S_PauseSound(bool notmusic, bool notsfx);
void  S_ResumeSound(bool notsfx);
void  S_Sound(sound sound_id, int channel, float volume = 1, float attenuation = ATTN_NORM);
```

- `SetMusicVolume`

   Sets the volume of the music relative to the user's volume. Range is 0-1, inclusive.

- `S_ChangeMusic`

   Changes the music to `music_name`. If `music_name` is `"*"`, the music will be set to the default music for this level. Will loop if `looping` is `true`. `force` will force the music to play even if a playlist (from the `playlist` console command) is playing.

   `order` may mean something different based on the music format:

   | Format                              | Meaning                                     |
   | ------                              | -------                                     |
   | Tracker music (`.mod`, `.xm`, etc.) | Specifies the order the song will start at. |
   | Multi-track `.ogg`, `.flac`, etc.   | Specifies the track to begin playing at.    |
   | Any other format                    | No meaning, will be ignored.                |

- `S_GetLength`

   Returns the length of a sound in seconds. **Potentially non-deterministic if all users in a networked game are not using the same sounds.**

- `S_PauseSound`

   Pauses music if `notmusic` is `false` and all game sounds if `notsfx` is `false`. Used for instance in the time stop power-up.

- `S_ResumeSound`

   Resumes playing music and, if `notsfx` is `false`, all game sounds as well.

- `S_Sound`

   Plays a sound (as defined in `SNDINFO`) from the calling object if it has world presence (is an actor or sector etc.)

   `channel` may be:

   | Name          | Description                                                        |
   | ----          | -----------                                                        |
   | `CHAN_AUTO`   | Automatically assigns the sound to a free channel (if one exists.) |
   | `CHAN_BODY`   | For footsteps and generally anything else.                         |
   | `CHAN_ITEM`   | For item pickups.                                                  |
   | `CHAN_VOICE`  | For player grunts.                                                 |
   | `CHAN_WEAPON` | For weapon noises.                                                 |
   | `CHAN_5`      | Extra sound channel.                                               |
   | `CHAN_6`      | Extra sound channel.                                               |
   | `CHAN_7`      | Extra sound channel.                                               |

   `channel` may also have the following flags applied with the binary OR operator `|`:

   | Name               | Description                                                                              |
   | ----               | -----------                                                                              |
   | `CHAN_LISTENERZ`   | Sound ignores height entirely, playing at the listener's vertical position.              |
   | `CHAN_LOOP`        | Continues playing the sound on loop until it is stopped manually.                        |
   | `CHAN_MAYBE_LOCAL` | Does not play sound to other players if the silent pickup compatibility flag is enabled. |
   | `CHAN_NOPAUSE`     | Does not pause in menus or when `S_PauseSound` is called.                                |
   | `CHAN_NOSTOP`      | Does not start a new sound if the channel is already playing something.                  |
   | `CHAN_UI`          | Does not record sound in saved games or demos.                                           |

   Additionally, `CHAN_PICKUP` is equivalent to `CHAN_ITEM | CHAN_MAYBE_LOCAL`.

   `attenuation` determines the drop-off distance of the sound. The higher the value, the quicker it fades. Constants include:

   | Name          | Value   | Description                                                                         |
   | ----          | -----   | -----------                                                                         |
   | `ATTN_IDLE`   | `1.001` | Uses Doom's default sound attenuation.                                              |
   | `ATTN_NONE`   | `0`     | Does not drop off at all, plays throughout the whole map.                           |
   | `ATTN_NORM`   | `1`     | Drops off using the `close_dist` and `clipping_dist` defined in `SNDINFO`. Default. |
   | `ATTN_STATIC` | `3`     | Drops off quickly, at around 512 units.                                             |

#### System

```
uint MSTime();
vararg void ThrowAbortException(string format, ...);
```

- `MSTime`

   Returns the number of milliseconds since the engine was started. **Not deterministic.**

- `ThrowAbortException`

   Kills the VM and ends the game (without exiting) with a formatted error.

### Global variables

These variables are accessible in any context and are not bound by any specific object.

#### Static info

```
readonly array<class<Actor>> AllActorClasses;
readonly array<PlayerClass>  PlayerClasses;
readonly array<PlayerSkin>   PlayerSkins;
readonly array<Team>         Teams;

play     DehInfo             DEH;
readonly GameInfoStruct      GameInfo;
readonly FOptionMenuSettings OptionMenuSettings;
readonly textureid           SkyFlatNum;
readonly Weapon              WP_NOCHANGE;
```

- `AllActorClasses`

   As the name implies, an array of every actor class type reference.

- `PlayerClasses`

   An array of all player classes as defined in `MAPINFO`/GameInfo and `KEYCONF`.

- `PlayerSkins`

   An array of all player skins as defined in `SKININFO` and `S_SKIN`.

- `Teams`

   An array of all teams. Maximum index is `Team.Max`.

- `DEH`

   Static DeHackEd information.

- `GameInfo`

   Static information from `MAPINFO`/GameInfo.

- `OptionMenuSettings`

   TODO

- `SkyFlatNum`

   The texture ID for sky flats. `F_SKY1` by default in Doom.

- `WP_NOCHANGE`

   A constant denoting that the weapon the player is currently holding shouldn't be switched from.

#### Game state

```
readonly bool        AutomapActive;
readonly bool        DemoPlayback;
play     uint        GameAction;
readonly int         GameState;
readonly int         GameTic;
readonly uint8       GlobalFreeze;
play     LevelLocals Level;

int ValidCount;
```

- `AutomapActive`

   `true` if the auto-map is currently open on the client. **Not deterministic.**

- `DemoPlayback`

   User is watching a demo.

- `GameAction`

   Current global game action. May be one of:

   | Name                  | Description           |
   | ----                  | -----------           |
   | `ga_autoloadgame`     | Don't use this.       |
   | `ga_autosave`         | Creates an autosave.  |
   | `ga_completed`        | Don't use this.       |
   | `ga_fullconsole`      | Don't use this.       |
   | `ga_loadgamehideicon` | Don't use this.       |
   | `ga_loadgameplaydemo` | Don't use this.       |
   | `ga_loadgame`         | Don't use this.       |
   | `ga_loadlevel`        | Don't use this.       |
   | `ga_newgame2`         | Don't use this.       |
   | `ga_newgame`          | Don't use this.       |
   | `ga_nothing`          | Does nothing.         |
   | `ga_playdemo`         | Don't use this.       |
   | `ga_recordgame`       | Don't use this.       |
   | `ga_savegame`         | Don't use this.       |
   | `ga_screenshot`       | Takes a screenshot.   |
   | `ga_slideshow`        | Don't use this.       |
   | `ga_togglemap`        | Toggles the auto-map. |
   | `ga_worlddone`        | Don't use this.       |

- `GameState`

   Current global game state. May be one of:

   | Name              | Description                                          |
   | ----              | -----------                                          |
   | `GS_DEMOSCREEN`   | Inside a level but watching a demo in the main menu. |
   | `GS_FINALE`       | Reading a cluster end text or at the end sequence.   |
   | `GS_FULLCONSOLE`  | Outside of a level, console only.                    |
   | `GS_HIDECONSOLE`  | Outside of a level, console hidden (i.e. main menu.) |
   | `GS_INTERMISSION` | In between levels.                                   |
   | `GS_LEVEL`        | Inside a level.                                      |
   | `GS_STARTUP`      | Game not yet initialized.                            |
   | `GS_TITLELEVEL`   | Watching a `TITLEMAP` in the main menu.              |

- `GameTic`

   Number of game tics passed since engine initialization. **Not deterministic.**

- `GlobalFreeze`

   TODO: I have no idea what the difference between this and `Level.Frozen` is.

- `Level`

   All level info as defined in `LevelLocals`.

- `ValidCount`

   Don't use this.

#### Client

```
KeyBindings AutomapBindings;
KeyBindings Bindings;

readonly Font BigFont;
readonly int  CleanHeight;
readonly int  CleanHeight_1;
readonly int  CleanWidth;
readonly int  CleanWidth_1;
readonly int  CleanXFac;
readonly int  CleanXFac_1;
readonly int  CleanYFac;
readonly int  CleanYFac_1;
readonly Font ConFont;
readonly Font IntermissionFont;
readonly Font SmallFont;
readonly Font SmallFont2;

ui float         BackbuttonAlpha;
ui int           BackbuttonTime;
ui int           MenuActive;
ui BaseStatusBar StatusBar;

int LocalViewPitch;
```

- `AutomapBindings`

   TODO

- `Bindings`

   TODO

- `BigFont`

   The `bigfont` for the current game.

- `CleanHeight`

   The current screen height divided by `CleanYFac`. **Not deterministic.**

- `CleanHeight_1`

   The current screen height divided by `CleanYFac_1`. **Not deterministic.**

- `CleanWidth`

   The current screen width divided by `CleanXFac`. **Not deterministic.**

- `CleanWidth_1`

   The current screen width divided by `CleanYFac_1`. **Not deterministic.**

- `CleanXFac`

   Integral scaling factor for horizontal positions to scale from 320x200 to the current virtual resolution. **Not deterministic.**

- `CleanXFac_1`

   Integral scaling factor for horizontal positions to scale from 320x200 to the current virtual resolution, accounting for aspect ratio differences. **Not deterministic.**

- `CleanYFac`

   Integral scaling factor for vertical positions to scale from 320x200 to the current virtual resolution. **Not deterministic.**

- `CleanYFac_1`

   Integral scaling factor for vertical positions to scale from 320x200 to the current virtual resolution, accounting for aspect ratio differences. **Not deterministic.**

- `ConFont`

   The console font.

- `IntermissionFont`

   The font used in intermission screens.

- `SmallFont`

   The `smallfnt` for the current game.

- `SmallFont2`

   The alternate `smallfnt`.

- `BackbuttonAlpha`

   Alpha of the back button in menus.

- `BackbuttonTime`

   The time until the back button starts fading out in menus.

- `MenuActive`

   The current active menu state. One of:

   | Name             | Description                                                    |
   | ----             | -----------                                                    |
   | `Menu.Off`       | No active menu.                                                |
   | `Menu.OnNoPause` | Menu is opened, but the game is not paused.                    |
   | `Menu.On`        | Menu is open, game is paused.                                  |
   | `Menu.WaitKey`   | Menu is opened, waiting for a key for a controls menu binding. |

- `StatusBar`

   TODO

- `LocalViewPitch`

   The pitch angle (in degrees) of `ConsolePlayer`'s view. **Not deterministic.**


#### Players

```
readonly int        ConsolePlayer;
readonly bool       Multiplayer;
readonly int        Net_Arbitrator;
readonly bool       PlayerInGame[MAXPLAYERS];
play     PlayerInfo Players[MAXPLAYERS];
```

- `ConsolePlayer`

   Number of the player running the client. **Not deterministic.**

- `Multiplayer`

   Game is networked.

- `Net_Arbitrator`

   Number of the player who initiated or currently hosts the game.

- `PlayerInGame`

   `true` if the player is currently in-game.

- `Players`

   `PlayerInfo` structures for each player.

Built-in Types
--------------

### Array

While ZScript does not have proper user-facing generics, `Array` is one such type that does have a type parameter. It mirrors the internal `TArray` type.

```
struct Array<Type>
{
   void Clear();
   void Copy(array<Type> other);
   void Delete(uint index, int count = 1);
   uint Find(Type item) const;
   void Grow(uint amount);
   void Insert(uint index, Type item);
   uint Max() const;
   void Move(array<Type> other);
   bool Pop();
   uint Push(Type item);
   uint Reserve(uint amount);
   void Resize(uint amount);
   void ShrinkToFit();
   uint Size() const;
}
```

- `Clear`

   Clears out the entire array.

- `Copy`

   Copies another array's contents into this array.

- `Delete`

   Deletes `count` object(s) at `index`. Moves objects after them into their place.

- `Find`

   Finds the index of `item` in the array, or `Size` if it couldn't be found.

- `Grow`

   Ensures the array can hold at least `amount` new members.

- `Insert`

   Inserts `item` at `index`. Moves objects after `index` to the right.

- `Max`

   Returns the allocated size of the array.

- `Move`

   Moves another array's contents into this array.

- `Pop`

   Deletes the last item in the array. Returns `false` if there are no items in the array.

- `Push`

   Places `item` at the end of the array, calling `Grow` if necessary.

- `Reserve`

   Adds `amount` new entries at the end of the array, increasing `Size`. Calls `Grow` if necessary.

- `Resize`

   Changes the allocated array size to `amount`. Deletes members if `amount` is smaller than `Size`.

- `ShrinkToFit`

   Shrinks the allocated array size `Max` to `Size`.

- `Size`

   Returns the amount of objects in the array.

### Color

Colors simply store red, green, blue and alpha components. Each component has a range 0 to 255, inclusive.

```
struct Color
{
   uint8 r, g, b, a;
}
```

### FixedArray

Fixed-size arrays have a size method attached to them for convenience purposes.

```
struct FixedArray
{
   uint Size() const;
}
```

- `Size`

   Returns the size of the array. This is a compile-time constant.

### String

```
struct String
{
   static vararg string Format(string format, ...);

   vararg void AppendFormat(string format, ...);

   string CharAt(int pos) const;
   int    CharCodeAt(int pos) const;
   string Filter();
   int    IndexOf(string substr, int start = 0) const;
   string Left(int len) const;
   uint   Length() const;
   string Mid(int pos = 0, int len = int.Max) const;
   void   Remove(int index, int amount);
   void   Replace(string pattern, string replacement);
   int    RightIndexOf(string substr, int end = int.Max) const;
   void   Split(out array<string> tokens, string delimiter, EmptyTokenType keepEmpty = TOK_KEEPEMPTY) const;
   double ToDouble() const;
   int    ToInt(int base = 0) const;
   void   ToLower();
   void   ToUpper();
   void   Truncate(int newlen);

   deprecated("3.5.1") int LastIndexOf(string substr, int end = int.Max) const;
}
```

- `Format`

   Creates a string using a format string and any amount of arguments.

- `AppendFormat`

   Works like `Format`, but appends the result to the string.

- `CharAt`

   Returns the character at `pos` as a new string.

- `CharCodeAt`

   Returns the character at `pos` as an integer.

- `Filter`

   Replaces escape sequences in a string with escaped characters as a new string.

- `IndexOf`

   Returns the first index of `substr` starting from the left at `start`.

- `Left`

   Returns the first `len` characters as a new string.

- `Length`

   Returns the number of characters in this string.

- `Mid`

   Returns `len` characters starting at `pos` as a new string.

- `Remove`

   Removes `amount` characters starting at `index` in place.

- `Replace`

   Replaces all instances of `pattern` with `replacement` in place.

- `RightIndexOf`

   Returns the first index of `substr` starting from the right at `end`.

- `Split`

   Splits the string by each `delimiter` into `tokens`. `keepEmpty` may be either `TOK_SKIPEMPTY` (the default) or `TOK_KEEPEMPTY`, which will keep or discard empty strings found while splitting.

- `ToDouble`

   Interprets the string as a double precision floating point number.

- `ToInt`

   Interprets the string as a base `base` integer, guessing the base if it is `0`.

- `ToLower`

   Converts all characters in the string to lowercase in place.

- `ToUpper`

   Converts all characters in the string to uppercase in place.

- `Truncate`

   Truncates the string to `len` characters in place.

- `LastIndexOf`

   Broken. Use `RightIndexOf` instead.

### TextureID

Texture IDs can be explicitly converted to integers, but not the other way around. You can add and subtract integers with a `textureid`, however. (This only works with the integer on the right hand side.)

```
struct TextureID
{
   bool Exists() const;
   bool IsNull() const;
   bool IsValid() const;
   void SetInvalid();
   void SetNull();
}
```

- `Exists`

   Checks if the texture exists within the texture manager at all.

- `IsNull`

   Checks if the texture is the null index (`0`.)

- `IsValid`

   Checks if the texture index is not the invalid index (`-1`.)

- `SetInvalid`

   Sets the texture index to `-1`.

- `SetNull`

   Sets the texture index to `0`.

   The proper way to zero-initialize a `textureid` is:

   ```
   textureid tex;
   tex.SetNull();
   ```

### Vector2/Vector3

```
struct Vector2
{
   double x, y;

   double  Length() const;
   vector2 Unit() const;
}

struct Vector3
{
   double x, y, z;
   vector2 xy;

   double  Length() const;
   vector3 Unit() const;
}
```

- `Length`

   Returns the length (magnitude) of the vector.

- `Unit`

   Returns a normalized vector. Equivalent to `vec / vec.Length()`.

Base Objects
------------

### Object

The base class of all `class` types.

```
class Object
{
   bool bDESTROYED;

   class  GetClass();
   string GetClassName();
   class  GetParentClass();

   virtualscope void Destroy();

   virtual virtualscope void OnDestroy();
}
```

- `bDESTROYED`

   This object wants to be destroyed but has not yet been garbage collected.

- `GetClass`

   Returns the class type of this object.

- `GetClassName`

   Returns a string representation of the class type of this object.

- `GetParentClass`

   Returns the class type of this object's parent class.

- `Destroy`

   Destroys this object. Do not use the object after calling this. References to it will be invalidated.

- `OnDestroy`

   Called when the object is collected by the garbage collector. **Not deterministic.**

### Thinker

A class representing any object in the game that runs logic every game tick, i.e., "thinks." Most classes derive from `Thinker`, directly or indirectly.

All thinkers are grouped by their "stat" number, or "statnum," which specifies the ordering of which thinkers are run, first to last. There are 127 stat numbers total, 20 of which are not used by the engine and may be used for any purpose.

The user-defined stat numbers begin at `Thinker.STAT_USER` and end at `Thinker.STAT_USER_MAX`. Do not attempt to use normal integers as stat numbers except as relative to these two.

(Note to authors: These tables are not alphabetically organized as their ordering is meaningful.)

Thinkers which do not think and are elided from many checks:

| Name                         | Description                                              |
| ----                         | -----------                                              |
| `Thinker.STAT_INFO`          | Info queue (used by `SpecialSpot` and its descendants.)  |
| `Thinker.STAT_DECAL`         | Decals that cannot be deleted.                           |
| `Thinker.STAT_AUTODECAL`     | Decals that can be deleted (were not placed by the map.) |
| `Thinker.STAT_CORPSEPOINTER` | An entry in Hexen's corpse queue.                        |
| `Thinker.STAT_TRAVELLING`    | Any actor travelling between maps in a hub.              |
| `Thinker.STAT_STATIC`        | Thinkers persistent across maps.                         |

Thinkers which do think and are mandatory to many checks:

| Name                         | Description                                              |
| ----                         | -----------                                              |
| `Thinker.STAT_SCROLLER`      | Texture scrollers and carriers.                          |
| `Thinker.STAT_PLAYER`        | All `PlayerPawn` actors.                                 |
| `Thinker.STAT_BOSSTARGET`    | `BossBrain` targets.                                     |
| `Thinker.STAT_LIGHTNING`     | Lightning as used by Hexen.                              |
| `Thinker.STAT_DECALTHINKER`  | Decal animators.                                         |
| `Thinker.STAT_INVENTORY`     | All `Inventory` items.                                   |
| `Thinker.STAT_LIGHT`         | Sector lighting thinkers.                                |
| `Thinker.STAT_LIGHTTRANSFER` | Sector lighting transfer thinkers.                       |
| `Thinker.STAT_EARTHQUAKE`    | Quake effects.                                           |
| `Thinker.STAT_MAPMARKER`     | All `MapMarker` actors.                                  |
| `Thinker.STAT_DLIGHT`        | Dynamic lights.                                          |
| `Thinker.STAT_DEFAULT`       | Anything not in any other category. Most actors go here. |
| `Thinker.STAT_SECTOREFFECT`  | Sector effects that cause floor or ceiling movement.     |
| `Thinker.STAT_ACTORMOVER`    | All `ActorMover` actors.                                 |
| `Thinker.STAT_SCRIPTS`       | The ACS VM.                                              |
| `Thinker.STAT_BOT`           | All bot logic. This is not bound to their actor.         |

```
class Thinker play
{
   const TICRATE;

   virtual void ChangeStatNum(int stat);
   virtual void PostBeginPlay();
   virtual void Tick();

   static clearscope int Tics2Seconds(int tics);
}
```

- `TICRATE`

   The number of game ticks in a second. This value is always `int(35)`.

- `ChangeStatNum`

   Changes the statnum of this `Thinker`.

- `PostBeginPlay`

   Called at the very end of this Thinker's initialization.

- `Tick`

   Called every game tick. The order between this thinker's `Tick` and every other thinker in the same statnum is unspecified.

- `Tics2Seconds`

   Roughly converts a number of tics to an integral amount of seconds. Equivalent to `tics / TICRATE`.

### CVar

A **C**onsole **Var**iable, either defined in `CVARINFO` or by the engine. **Not serializable. Do not use as a member unless marked as `transient`.**

All Get and Set operations will work regardless of the real type of the CVar, as they aren't "strongly" typed.

```
struct CVar
{
   static CVar FindCVar(name n);
   static CVar GetCVar(name n, PlayerInfo player = null);

   bool   GetBool();
   double GetFloat();
   int    GetInt();
   string GetString();

   void SetBool(bool v);
   void SetFloat(double v);
   void SetInt(int v);
   void SetString(string v);

   int GetRealType();
   int ResetToDefault();
}
```

- `FindCVar`

   Returns a server CVar by name, or `null` if none is found.

- `GetCVar`

   Returns a user or server CVar by name, with `player` as the user if applicable, or `null` if none is found.

- `GetBool`

   Returns a boolean representing the value of the CVar, or `false` if it cannot be represented.

- `GetFloat`

   Returns a float representing the value of the CVar, or `0.0` if it cannot be represented.

- `GetInt`

   Returns an integer representing the value of the CVar, or `0` if it cannot be represented.

- `GetString`

   Returns a string representing the value of the CVar. CVars can always be represented as strings.

- `SetBool`
- `SetFloat`
- `SetInt`
- `SetString`

   Sets the representation of the CVar to `v`. May only be used on mod-defined CVars.

- `GetRealType`

   Returns the type of the CVar as it was defined, which may be one of the following:

   | Name               |
   | ----               |
   | `CVar.CVAR_Bool`   |
   | `CVar.CVAR_Color`  |
   | `CVar.CVAR_Float`  |
   | `CVar.CVAR_Int`    |
   | `CVar.CVAR_String` |

- `ResetToDefault`

   Resets the CVar to its default value and returns 0. The purpose of the return is unknown. May only be used on mod-defined CVars.

### GIFont

A font as defined in `MAPINFO`/GameInfo.

```
struct GIFont
{
   name Color;
   name FontName;
}
```

- `Color`

   The color of the font.

- `FontName`

   The name of the font.

### State

Represents a state on an `Actor` or `StateProvider`. Data in `State` is read-only and is copied as needed to its respective locations for modification, as it is merely a look into the global constant state table.

```
struct State
{
   readonly uint8 Frame;
   readonly State NextState;
   readonly int   Sprite;
   readonly int16 Tics;

   readonly int    Misc1;
   readonly int    Misc2;
   readonly uint16 TicRange;
   readonly uint8  UseFlags;

   readonly bool   bCANRAISE;
   readonly bool   bDEHACKED;
   readonly uint16 bFAST;
   readonly bool   bFULLBRIGHT;
   readonly bool   bNODELAY;
   readonly bool   bSAMEFRAME;
   readonly uint16 bSLOW;

   int DistanceTo(State other);
   bool ValidateSpriteFrame();

   textureid, bool, vector2 GetSpriteTexture(int rotation, int skin = 0, vector2 scale = (0, 0));
}
```

- `Frame`

   The sprite frame of this state.

- `NextState`

   A pointer to the next state in the global state table.

- `Sprite`

   The sprite ID of this state.

- `Tics`

   The number of game ticks this state lasts.

- `Misc1`

   TODO

- `Misc2`

   TODO

- `TicRange`

   TODO

- `UseFlags`

   TODO

- `bCANRAISE`

   State has the `CANRAISE` flag, allowing `A_VileChase` to target this actor for healing.

- `bDEHACKED`

   TODO

- `bFAST`

   TODO

- `bFULLBRIGHT`

   State has the `BRIGHT` flag, making it fully bright regardless of other lighting conditions.

- `bNODELAY`

   State has the `NODELAY` flag, forcing the associated action function to be run if the actor is in its first tic.

- `bSAMEFRAME`

   TODO

- `bSLOW`

   TODO

- `DistanceTo`

   TODO

- `ValidateSpriteFrame`

   TODO

- `GetSpriteTexture`

   TODO

### StringTable

The localized string table as defined by `LANGUAGE`.

```
struct StringTable
{
   static string Localize(string val, bool prefixed = true);
}
```

- `Localize`

   Returns the localized variant of `val`. If `prefixed` is `true`, the string is returned as-is unless it is prefixed with `$` where the `$` character itself is ignored. **Not deterministic** unless there is only one variant of `val`. This is generally fine because this should only be used for visual strings anyway.

Global Data
-----------

### DehInfo

Static DeHackEd information.

```
struct DehInfo
{
   readonly int    BFGCells;
   readonly int    BlueAC;
   readonly double ExplosionAlpha;
   readonly uint8  ExplosionStyle;
   readonly int    MaxSoulsphere;
   readonly int    NoAutofreeze;
}
```

- `BFGCells`

   The amount of ammunition `A_FireBFG` will deplete. Default is 40.

- `BlueAC`

   Multiple of 100 for `BlueArmor`'s `Armor.SaveAmount`. Default is 2 for 200 armor.

- `ExplosionAlpha`

   For actors with the `DEHEXPLOSION` flag, the alpha to set the actor to on explosion.

- `ExplosionStyle`

   For actors with the `DEHEXPLOSION` flag, the render style to be applied on explosion.

- `MaxSoulsphere`

   The `Inventory.MaxAmount` for `Soulsphere`. Default is 200.

- `NoAutofreeze`

   Overrides generic freezing deaths if not zero, making all actors act as if they had the `NOICEDEATH` flag.

### GameInfoStruct

```
struct GameInfoStruct
{
   double      Armor2Percent;
   string      ArmorIcon1;
   string      ArmorIcon2;
   name        BackpackType;
   int         GameType;
   double      GibFactor;
   array<name> InfoPages;
   bool        IntermissionCounter;
   bool        NoRandomPlayerClass;
   string      mBackButton;
   name        mSliderColor;
   GIFont      mStatScreenEnteringFont;
   GIFont      mStatScreenFinishedFont;
   GIFont      mStatScreenMapNameFont;
}
```

### LevelLocals

Most map-relative data is stored in this structure.

```
struct LevelLocals
{
   // Map data
   array<Line>   Lines;
   array<Sector> Sectors;
   array<Side>   Sides;

   internal array<SectorPortal> SectorPortals;
   readonly array<Vertex>       Vertexes;

   // Stats
   int Found_Items;
   int Found_Secrets;
   int Killed_Monsters;
   int Total_Items;
   int Total_Monsters;
   int Total_Secrets;

   // Time
   readonly int MapTime;
   readonly int ParTime;
   readonly int StartTime;
   readonly int SuckTime;
   readonly int Time;
   readonly int TotalTime;

   // Map sequencing
   readonly int    Cluster;
   readonly int    ClusterFlags;
   readonly string LevelName;
   readonly int    LevelNum;
   readonly string MapName;

   string NextMap;
   string NextSecretMap;

   readonly int MapType;

   // Music
   readonly string Music;
   readonly int    MusicOrder;

   // Sky
   readonly textureid SkyTexture1;
   readonly textureid SkyTexture2;

   float SkySpeed1;
   float SkySpeed2;

   // Physics
   play double AirControl
   play double AirFriction;
   play int    AirSupply;
   play double Gravity;

   // State
   bool AllMap;
   bool Frozen;

   // Static info
   string F1Pic;

   readonly bool   ActOwnSpecial;
   readonly bool   AllowRespawn;
   readonly bool   CheckSwitchRange;
   readonly int    FogDensity;
   readonly bool   Infinite_Flight;
   readonly bool   MissilesActivateImpact;
   readonly bool   MonsterFallingDamage;
   readonly bool   MonstersTelefrag;
   readonly bool   NoInventoryBar;
   readonly bool   NoMonsters;
   readonly bool   No_Dlg_Freeze;
   readonly int    OutsideFogDensity;
   readonly float  PixelStretch;
   readonly bool   PolyGrind;
   readonly int    SkyFog;
   readonly bool   SndSeqTotalCtrl;
   readonly double TeamDamage;

   double GetUDMFFloat(int type, int index, name key);
   int    GetUDMFInt(int type, int index, name key);
   string GetUDMFString(int type, int index, name key);

   bool ExecuteSpecial(int special, Actor activator, Line linedef, bool lineside, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0);

   void   ChangeSky(textureid sky1, textureid sky2);
   string FormatMapName(int mapnamecolor);
   string GetChecksum() const;
   void   SetInterMusic(string nextmap);
   string TimeFormatted(bool totals = false);

   bool IsCrouchingAllowed() const;
   bool IsFreelookAllowed() const;
   bool IsJumpingAllowed() const;

   static void GiveSecret(Actor activator, bool printmsg = true, bool playsound = true);
   static void RemoveAllBots(bool fromlist);
   static void StartSlideshow(name whichone = 'none');
   static void WorldDone();

   static clearscope vector3 SphericalCoords(vector3 viewpoint, vector3 targetPos, vector2 viewAngles = (0, 0), bool absolute = false);
   static clearscope vector2 Vec2Diff(vector2 v1, vector2 v2);
   static clearscope vector2 Vec2Offset(vector2 pos, vector2 dir, bool absolute = false);
   static clearscope vector3 Vec2OffsetZ(vector2 pos, vector2 dir, double atz, bool absolute = false);
   static clearscope vector3 Vec3Diff(vector3 v1, vector3 v2);
   static clearscope vector3 Vec3Offset(vector3 pos, vector3 dir, bool absolute = false);
}
```

TODO

Level Data
----------

### Vertex

```
struct Vertex play
{
   readonly vector2 P;
}
```

- `P`

   The point this object represents.

### Side

Also known as a "sidedef." One of the textured sides of a line. Each sidedef has three portions: Upper, middle, and lower. The middle texture is special as it can have translucency.

The three portions of a sidedef can be referred to with:

| Name          | Description         |
| ----          | -----------         |
| `Side.Top`    | The upper portion.  |
| `Side.Mid`    | The middle portion. |
| `Side.Bottom` | The lower portion.  |

```
struct Side play
{
   readonly Line   Linedef;
   readonly Sector Sector;

   uint8 Flags;
   int16 Light;

   int Index();

   clearscope Vertex V1();
   clearscope Vertex V2();

   textureid GetTexture(int which);
   double    GetTextureXOffset(int which);
   double    GetTextureYOffset(int which);
   double    GetTextureXScale(int which);
   double    GetTextureYScale(int which);

   void SetTexture(int which, textureid tex);
   void SetTextureXOffset(int which, double offset);
   void SetTextureYOffset(int which, double offset);
   void SetTextureXScale(int which, double scale);
   void SetTextureYScale(int which, double scale);

   void AddTextureXOffset(int which, double delta);
   void AddTextureYOffset(int which, double delta);

   void MultiplyTextureXScale(int which, double delta);
   void MultiplyTextureYScale(int which, double delta);

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

- `Linedef`

   The line this side belongs to.

- `Sector`

   The sector this side belongs to.

- `Flags`

   Any combination of the following bit flags:

   | Name                   | Description                                                                 |
   | ----                   | -----------                                                                 |
   | `WALLF_ABSLIGHTING`    | Light is absolute instead of relative to the sector.                        |
   | `WALLF_CLIP_MIDTEX`    | Clips the middle texture when it goes under the floor or above the ceiling. |
   | `WALLF_LIGHT_FOG`      | The wall's lighting will ignore fog effects.                                |
   | `WALLF_NOAUTODECALS`   | Don't attach decals to this surface.                                        |
   | `WALLF_NOFAKECONTRAST` | Disables the "fake contrast" effect for this side.                          |
   | `WALLF_POLYOBJ`        | This sidedef belongs to a polyobject.                                       |
   | `WALLF_SMOOTHLIGHTING` | Applies a unique contrast at all angles.                                    |
   | `WALLF_WRAP_MIDTEX`    | Repeats the middle texture infinitely on the vertical axis.                 |

- `Light`

   The light level of this side. Relative to the sector lighting unless `WALLF_ABSLIGHTING`.

- `Index`

   Returns the index of this side.

- `V1`, `V2`

   Returns the start and end points of this sidedef, respectively.

- `GetTexture`, `SetTexture`

   Gets or sets the texture of one portion of the sidedef.

- `GetTextureXOffset`, `SetTextureXOffset`, `AddTextureXOffset`

   Gets, sets or adds to the texture portion's horizontal offset.

- `GetTextureYOffset`, `SetTextureYOffset`, `AddTextureYOffset`

   Gets, sets or adds to the texture portion's vertical offset.

- `GetTextureXScale`, `SetTextureXScale`, `MultiplyTextureXScale`

   Gets, sets or multiplies the texture portion's horizontal scale.

- `GetTextureYScale`, `SetTextureYScale`, `MultiplyTextureYScale`

   Gets, sets or multiplies the texture portion's vertical scale.

- `GetUDMFFloat`, `GetUDMFInt`, `GetUDMFString`

   Gets a named UDMF property attached to this sidedef.

### Line

Also known as a "linedef." A line segment with two sides and two vertices.

```
struct Line play
{
   readonly Sector  BackSector, FrontSector;
   readonly double  BBox[4];
   readonly vector2 Delta;
   readonly Side    Sidedef[2];
   readonly Vertex  V1, V2;

   readonly uint PortalIndex;
   readonly uint PortalTransferred;

   double Alpha;
   uint   Flags;
   int    ValidCount;

   uint Activation;
   int  Args[5];
   int  LockNumber;
   int  Special;

   int Index();

   bool Activate(Actor activator, int side, int type);
   bool RemoteActivate(Actor activator, int side, int type, vector3 pos);

   Line GetPortalDestination();
   bool IsLinePortal();
   bool IsVisualPortal();

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

- `BackSector`, `FrontSector`

   The sector of the front and back sides of this line.

- `BBox`

   The top, bottom, left and right of the line, respective to array index.

- `Delta`

   Equivalent to `V2 - V1`.

- `V1`, `V2`

   Returns the start and end points of this line segment, respectively.

- `Sidedef`

   The front and back sides of this line, 0 and 1 respectively. The aliases `Line.Front` and `Line.Back` are provided as well.

- `PortalIndex`

   TODO

- `PortalTransferred`

   TODO

- `Alpha`

   Alpha of the middle texture on both sides.

- `Flags`

   Any combination of the following bit flags:

   | Name                     | Description                                                                       |
   | ----                     | -----------                                                                       |
   | `ML_3DMIDTEX_IMPASS`     | Middle texture will collide with projectiles and allow them to pass through.      |
   | `ML_3DMIDTEX`            | Middle texture can be collided with and walked on as if it were a thin sector.    |
   | `ML_ADDTRANS`            | Middle textures are drawn with additive translucency on both sides.               |
   | `ML_BLOCKEVERYTHING`     | Line blocks everything.                                                           |
   | `ML_BLOCKHITSCAN`        | Line blocks hit scan attacks.                                                     |
   | `ML_BLOCKING`            | Line is solid and blocks everything but projectiles and hit scan attacks.         |
   | `ML_BLOCKMONSTERS`       | Line blocks non-flying monsters.                                                  |
   | `ML_BLOCKPROJECTILE`     | Line blocks projectiles.                                                          |
   | `ML_BLOCKSIGHT`          | Line blocks line of sight.                                                        |
   | `ML_BLOCKUSE`            | Line blocks use actions.                                                          |
   | `ML_BLOCK_FLOATERS`      | Line blocks flying monsters.                                                      |
   | `ML_BLOCK_PLAYERS`       | Line blocks players.                                                              |
   | `ML_CHECKSWITCHRANGE`    | Checks the activator's vertical position as well as horizontal before activating. |
   | `ML_CLIP_MIDTEX`         | Applies `WALLF_CLIP_MIDTEX` to both sides.                                        |
   | `ML_DONTDRAW`            | Never shown on the auto-map.                                                      |
   | `ML_DONTPEGBOTTOM`       | Lower texture is unpegged on both sides.                                          |
   | `ML_DONTPEGTOP`          | Upper texture is unpegged on both sides.                                          |
   | `ML_FIRSTSIDEONLY`       | Special can only be activated from the front side.                                |
   | `ML_MAPPED`              | Always shown on the auto-map.                                                     |
   | `ML_MONSTERSCANACTIVATE` | Monsters may activate this line.                                                  |
   | `ML_RAILING`             | Line is a railing that can be jumped over.                                        |
   | `ML_REPEAT_SPECIAL`      | Special may be activated multiple times.                                          |
   | `ML_SECRET`              | Line will be shown as one-sided on the auto-map.                                  |
   | `ML_SOUNDBLOCK`          | Blocks sound propagation after two lines with this flag.                          |
   | `ML_TWOSIDED`            | Line has a back side.                                                             |
   | `ML_WRAP_MIDTEX`         | Applies `WALLF_WRAP_MIDTEX` to both sides.                                        |
   | `ML_ZONEBOUNDARY`        | Reverb zone boundary.                                                             |

- `ValidCount`

   Don't use this.

- `Activation`

   TODO

- `Args`

   Arguments of the line's special action.

- `LockNumber`

   TODO

- `Special`

   Number of the special action to be executed when this line is activated.

- `Index`

   Returns the index of this line.

- `Activate`

   TODO

- `RemoteActivate`

   TODO

- `GetPortalDestination`

   TODO

- `IsLinePortal`

   TODO

- `IsVisualPortal`

   TODO

- `GetUDMFFloat`, `GetUDMFInt`, `GetUDMFString`

   Gets a named UDMF property attached to this linedef.

### Sector

TODO

```
struct Sector play
{
   readonly FColormap ColorMap;
   readonly color     SpecialColors[5];

   Actor SoundTarget;

   int16 Special;
   int16 LightLevel;
   int16 SeqType;

   int  Sky;
   name SeqName;

   readonly vector2 CenterSpot;

   int   ValidCount;
   Actor ThingList;

   double Friction, MoveFactor;
   int TerrainNum[2];

   SectorEffect FloorData;
   SectorEffect CeilingData;
   SectorEffect LightingData;

   uint8 SoundTraversed;
   int8  StairLock;
   int   PrevSec;
   int   NextSec;

   readonly array<Line> Lines;

   readonly SecPlane FloorPlane;
   readonly SecPlane CeilingPlane;

   readonly Sector HeightSec;

   uint BottomMap, MidMap, TopMap;

   double Gravity;
   name   DamageType;
   int    DamageAmount;
   int16  DamageInterval;
   int16  LeakyDamage;

   readonly uint16 ZoneNumber;

   uint   Flags;
   uint16 MoreFlags;

   SectorAction SecActTarget;

   internal uint Portals[2];
   readonly int  PortalGroup;

   readonly int SectorNum;

   int Index();

   double, Sector, F3DFloor NextHighestCeilingAt(double x, double y, double bottomz, double topz, int flags = 0);
   double, Sector, F3DFloor NextLowestFloorAt(double x, double y, double z, int flags = 0, double steph = 0);

   void RemoveForceField();

   static Sector PointInSector(vector2 pt);

   bool   PlaneMoving(int pos);
   int    GetFloorLight();
   int    GetCeilingLight();
   Sector GetHeightSec();
   void   TransferSpecial(Sector model);
   void   GetSpecial(out SecSpecial spec);
   void   SetSpecial(SecSpecial spec);
   int    GetTerrain(int pos);
   void   CheckPortalPlane(int plane);

   double, Sector HighestCeilingAt(vector2 a);
   double, Sector LowestFloorAt(vector2 a);
   double, double GetFriction(int plane);

   void   SetXOffset(int pos, double o);
   void   AddXOffset(int pos, double o);
   double GetXOffset(int pos);
   void   SetYOffset(int pos, double o);
   void   AddYOffset(int pos, double o);
   double GetYOffset(int pos, bool addbase = true);
   void   SetXScale(int pos, double o);
   double GetXScale(int pos);
   void   SetYScale(int pos, double o);
   double GetYScale(int pos);
   void   SetAngle(int pos, double o);
   double GetAngle(int pos, bool addbase = true);
   void   SetBase(int pos, double y, double o);
   void   SetAlpha(int pos, double o);
   double GetAlpha(int pos);
   int    GetFlags(int pos);
   int    GetVisFlags(int pos);
   void   ChangeFlags(int pos, int and, int or);
   int    GetPlaneLight(int pos);
   void   SetPlaneLight(int pos, int level);
   void   SetColor(color c, int desat = 0);
   void   SetFade(color c);
   void   SetFogDensity(int dens);
   double GetGlowHeight(int pos);
   color  GetGlowColor(int pos);
   void   SetGlowHeight(int pos, double height);
   void   SetGlowColor(int pos, color color);
   void   SetSpecialColor(int pos, color color);

   textureid GetTexture(int pos);
   void      SetTexture(int pos, textureid tex, bool floorclip = true);
   double    GetPlaneTexZ(int pos);
   void      SetPlaneTexZ(int pos, double val, bool dirtify = false);
   void      ChangeLightLevel(int newval);
   void      SetLightLevel(int newval);
   int       GetLightLevel();
   void      AdjustFloorClip();
   bool      IsLinked(Sector other, bool ceiling);

   bool    PortalBlocksView(int plane);
   bool    PortalBlocksSight(int plane);
   bool    PortalBlocksMovement(int plane);
   bool    PortalBlocksSound(int plane);
   bool    PortalIsLinked(int plane);
   void    ClearPortal(int plane);
   double  GetPortalPlaneZ(int plane);
   vector2 GetPortalDisplacement(int plane);
   int     GetPortalType(int plane);
   int     GetOppositePortalGroup(int plane);
   double  CenterFloor();
   double  CenterCeiling();
   bool    TriggerSectorActions(Actor thing, int activation);

   int MoveFloor(double speed, double dest, int crush, int direction, bool hexencrush, bool instant = false);
   int MoveCeiling(double speed, double dest, int crush, int direction, bool hexencrush);

   Sector NextSpecialSector(int type, Sector prev);

   double, Vertex FindLowestFloorSurrounding();
   double, Vertex FindHighestFloorSurrounding();
   double, Vertex FindNextHighestFloor();
   double, Vertex FindNextLowestFloor();
   double, Vertex FindLowestCeilingSurrounding();
   double, Vertex FindHighestCeilingSurrounding();
   double, Vertex FindNextLowestCeiling();
   double, Vertex FindNextHighestCeiling();

   double FindShortestTextureAround();
   double FindShortestUpperAround();
   Sector FindModelFloorSector(double floordestheight);
   Sector FindModelCeilingSector(double floordestheight);
   int    FindMinSurroundingLight(int max);

   double, Vertex FindLowestCeilingPoint();
   double, Vertex FindHighestFloorPoint();

   void SetEnvironment(string env);
   void SetEnvironmentID(int envnum);

   SeqNode StartSoundSequenceID(int chan, int sequence, int type, int modenum, bool nostop = false);
   SeqNode StartSoundSequence(int chan, name seqname, int modenum);
   SeqNode CheckSoundSequence(int chan);
   void StopSoundSequence(int chan);
   bool IsMakingLoopingSound();

   bool IsSecret();
   bool WasSecret();
   void ClearSecret();

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

TODO

### SectorPortal

TODO

### SectorEffect

A thinker which is attached to a sector and effects it in some way.

```
class SectorEffect : Thinker
{
   protected Sector m_Sector;

   Sector GetSector();
}
```

- `m_Sector`

   The sector this effect is attached to.

- `GetSector`

   Returns the sector this effect is attached to.

### SectorAction

TODO

### SecSpecial

TODO

### SecPlane

TODO

```
struct SecPlane play
{
   double  D;
   double  NegiC;
   vector3 Normal;

   void   ChangeHeight(double hdiff);
   double GetChangedHeight(double hdiff) const;
   double HeightDiff(double oldd, double newd = 0.0) const;
   bool   IsEqual(SecPlane other) const;
   bool   IsSlope() const;
   int    PointOnSide(vector3 pos) const;
   double PointToDist(vector2 xy, double z) const;
   double ZAtPointDist(vector2 v, double dist) const;

   clearscope double ZAtPoint(vector2 v) const;
}
```

- `D`

   TODO

- `NegiC`

   TODO

- `Normal`

   TODO

- `ChangeHeight`

   TODO

- `GetChangedHeight`

   TODO

- `HeightDiff`

   TODO

- `IsEqual`

   TODO

- `IsSlope`

   TODO

- `PointOnSide`

   TODO

- `PointToDist`

   TODO

- `ZAtPointDist`

   TODO

- `ZAtPoint`

   TODO

### F3DFloor

Currently empty. Does not expose any information.

### FColorMap

Describes the coloring of a sector.

```
struct FColorMap
{
   uint8 BlendFactor;
   uint8 Desaturation;
   color FadeColor;
   color LightColor;
}
```

- `BlendFactor`

   TODO: "This is for handling Legacy-style color maps which use a different formula to calculate how the color affects lighting."

- `Desaturation`

   How much to desaturate colors in this sector. Range is 0 to 255, inclusive.

- `FadeColor`

   The color of fog in this sector. None if all components are 0.

- `LightColor`

   The color of the sector. Default if all components are 0.

### SectorTagIterator

TODO

### LineIdIterator

Iterates over line indices with a specified tag.

```
class LineIdIterator
{
   static LineIdIterator Create(int tag);

   int Next();
}
```

- `Create`

   Creates a new iterator over lines with tag `tag`.

- `Next`

   Returns the index of the current line and advances the iterator. Returns -1 when the list is exhausted.

Players
-------

### PlayerInfo

TODO

### PlayerClass

A player class as defined in either `MAPINFO`/GameInfo or `KEYCONF`.

```
struct PlayerClass
{
   uint         Flags;
   array<int>   Skins;
   class<Actor> Type;

   bool CheckSkin(int skin);
   void EnumColorsets(out array<int> data);
   name GetColorsetName(int setnum);
}
```

- `Flags`

   Not currently implemented correctly, `PCF_NOMENU` does not exist in ZScript, but its value is `1` if you need to check for that.

- `Skins`

   Skin indices available to this player class.

- `Type`

   The class type reference for this player class.

- `CheckSkin`

   Checks if `skin` is in `Skins`.

- `EnumColorsets`

   TODO

- `GetColorsetName`

   TODO

### PlayerSkin

A player skin as defined in `SKININFO` or `S_SKIN`.

```
struct PlayerSkin
{
   int     CrouchSprite;
   string  Face;
   uint8   Gender;
   int     NameSpc;
   bool    OtherGame;
   uint8   Range0End;
   uint8   Range0Start;
   vector2 Scale;
   string  SkinName;
   int     Sprite;
}
```

- `CrouchSprite`

   The crouching sprite ID for this skin.

- `Face`

   Prefix for statusbar face graphics.

- `Gender`

   Default gender of the skin. May be one of the following:

   | Name             | Value | Description                 |
   | ----             | :---: | -----------                 |
   | `GENDER_FEMALE`  | `1`   | Feminine.                   |
   | `GENDER_MALE`    | `0`   | Masculine.                  |
   | `GENDER_NEUTRAL` | `2`   | Neutral.                    |
   | `GENDER_OTHER`   | `3`   | Other (robot, zombie, etc.) |

- `NameSpc`

   If this skin was defined in S_SKIN, this is the lump ID of the marker itself.

- `OtherGame`

   The player skin is made for another game and needs to be color remapped differently.

- `Range0End`

   The end index of the translation range to be used for changing the player sprite's color.

- `Range0Start`

   The beginning index of the translation range to be used for changing the player sprite's color.

- `Scale`

   The scaling factor used for the player sprite.

- `SkinName`

   Name of the skin.

- `Sprite`

   The sprite ID for this skin.

### Team

A team as defined in `TEAMINFO`.

```
struct Team
{
   const Max;
   const NoTeam;

   string mName;
}
```

- `Max`

   The maximum number of teams.

- `NoTeam`

   A constant index for a player with no team.

- `mName`

   The name of the team.

Weapons
-------

### PSprite

A **P**layer **Sprite**, paradoxically, is not the player themself, but the sprite *within their view*, such as their weapon. PSprites are arbitrarily layered by number, somewhat similar to HUDMessages. They are drawn ordered from lowest to highest.

The predefined layers are:

| Name                   | Value         | Description                                                                        |
| ----                   | :---:         | -----------                                                                        |
| `PSprite.Flash`        | `1000`        | The layer used by `A_GunFlash` for gun flashes.                                    |
| `PSprite.StrifeHands`  | `-1`          | The hands brought up by `A_ItBurnsItBurns` when the player in Strife dies of fire. |
| `PSprite.TargetCenter` | `int.Max - 2` | The middle of the targeting system view in Strife.                                 |
| `PSprite.TargetLeft`   | `int.Max - 1` | The left side of the targeting system view in Strife.                              |
| `PSprite.TargetRight`  | `int.Max`     | The right side of the targeting system view in Strife.                             |
| `PSprite.Weapon`       | `1`           | The default layer for all weapons.                                                 |

```
class PSprite play
{
   readonly State      CurState;
   readonly int        ID;
   readonly PSprite    Next;
   readonly PlayerInfo Owner;

   double   Alpha;
   Actor    Caller;
   bool     FirstTic;
   int      Frame;
   double   OldX;
   double   OldY;
   bool     ProcessPending;
   spriteid Sprite;
   int      Tics;
   double   X;
   double   Y;

   bool bADDBOB;
   bool bADDWEAPON;
   bool bCVARFAST;
   bool bFLIP;
   bool bPOWDOUBLE;

   void SetState(State newstate, bool pending = false);
   void Tick();
}
```

- `CurState`

   TODO

- `ID`

   TODO

- `Next`

   TODO

- `Owner`

   TODO

- `Alpha`

   The amount of translucency of the PSprite, range 0-1 inclusive.

- `Caller`

   TODO

- `FirstTic`

   TODO

- `Frame`

   Frame number of the sprite.

- `OldX`

   TODO

- `OldY`

   TODO

- `ProcessPending`

   TODO

- `Sprite`

   The sprite to display on this layer.

- `Tics`

   The number of game ticks before the next state takes over.

- `X`

   The offset from the weapon's normal resting position on the horizontal axis.

- `Y`

   The offset from the weapon's normal resting position on the vertical axis. Note that `32` is the real resting position because of `A_Raise`.

- `bADDBOB`

   Adds the weapon's bobbing to this layer's offset.

- `bADDWEAPON`

   Adds the weapon layer's offsets to this layer's offset.

- `bCVARFAST`

   Layer will respect `sv_fastweapons`.

- `bFLIP`

   Flips the weapon visually horizontally.

- `bPOWDOUBLE`

   Layer will respect `PowerDoubleFiringSpeed`.

- `SetState`

   TODO

- `Tick`

   Called by `PlayerPawn::TickPSprites` to advance the frame.

### Weapon

TODO

Drawing
-------

### BrokenLines

A container representing an array of lines of text that have been broken up to fit the screen and clipping region.

```
class BrokenLines
{
   int    Count();
   string StringAt(int line);
   int    StringWidth(int line);
}
```

- `Count`

   Returns the amount of lines in this container.

- `StringAt`

   Returns the text of line `line`.

- `StringWidth`

   Returns the width (in pixels) of line `line`.

### Console

Basic access to console functionality.

```
struct Console
{
   static void HideConsole();
   static void MidPrint(Font font, string text, bool bold = false);
   static vararg void Printf(string fmt, ...);
}
```

- `HideConsole`

   Hides the console if it is open and `gamestate` is not `GS_FULLCONSOLE`.

- `MidPrint`

   Prints `text` (possibly a `LANGUAGE` string if prefixed with `$`) in `font` to the middle of the screen for 1½ seconds. Will print even if the player is a spectator if `bold` is `true`. Uses the `msgmidcolor` CVar for non-bold messages and `msgmidcolor2` for bold messages.

- `Printf`

   Prints a formatted string to the console.

### Font

A font as defined in `FONTDEFS` or a bitmap font file. **Not serializable. Do not use as a member unless marked as `transient`.**

```
struct Font
{
   static Font FindFont(name fontname);
   static int  FindFontColor(name color);
   static Font GetFont(name fontname);

   int    GetCharWidth(int code);
   string GetCursor();
   int    GetHeight();
   int    StringWidth(string code);

   BrokenLines BreakLines(string text, int maxlen);
}
```

- `FindFont`

   Gets a font as defined in `FONTDEFS`.

- `FindFontColor`

   Returns the color range enumeration for a named color.

- `GetFont`

   Gets a font either as defined in `FONTDEFS` or a ZDoom/bitmap font.

- `GetCharWidth`

   Returns the width in pixels of a character code.

- `GetCursor`

   Returns the string used as a blinking cursor graphic for this font.

- `GetHeight`

   Returns the line height of the font.

- `StringWidth`

   Returns the width in pixels of the string.

- `BreakLines`

   Breaks `text` up into a `BrokenLines` structure according to the screen and clip region, as well as appropriately accounting for a maximum width in pixels of `maxlen`.

### Shape2D

Represents an arbitrary polygonal 2D shape.

```
class Shape2D
{
   void Clear(int which = C_Verts | C_Coords | C_Indices);
   void PushCoord(vector2 c);
   void PushTriangle(int a, int b, int c);
   void PushVertex(vector2 v);
}
```

- `Clear`

   Clears data out of a shape. Uses these as a bit flag:

   | Name                | Description                 |
   | ----                | -----------                 |
   | `Shape2D.C_Coords`  | Clears texture coordinates. |
   | `Shape2D.C_Indices` | Clears vertex indices.      |
   | `Shape2D.C_Verts`   | Clears vertices.            |

- `PushCoord`

   Pushes a texture coordinate into the shape buffer.

- `PushTriangle`

   Pushes the indices of a triangle into the shape buffer.

- `PushVertex`

   Pushes a vertex into the shape buffer.

### Screen

Functions for drawing various things to the screen.

Note: There are no longer any fully paletted renderers in GZDoom as of version 3.5. Alternate palette index parameters are generally ignored now.

```
struct Screen
{
   static vararg void DrawChar(Font font, int normalcolor, double x, double y, int character, ...);
   static vararg void DrawShape(textureid tex, bool animate, Shape2D s, ...);
   static vararg void DrawText(Font font, int normalcolor, double x, double y, string text, ...);
   static vararg void DrawTexture(textureid tex, bool animate, double x, double y, ...);

   static void Clear(int left, int top, int right, int bottom, color cr, int palcolor = -1);
   static void Dim(color cr, double amount, int x, int y, int w, int h);
   static void DrawFrame(int x, int y, int w, int h);
   static void DrawLine(int x0, int y0, int x1, int y1, color cr);
   static void DrawThickLine(int x0, int y0, int x1, int y1, double thickness, color cr);

   static double GetAspectRatio();
   static int GetHeight();
   static int GetWidth();
   static color PaletteColor(int index);
   static vector2, vector2 VirtualToRealCoords(vector2 pos, vector2 size, vector2 vsize, bool vbottom = false, bool handleaspect = true);

   static void ClearClipRect();
   static int, int, int, int GetClipRect();
   static int, int, int, int GetViewWindow();
   static void SetClipRect(int x, int y, int w, int h);
}
```

- `DrawChar`

   TODO

- `DrawShape`

   TODO

- `DrawText`

   TODO

- `DrawTexture`

   TODO

- `Clear`

   Draws a rectangle from `top left` to `bottom right` in screen coordinates of `cr` color. Does not support translucent colors. `palcolor` is a palette index to use as a color in paletted renderers or `-1` for automatic conversion from the given RGB color.

- `Dim`

   Draws a rectangle at `x y` of `w h` size in screen coordinates of `cr` color. Does not support translucent colors, but `amount` may be used to specify the translucency in a range of 0-1 inclusive.

- `DrawFrame`

   Draws a frame around a rectangle at `x y` of `w h` size in screen coordinates, using the border graphics as defined in `MAPINFO`/GameInfo.

- `DrawLine`

   Draws a one pixel wide line from `x0 y0` to `x1 y1` in screen coordinates of color `cr`. Does not support translucent colors.

- `DrawThickLine`

   Draws a `thickness` pixel wide line from `x0 y0` to `x1 y1` in screen coordinates of color `cr`. Supports translucent colors.

- `GetAspectRatio`

   Returns the aspect ratio of the screen.

- `GetHeight`

   Returns the height of the screen.

- `GetWidth`

   Returns the width of the screen.

- `PaletteColor`

   Returns a `color` for a given palette index.

- `VirtualToRealCoords`

   TODO

- `ClearClipRect`

   Clears the clipping rectangle if there is one.

- `GetClipRect`

   Returns the clipping rectangle's `x`/`y`/`w`/`h`.

- `GetViewWindow`

   Returns the 3D viewing window, which may be smaller than the screen size with any given `screenblocks` setting.

- `SetClipRect`

   Sets the clipping rectangle to restrict further drawing to the region starting at `x y` of size `w h` in screen coordinates.

### TexMan

The **Tex**ture **Man**ager is used for loading, finding, replacing and getting information on textures.

```
struct TexMan
{
   static textureid CheckForTexture(string name, int usetype, int flags = TexMan.TryAny);
   static int       CheckRealHeight(textureid tex);
   static string    GetName(textureid tex);
   static vector2   GetScaledOffset(textureid tex);
   static vector2   GetScaledSize(textureid tex);
   static int, int  GetSize(textureid tex);
   static void      ReplaceTextures(string from, string to, int flags);
   static void      SetCameraToTexture(Actor viewpoint, string texture, double fov);
}
```

- `CheckForTexture`

   Returns a `textureid` for the texture named `name`. `usetype` may be one of the following, which selects what kind of texture to find:

   | Name                       | Description                                                   |
   | ----                       | -----------                                                   |
   | `TexMan.Type_Any`          | Returns any kind of texture.                                  |
   | `TexMan.Type_Autopage`     | Returns an auto-map background graphic. (TODO: needs example) |
   | `TexMan.Type_Build`        | Returns a tile from a BUILD TILES entry.                      |
   | `TexMan.Type_Decal`        | Unknown. (TODO)                                               |
   | `TexMan.Type_FirstDefined` | Unknown. (TODO)                                               |
   | `TexMan.Type_Flat`         | Returns any flat, i.e. `FLOOR0_1`.                            |
   | `TexMan.Type_FontChar`     | Unknown. (TODO)                                               |
   | `TexMan.Type_MiscPatch`    | Unknown. (TODO)                                               |
   | `TexMan.Type_Null`         | Returns the null graphic. Ignores `name`.                     |
   | `TexMan.Type_Override`     | Unknown. (TODO)                                               |
   | `TexMan.Type_SkinGraphic`  | Unknown. (TODO)                                               |
   | `TexMan.Type_SkinSprite`   | Unknown. (TODO)                                               |
   | `TexMan.Type_Sprite`       | Returns a sprite, i.e. `MEDIA0`.                              |
   | `TexMan.Type_WallPatch`    | Returns an uncomposited patch, i.e. `DOOR2_1`.                |
   | `TexMan.Type_Wall`         | Returns any composited wall texture, i.e. `STARTAN2`.         |

   `flags` may be any of the following combined (with the bitwise OR operator `|`:)

   | Name                   | Description                                     |
   | ----                   | -----------                                     |
   | `TexMan.AllowSkins`    | Unknown. (TODO)                                 |
   | `TexMan.DontCreate`    | Will never create a new texture when searching. |
   | `TexMan.Overridable`   | Unknown. (TODO)                                 |
   | `TexMan.ReturnFirst`   | Unknown. (TODO)                                 |
   | `TexMan.ShortNameOnly` | Will force use of a short name when searching.  |
   | `TexMan.TryAny`        | Default. Unknown. (TODO)                        |

- `CheckRealHeight`

   TODO

- `GetName`

   Returns the original name of a `textureid`.

- `GetScaledOffset`

   TODO

- `GetScaledSize`

   TODO

- `GetSize`

   Returns the width and height of a `textureid`.

- `ReplaceTextures`

   Replaces textures named `from` with `to` within the map. `flags` may be used to filter out certain textures from being replaced:

   | Name                 | Description                          |
   | ----                 | -----------                          |
   | `TexMan.NOT_BOTTOM`  | Filters out linedef bottom textures. |
   | `TexMan.NOT_CEILING` | Filters out ceiling flats.           |
   | `TexMan.NOT_FLAT`    | Filters out any flat texture.        |
   | `TexMan.NOT_FLOOR`   | Filters out floor flats.             |
   | `TexMan.NOT_MIDDLE`  | Filters out linedef middle textures. |
   | `TexMan.NOT_TOP`     | Filters out linedef upper textures.  |
   | `TexMan.NOT_WALL`    | Filters out any linedef texture.     |

- `SetCameraToTexture`

   Sets the camera texture (as defined in `ANIMDEFS`) `texture` to the viewpoint of `viewpoint` with a fov of `fov`.

Sounds
------

### SeqNode

A sound sequence (`SNDSEQ`) node.

```
class SeqNode
{
   static name GetSequenceSlot(int sequence, int type);
   static void MarkPrecacheSounds(int sequence, int type);

   void AddChoice(int seqnum, int type);
   bool AreModesSame(name n, int mode1);
   bool AreModesSameID(int sequence, int type, int mode1);
   name GetSequenceName();
}
```

- `GetSequenceSlot`

   TODO

- `MarkPrecacheSounds`

   TODO

- `AddChoice`

   TODO

- `AreModesSame`

   TODO

- `AreModesSameID`

   TODO

- `GetSequenceName`

   TODO

Glossary
========

Examples
--------

### Examples: Class headers

Various class headers:

```
class MyCoolObject // automatically inherits Object
class MyCoolScopedObject play // has Play scope
class MyCoolThinker : Thinker // inherits Thinker
class MyCoolActor : Actor replaces OtherActor
class MyCoolInterface abstract // can only be inherited
```

### Examples: Class definitions

Basic class definition with a member variable and member function:

```
class BasicClass
{
   int m_thing;

   void changeThing()
   {
      m_thing = 500;
   }
}
```

Alternate syntax usage:

```
class TheWholeFileIsAClassOhNo;

int m_mymember;

// end of file
```

### Examples: Property definitions

A class with some properties:

```
class MyCoolActor : Actor
{
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   int m_myCoolMember;
   int m_coolMember1, m_coolMember2;

   property MyCoolMember: m_myCoolMember;
   property MyCoolMemberList: m_coolMember1, m_coolMember2;
}
```

### Examples: Structure definitions

Simple structure:

```
struct MyCoolStructure
{
   int x;
   int y;
   int z;
}
```

### Examples: Enumeration definitions

Basic enumeration:

```
enum MyCoolEnum
{
   A, // has value int(0)
   B, // 1 ...
   C, // 2 ...
   D  // and 3
}
```

Less trivial example:

```
enum MyCoolerEnum : int16
{
   A = 500, // has value int16(500)
   B, // 501
   C = 200,
   D, // 201
   E, // 202
};
```

### Examples: Constant definitions

Making an integer constant from a double:

```
const MyCoolInt = int(777.7777);
```

### Examples: Include directives

Basic includes:

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

### Examples: Expression statements

Some basic expressions:

```
myCoolFunction(5, 4);
m_myCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

### Examples: Conditional statements

Simple conditional:

```
if(a)
   b();
```

Simple conditional, with else statement and a block:

```
if(a)
{
   b();
   c = d;
}
else
   e = f;
```

### Examples: Switch statements

A switch demonstrating fall-through and default cases:

```
switch(a)
{
case 500: Console.Printf("a is 500"); break;
case 501: Console.Printf("a is 501"); // falls through to next case
case 502: Console.Printf("a is 501 or 502"); break;
default:
   Console.Printf("not sure what a is!");
   // break is implied here
}
```

### Examples: Control flow statements

Use of `continue`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) continue; // don't do anything on 25!

   doThing(i);
}
```

Use of `break`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   doThing(i);
}
```

Use of `return` in various contexts:

```
void returnsNothing()
{
   if(m_thing != 50) return; // exit early if m_thing isn't 50.

   doThing(m_thing);
}

int returnsInt()
{
   if(m_thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int returnsTwoInts()
{
   return 1, 2; // returns 1 and 2.
}
```

### Examples: Multi-assignment statements

Getting the actor out of `A_SpawnItemEx`:

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

### Examples: Member declarations

Some basic member variables:

```
int m_myCoolInt;
int m_coolInt1, m_coolInt2, m_coolInt3;
int[10] m_coolIntArray;
private int m_coolPrivateInt;
protected meta int m_coolMetaInt;
```

Class Tree
----------

Here is a full tree of all classes in ZScript as of GZDoom 3.6.0. There are 1448 classes total.

```
Object
├ ActorIterator
├ BaseStatusBar
│ ├ DoomStatusBar
│ │ └ HarmonyStatusBar
│ ├ HereticStatusBar
│ ├ HexenStatusBar
│ ├ SBarInfoWrapper
│ └ StrifeStatusBar
├ BlockLinesIterator
├ BlockThingsIterator
├ Bot
├ BrokenLines
├ DynamicValueInterpolator
├ HUDFont
├ HUDMessageBase
├ InterBackground
├ InventoryBarState
├ LevelCompatibility
├ LinearValueInterpolator
├ LineIdIterator
├ LineTracer
├ Menu
│ ├ ConversationMenu
│ ├ EnterKey
│ ├ GenericMenu
│ │ └ ReadThisMenu
│ ├ ListMenu
│ │ ├ LoadSaveMenu
│ │ │ ├ LoadMenu
│ │ │ └ SaveMenu
│ │ └ PlayerMenu
│ ├ MessageBoxMenu
│ ├ OptionMenu
│ │ ├ ColorpickerMenu
│ │ ├ CompatibilityMenu
│ │ ├ GameplayMenu
│ │ ├ GLTextureGLOptions
│ │ ├ JoystickConfigMenu
│ │ ├ ReverbEdit
│ │ ├ ReverbSave
│ │ ├ ReverbSelect
│ │ └ VideoModeMenu
│ └ TextEnterMenu
├ MenuDescriptor
│ ├ ListMenuDescriptor
│ └ OptionMenuDescriptor
├ MenuItemBase
│ ├ ListMenuItem
│ │ ├ ListMenuItemPlayerDisplay
│ │ ├ ListMenuItemSelectable
│ │ │ ├ ListMenuItemPatchItem
│ │ │ ├ ListMenuItemPlayerNameBox
│ │ │ ├ ListMenuItemSlider
│ │ │ ├ ListMenuItemTextItem
│ │ │ └ ListMenuItemValueText
│ │ ├ ListMenuItemStaticPatch
│ │ │ └ ListMenuItemStaticPatchCentered
│ │ └ ListMenuItemStaticText
│ │   └ ListMenuItemStaticTextCentered
│ └ OptionMenuItem
│   ├ OptionMenuFieldBase
│   │ ├ OptionMenuItemNumberField
│   │ └ OptionMenuItemTextField
│   ├ OptionMenuItemColorPicker
│   ├ OptionMenuItemControlBase
│   │ ├ OptionMenuItemControl
│   │ └ OptionMenuItemMapControl
│   ├ OptionMenuItemOptionBase
│   │ ├ OptionMenuItemInverter
│   │ ├ OptionMenuItemJoyMap
│   │ ├ OptionMenuItemOption
│   │ ├ OptionMenuItemReverbOption
│   │ └ OptionMenuItemReverbSaveSelect
│   ├ OptionMenuItemScreenResolution
│   ├ OptionMenuItemStaticText
│   ├ OptionMenuItemStaticTextSwitchable
│   ├ OptionMenuItemSubMenu
│   │ ├ OptionMenuItemCommand
│   │ │ └ OptionMenuItemSafeCommand
│   │ ├ OptionMenuItemJoyConfigMenu
│   │ ├ OptionMenuItemLabeledSubmenu
│   │ └ OptionMenuItemReverbSelect
│   └ OptionMenuSliderBase
│     ├ OptionMenuItemSlider
│     │ └ OptionMenuItemScaleSlider
│     ├ OptionMenuItemSliderReverbEditOption
│     ├ OptionMenuSliderJoyDeadZone
│     ├ OptionMenuSliderJoyScale
│     ├ OptionMenuSliderJoySensitivity
│     └ OptionMenuSliderVar
├ PointLightFlickerRandomAdditive
├ PointLightFlickerRandomAttenuated
├ PSprite
├ SectorTagIterator
├ SeqNode
├ Shape2D
├ SpotState
├ StaticEventHandler
│ └ EventHandler
├ StatusScreen
│ ├ CoopStatusScreen
│ ├ DeathmatchStatusScreen
│ └ DoomStatusScreen
│   └ RavenStatusScreen
├ Thinker
│ ├ Actor
│ │ ├ AlienAspClimber
│ │ ├ AlienBubbleColumn
│ │ ├ AlienCeilingBubble
│ │ ├ AlienChunkLarge
│ │ ├ AlienChunkSmall
│ │ ├ AlienFloorBubble
│ │ ├ AlienSpiderLight
│ │ ├ AmbientSound
│ │ │ └ AmbientSoundNoGravity
│ │ ├ AmmoFiller
│ │ ├ Anvil
│ │ ├ Arachnotron
│ │ │ └ StealthArachnotron
│ │ ├ ArachnotronPlasma
│ │ ├ Archvile
│ │ │ └ StealthArchvile
│ │ ├ ArchvileFire
│ │ ├ Arrow
│ │ ├ AxeBlood
│ │ ├ AxePuff
│ │ │ └ AxePuffGlow
│ │ ├ Bang4Cloud
│ │ ├ BaronBall
│ │ ├ BaronOfHell
│ │ │ ├ Flembrane
│ │ │ ├ HellKnight
│ │ │ │ └ StealthHellKnight
│ │ │ └ StealthBaron
│ │ ├ BarricadeColumn
│ │ ├ Bat
│ │ ├ Beast
│ │ ├ BeastBall
│ │ ├ BFGBall
│ │ │ └ LAZBall
│ │ ├ BFGExtra
│ │ ├ BigTree
│ │ │ └ ChexBananaTree
│ │ ├ BigTree2
│ │ ├ Bishop
│ │ ├ BishopBlur
│ │ ├ BishopFX
│ │ ├ BishopMissile
│ │ ├ BishopPainBlur
│ │ ├ BishopPuff
│ │ ├ BlastEffect
│ │ ├ BlasterPuff
│ │ ├ BlasterSmoke
│ │ ├ Blood
│ │ ├ BloodPool
│ │ ├ BloodscourgeDrop
│ │ ├ BloodSplash
│ │ ├ BloodSplashBase
│ │ ├ BloodSplatter
│ │ ├ BloodyTwitch
│ │ │ └ NonsolidTwitch
│ │ ├ BlueTorch
│ │ │ └ ChexSlimeFountain
│ │ ├ BossBrain
│ │ ├ BossEye
│ │ ├ BrainStem
│ │ ├ BrassTorch
│ │ ├ BridgeBall
│ │ ├ BulletPuff
│ │ ├ BurningBarrel
│ │ ├ BurningBowl
│ │ ├ BurningBrazier
│ │ ├ Cacodemon
│ │ │ ├ DeadCacodemon
│ │ │ └ StealthCacodemon
│ │ ├ CacodemonBall
│ │ ├ CageLight
│ │ ├ CajunBodyNode
│ │ ├ CajunTrace
│ │ ├ Candelabra
│ │ │ └ ChexGasTank
│ │ ├ Candle
│ │ ├ Candlestick
│ │ │ └ ChexChemicalFlask
│ │ ├ CavePillarBottom
│ │ ├ CavePillarTop
│ │ ├ CeilingChain
│ │ ├ CeilingTurret
│ │ ├ Centaur
│ │ │ ├ CentaurLeader
│ │ │ └ CentaurMash
│ │ ├ CentaurFX
│ │ ├ CentaurShield
│ │ ├ CentaurSword
│ │ ├ CFlameFloor
│ │ ├ ChaingunGuy
│ │ │ └ StealthChaingunGuy
│ │ ├ ChimneyStack
│ │ ├ CircleFlame
│ │ ├ ClericBoss
│ │ ├ Clink
│ │ ├ ColonGibs
│ │ ├ ColorSetter
│ │ ├ Column
│ │ │ └ ChexLandingLight
│ │ ├ CommanderKeen
│ │ ├ Computer
│ │ ├ CorpseBit
│ │ ├ CorpseBloodDrip
│ │ ├ CrossbowFX1
│ │ │ ├ CrossbowFX2
│ │ │ └ CrossbowFX3
│ │ ├ CrossbowFX4
│ │ ├ Crusader
│ │ ├ CrusaderMissile
│ │ ├ CStaffMissile
│ │ ├ CStaffPuff
│ │ ├ CustomBridge
│ │ │ ├ Bridge
│ │ │ └ ZBridge
│ │ ├ CustomSprite
│ │ ├ Cyberdemon
│ │ ├ Dart
│ │ │ └ PoisonDart
│ │ ├ DeadAcolyte
│ │ ├ DeadCrusader
│ │ ├ DeadMarine
│ │ ├ DeadPeasant
│ │ ├ DeadReaver
│ │ ├ DeadRebel
│ │ ├ DeadStick
│ │ │ └ ChexTallFlower2
│ │ ├ DeadStrifePlayer
│ │ ├ Decal
│ │ ├ Demon
│ │ │ ├ DeadDemon
│ │ │ ├ FlemoidusCycloptisCommonus
│ │ │ ├ Spectre
│ │ │ └ StealthDemon
│ │ ├ Demon1
│ │ │ ├ Demon1Mash
│ │ │ └ Demon2
│ │ │   └ Demon2Mash
│ │ ├ Demon1FX1
│ │ ├ Demon2FX1
│ │ ├ DemonChunk
│ │ │ ├ Demon1Chunk1
│ │ │ ├ Demon1Chunk2
│ │ │ ├ Demon1Chunk3
│ │ │ ├ Demon1Chunk4
│ │ │ ├ Demon1Chunk5
│ │ │ ├ Demon2Chunk1
│ │ │ ├ Demon2Chunk2
│ │ │ ├ Demon2Chunk3
│ │ │ ├ Demon2Chunk4
│ │ │ └ Demon2Chunk5
│ │ ├ Dirt1
│ │ ├ Dirt2
│ │ ├ Dirt3
│ │ ├ Dirt4
│ │ ├ Dirt5
│ │ ├ Dirt6
│ │ ├ DirtClump
│ │ ├ DoomBuilderCamera
│ │ ├ DoomImp
│ │ │ ├ ArmoredFlemoidusBipedicus
│ │ │ ├ DeadDoomImp
│ │ │ └ StealthDoomImp
│ │ ├ DoomImpBall
│ │ ├ DoomUnusedStates
│ │ ├ Dragon
│ │ ├ DragonExplosion
│ │ ├ DragonFireball
│ │ ├ DynamicLight
│ │ │ ├ PointLight
│ │ │ │ ├ PointLightAdditive
│ │ │ │ ├ PointLightAttenuated
│ │ │ │ ├ PointLightFlicker
│ │ │ │ │ ├ PointLightFlickerAdditive
│ │ │ │ │ ├ PointLightFlickerAttenuated
│ │ │ │ │ └ PointLightFlickerSubtractive
│ │ │ │ ├ PointLightFlickerRandom
│ │ │ │ │ └ PointLightFlickerRandomSubtractive
│ │ │ │ ├ PointLightPulse
│ │ │ │ │ ├ PointLightPulseAdditive
│ │ │ │ │ ├ PointLightPulseAttenuated
│ │ │ │ │ └ PointLightPulseSubtractive
│ │ │ │ ├ PointLightSubtractive
│ │ │ │ ├ SectorPointLight
│ │ │ │ │ ├ SectorPointLightAdditive
│ │ │ │ │ ├ SectorPointLightAttenuated
│ │ │ │ │ └ SectorPointLightSubtractive
│ │ │ │ └ SVELight
│ │ │ │   ├ SVELight7958
│ │ │ │   ├ SVELight7959
│ │ │ │   ├ SVELight7960
│ │ │ │   ├ SVELight7961
│ │ │ │   ├ SVELight7962
│ │ │ │   ├ SVELight7964
│ │ │ │   ├ SVELight7965
│ │ │ │   ├ SVELight7971
│ │ │ │   ├ SVELight7972
│ │ │ │   ├ SVELight7973
│ │ │ │   └ SVELight7974
│ │ │ ├ SpotLight
│ │ │ │ ├ SectorSpotLight
│ │ │ │ │ ├ SectorSpotLightAdditive
│ │ │ │ │ ├ SectorSpotLightAttenuated
│ │ │ │ │ └ SectorSpotLightSubtractive
│ │ │ │ ├ SpotLightAdditive
│ │ │ │ ├ SpotLightAttenuated
│ │ │ │ ├ SpotLightFlicker
│ │ │ │ │ ├ SpotLightFlickerAdditive
│ │ │ │ │ ├ SpotLightFlickerAttenuated
│ │ │ │ │ └ SpotLightFlickerSubtractive
│ │ │ │ ├ SpotLightFlickerRandom
│ │ │ │ │ ├ SpotLightFlickerRandomAdditive
│ │ │ │ │ ├ SpotLightFlickerRandomAttenuated
│ │ │ │ │ └ SpotLightFlickerRandomSubtractive
│ │ │ │ ├ SpotLightPulse
│ │ │ │ │ ├ SpotLightPulseAdditive
│ │ │ │ │ ├ SpotLightPulseAttenuated
│ │ │ │ │ └ SpotLightPulseSubtractive
│ │ │ │ └ SpotLightSubtractive
│ │ │ └ VavoomLight
│ │ │   ├ VavoomLightColor
│ │ │   └ VavoomLightWhite
│ │ ├ ElectricBolt
│ │ ├ EntityNest
│ │ ├ EntityPod
│ │ ├ Ettin
│ │ │ └ EttinMash
│ │ ├ EttinMace
│ │ ├ EvilEye
│ │ │ └ ChexChemicalBurner
│ │ ├ ExplosiveBarrel
│ │ ├ ExplosiveBarrel2
│ │ ├ FadeSetter
│ │ ├ FastProjectile
│ │ │ ├ BlasterFX1
│ │ │ ├ CFlameMissile
│ │ │ └ MageWandMissile
│ │ ├ FatShot
│ │ ├ Fatso
│ │ │ └ StealthFatso
│ │ ├ Feather
│ │ ├ FighterBoss
│ │ ├ FireBall
│ │ ├ FireBomb
│ │ ├ FireDemon
│ │ ├ FireDemonMissile
│ │ ├ FireDemonRock1
│ │ │ ├ FireDemonRock2
│ │ │ ├ FireDemonRock3
│ │ │ ├ FireDemonRock4
│ │ │ └ FireDemonRock5
│ │ ├ FireDemonSplotch1
│ │ │ └ FireDemonSplotch2
│ │ ├ FireDroplet
│ │ ├ FireThing
│ │ ├ FlameLargeTemp
│ │ ├ FlameMissile
│ │ │ └ FastFlameMissile
│ │ ├ FlamePuff
│ │ │ └ FlamePuff2
│ │ ├ FlameSmallTemp
│ │ ├ FloatingSkull
│ │ ├ FogPatchSmall
│ │ │ └ FogPatchMedium
│ │ │   └ FogPatchLarge
│ │ ├ FogSpawner
│ │ ├ ForceFieldGuard
│ │ ├ FrostMissile
│ │ │ └ IceShard
│ │ ├ FSwordFlame
│ │ ├ FSwordMissile
│ │ ├ GauntletPuff1
│ │ │ └ GauntletPuff2
│ │ ├ GibbedMarine
│ │ │ └ GibbedMarineExtra
│ │ ├ GlassJunk
│ │ ├ GlassShard
│ │ │ ├ SGShard0
│ │ │ ├ SGShard1
│ │ │ ├ SGShard2
│ │ │ ├ SGShard3
│ │ │ ├ SGShard4
│ │ │ ├ SGShard5
│ │ │ ├ SGShard6
│ │ │ ├ SGShard7
│ │ │ ├ SGShard8
│ │ │ └ SGShard9
│ │ ├ GoldWandFX1
│ │ │ ├ GoldWandFX2
│ │ │ └ GoldWandPuff2
│ │ ├ GoldWandPuff1
│ │ ├ GreenTorch
│ │ │ └ ChexCivilian1
│ │ ├ Grenade
│ │ ├ GrenadeSmokeTrail
│ │ ├ HammerMissile
│ │ ├ HammerPuff
│ │ ├ HangBNoBrain
│ │ ├ HangNoGuts
│ │ ├ HangTLookingDown
│ │ ├ HangTLookingUp
│ │ ├ HangTNoBrain
│ │ ├ HangTSkull
│ │ ├ HateTarget
│ │ ├ HeadCandles
│ │ ├ HeadFX1
│ │ ├ HeadFX2
│ │ ├ HeadFX3
│ │ ├ HeadOnAStick
│ │ ├ HeadsOnAStick
│ │ │ └ ChexTallFlower
│ │ ├ HeartColumn
│ │ ├ HeartsInTank
│ │ ├ HEGrenade
│ │ ├ Heresiarch
│ │ ├ HereticImp
│ │ │ └ HereticImpLeader
│ │ ├ HereticImpBall
│ │ ├ HereticImpChunk1
│ │ ├ HereticImpChunk2
│ │ ├ HolyMissile
│ │ ├ HolyMissilePuff
│ │ ├ HolyPuff
│ │ ├ HolySpirit
│ │ ├ HolyTail
│ │ │ └ HolyTailTrail
│ │ ├ HornRodFX1
│ │ ├ HornRodFX2
│ │ ├ HugeTorch
│ │ ├ HWaterDrip
│ │ ├ IceChunk
│ │ ├ IceFXPuff
│ │ ├ IceGuy
│ │ ├ IceGuyBit
│ │ ├ IceGuyFX
│ │ ├ IceGuyFX2
│ │ ├ IceGuyWisp1
│ │ │ └ IceGuyWisp2
│ │ ├ Inquisitor
│ │ ├ InquisitorArm
│ │ ├ InquisitorShot
│ │ ├ InterpolationPoint
│ │ ├ InterpolationSpecial
│ │ ├ Inventory
│ │ │ ├ Ammo
│ │ │ │ ├ Cell
│ │ │ │ │ ├ CellPack
│ │ │ │ │ ├ PhasingZorch
│ │ │ │ │ └ PhasingZorchPack
│ │ │ │ ├ Clip
│ │ │ │ │ ├ ClipBox
│ │ │ │ │ ├ MiniZorchPack
│ │ │ │ │ └ MiniZorchRecharge
│ │ │ │ ├ ClipOfBullets
│ │ │ │ │ └ BoxOfBullets
│ │ │ │ ├ ElectricBolts
│ │ │ │ ├ EnergyPod
│ │ │ │ │ └ EnergyPack
│ │ │ │ ├ HEGrenadeRounds
│ │ │ │ ├ Mana1
│ │ │ │ ├ Mana2
│ │ │ │ ├ MiniMissiles
│ │ │ │ │ └ CrateOfMissiles
│ │ │ │ ├ PhosphorusGrenadeRounds
│ │ │ │ ├ PoisonBolts
│ │ │ │ ├ RocketAmmo
│ │ │ │ │ ├ PropulsorZorch
│ │ │ │ │ ├ PropulsorZorchPack
│ │ │ │ │ └ RocketBox
│ │ │ │ └ Shell
│ │ │ │   ├ LargeZorchPack
│ │ │ │   ├ LargeZorchRecharge
│ │ │ │   └ ShellBox
│ │ │ ├ Armor
│ │ │ │ ├ BasicArmor
│ │ │ │ ├ BasicArmorBonus
│ │ │ │ │ └ ArmorBonus
│ │ │ │ │   └ SlimeRepellent
│ │ │ │ ├ BasicArmorPickup
│ │ │ │ │ ├ BlueArmor
│ │ │ │ │ │ ├ BlueArmorForMegasphere
│ │ │ │ │ │ └ SuperChexArmor
│ │ │ │ │ ├ GreenArmor
│ │ │ │ │ │ └ ChexArmor
│ │ │ │ │ ├ LeatherArmor
│ │ │ │ │ └ MetalArmor
│ │ │ │ └ HexenArmor
│ │ │ │   ├ AmuletOfWarding
│ │ │ │   ├ FalconShield
│ │ │ │   ├ MeshArmor
│ │ │ │   └ PlatinumHelm
│ │ │ ├ ArtiBoostArmor
│ │ │ ├ ArtiDarkServant
│ │ │ ├ ArtiHealingRadius
│ │ │ ├ ArtiPoisonBag
│ │ │ │ ├ ArtiPoisonBag1
│ │ │ │ ├ ArtiPoisonBag2
│ │ │ │ ├ ArtiPoisonBag3
│ │ │ │ ├ ArtiPoisonBagGiver
│ │ │ │ └ ArtiPoisonBagShooter
│ │ │ ├ ArtiTeleport
│ │ │ ├ ArtiTeleportOther
│ │ │ ├ BackpackItem
│ │ │ │ ├ AmmoSatchel
│ │ │ │ └ Backpack
│ │ │ │   └ Zorchpack
│ │ │ ├ BeldinsRing
│ │ │ ├ BrokenPowerCoupling
│ │ │ ├ Coin
│ │ │ │ ├ Gold10
│ │ │ │ ├ Gold25
│ │ │ │ ├ Gold300
│ │ │ │ └ Gold50
│ │ │ ├ Communicator
│ │ │ ├ DegninOre
│ │ │ ├ DehackedPickup
│ │ │ ├ DummyStrifeItem
│ │ │ │ ├ AmmoFillup
│ │ │ │ ├ CloseDoor222
│ │ │ │ ├ HealthFillup
│ │ │ │ ├ OpenDoor222
│ │ │ │ ├ OpenDoor224
│ │ │ │ ├ RaiseAlarm
│ │ │ │ ├ SlideshowStarter
│ │ │ │ ├ SVEOpenDoor225
│ │ │ │ ├ UpgradeAccuracy
│ │ │ │ └ UpgradeStamina
│ │ │ ├ Ear
│ │ │ ├ FakeInventory
│ │ │ ├ FlameThrowerParts
│ │ │ ├ GuardUniform
│ │ │ ├ GunTraining
│ │ │ ├ Health
│ │ │ │ ├ CrystalVial
│ │ │ │ ├ HealthBonus
│ │ │ │ │ └ GlassOfWater
│ │ │ │ ├ MaxHealth
│ │ │ │ ├ Medikit
│ │ │ │ │ └ BowlOfVegetables
│ │ │ │ ├ MegasphereHealth
│ │ │ │ ├ Soulsphere
│ │ │ │ │ └ SuperchargeBreakfast
│ │ │ │ └ Stimpack
│ │ │ │   └ BowlOfFruit
│ │ │ ├ HealthPickup
│ │ │ │ ├ ArtiHealth
│ │ │ │ ├ ArtiSuperHealth
│ │ │ │ ├ MedicalKit
│ │ │ │ ├ MedPatch
│ │ │ │ └ SurgeryKit
│ │ │ ├ HealthTraining
│ │ │ ├ Info
│ │ │ ├ InterrogatorReport
│ │ │ ├ Key
│ │ │ │ ├ DoomKey
│ │ │ │ │ ├ BlueCard
│ │ │ │ │ │ └ ChexBlueCard
│ │ │ │ │ ├ BlueSkull
│ │ │ │ │ ├ RedCard
│ │ │ │ │ │ └ ChexRedCard
│ │ │ │ │ ├ RedSkull
│ │ │ │ │ ├ YellowCard
│ │ │ │ │ │ └ ChexYellowCard
│ │ │ │ │ └ YellowSkull
│ │ │ │ ├ HexenKey
│ │ │ │ │ ├ KeyAxe
│ │ │ │ │ ├ KeyCastle
│ │ │ │ │ ├ KeyCave
│ │ │ │ │ ├ KeyDungeon
│ │ │ │ │ ├ KeyEmerald
│ │ │ │ │ ├ KeyFire
│ │ │ │ │ ├ KeyHorn
│ │ │ │ │ ├ KeyRusted
│ │ │ │ │ ├ KeySilver
│ │ │ │ │ ├ KeySteel
│ │ │ │ │ └ KeySwamp
│ │ │ │ ├ PrisonPass
│ │ │ │ └ StrifeKey
│ │ │ │   ├ BaseKey
│ │ │ │   ├ BlueCrystalKey
│ │ │ │   ├ BrassKey
│ │ │ │   ├ CatacombKey
│ │ │ │   ├ ChapelKey
│ │ │ │   ├ CoreKey
│ │ │ │   ├ FactoryKey
│ │ │ │   ├ GoldKey
│ │ │ │   ├ GovsKey
│ │ │ │   ├ IDBadge
│ │ │ │   ├ IDCard
│ │ │ │   ├ MaulerKey
│ │ │ │   ├ MilitaryID
│ │ │ │   ├ MineKey
│ │ │ │   ├ NewKey5
│ │ │ │   ├ OracleKey
│ │ │ │   ├ OrderKey
│ │ │ │   ├ Passcard
│ │ │ │   ├ Power1Key
│ │ │ │   ├ Power2Key
│ │ │ │   ├ Power3Key
│ │ │ │   ├ PrisonKey
│ │ │ │   ├ RedCrystalKey
│ │ │ │   ├ SecurityKey
│ │ │ │   ├ SeveredHand
│ │ │ │   ├ SilverKey
│ │ │ │   └ WarehouseKey
│ │ │ ├ MapRevealer
│ │ │ │ ├ Allmap
│ │ │ │ │ └ ComputerAreaMap
│ │ │ │ └ StrifeMap
│ │ │ ├ OfferingChalice
│ │ │ ├ OfficersUniform
│ │ │ ├ OraclePass
│ │ │ ├ Powerup
│ │ │ │ ├ PowerBuddha
│ │ │ │ ├ PowerDamage
│ │ │ │ ├ PowerDoubleFiringSpeed
│ │ │ │ ├ PowerDrain
│ │ │ │ ├ PowerFlight
│ │ │ │ ├ PowerFrightener
│ │ │ │ ├ PowerHighJump
│ │ │ │ ├ PowerInfiniteAmmo
│ │ │ │ ├ PowerInvisibility
│ │ │ │ │ ├ PowerGhost
│ │ │ │ │ └ PowerShadow
│ │ │ │ ├ PowerInvulnerable
│ │ │ │ ├ PowerIronFeet
│ │ │ │ │ └ PowerMask
│ │ │ │ ├ PowerLightAmp
│ │ │ │ │ └ PowerTorch
│ │ │ │ ├ PowerMinotaur
│ │ │ │ ├ PowerMorph
│ │ │ │ ├ PowerProtection
│ │ │ │ ├ PowerReflection
│ │ │ │ ├ PowerRegeneration
│ │ │ │ ├ PowerScanner
│ │ │ │ ├ PowerSpeed
│ │ │ │ ├ PowerStrength
│ │ │ │ ├ PowerTargeter
│ │ │ │ ├ PowerTimeFreezer
│ │ │ │ └ PowerWeaponLevel2
│ │ │ ├ PowerupGiver
│ │ │ │ ├ ArtiFly
│ │ │ │ ├ ArtiInvulnerability
│ │ │ │ ├ ArtiInvulnerability2
│ │ │ │ ├ ArtiSpeedBoots
│ │ │ │ ├ ArtiTorch
│ │ │ │ ├ BlurSphere
│ │ │ │ ├ EnvironmentalSuit
│ │ │ │ ├ Infrared
│ │ │ │ ├ InvulnerabilitySphere
│ │ │ │ ├ RadSuit
│ │ │ │ │ └ SlimeProofSuit
│ │ │ │ ├ Scanner
│ │ │ │ ├ ShadowArmor
│ │ │ │ └ Targeter
│ │ │ ├ ProgLevelEnder
│ │ │ ├ PuzzleItem
│ │ │ │ ├ PuzzBook1
│ │ │ │ ├ PuzzBook2
│ │ │ │ ├ PuzzCWeapon
│ │ │ │ ├ PuzzFlameMask
│ │ │ │ ├ PuzzFWeapon
│ │ │ │ ├ PuzzGear1
│ │ │ │ ├ PuzzGear2
│ │ │ │ ├ PuzzGear3
│ │ │ │ ├ PuzzGear4
│ │ │ │ ├ PuzzGemBig
│ │ │ │ ├ PuzzGemBlue1
│ │ │ │ ├ PuzzGemBlue2
│ │ │ │ ├ PuzzGemGreen1
│ │ │ │ ├ PuzzGemGreen2
│ │ │ │ ├ PuzzGemRed
│ │ │ │ ├ PuzzMWeapon
│ │ │ │ └ PuzzSkull
│ │ │ ├ QuestItem
│ │ │ │ ├ QuestItem1
│ │ │ │ ├ QuestItem10
│ │ │ │ ├ QuestItem11
│ │ │ │ ├ QuestItem12
│ │ │ │ ├ QuestItem13
│ │ │ │ ├ QuestItem14
│ │ │ │ ├ QuestItem15
│ │ │ │ ├ QuestItem16
│ │ │ │ ├ QuestItem17
│ │ │ │ ├ QuestItem18
│ │ │ │ ├ QuestItem19
│ │ │ │ ├ QuestItem2
│ │ │ │ ├ QuestItem20
│ │ │ │ ├ QuestItem21
│ │ │ │ ├ QuestItem22
│ │ │ │ ├ QuestItem23
│ │ │ │ ├ QuestItem24
│ │ │ │ ├ QuestItem25
│ │ │ │ ├ QuestItem26
│ │ │ │ ├ QuestItem27
│ │ │ │ ├ QuestItem28
│ │ │ │ ├ QuestItem29
│ │ │ │ ├ QuestItem3
│ │ │ │ ├ QuestItem30
│ │ │ │ ├ QuestItem31
│ │ │ │ ├ QuestItem4
│ │ │ │ ├ QuestItem5
│ │ │ │ ├ QuestItem6
│ │ │ │ ├ QuestItem7
│ │ │ │ ├ QuestItem8
│ │ │ │ └ QuestItem9
│ │ │ ├ RainTracker
│ │ │ ├ ScoreItem
│ │ │ │ ├ EvilSceptre
│ │ │ │ └ UnholyBible
│ │ │ ├ StateProvider
│ │ │ │ ├ CustomInventory
│ │ │ │ │ ├ ArtiBlastRadius
│ │ │ │ │ ├ ArtiBoostMana
│ │ │ │ │ ├ ArtiEgg
│ │ │ │ │ ├ ArtiPork
│ │ │ │ │ ├ Berserk
│ │ │ │ │ ├ Mana3
│ │ │ │ │ └ Megasphere
│ │ │ │ └ Weapon
│ │ │ │   ├ Beak
│ │ │ │   │ └ BeakPowered
│ │ │ │   ├ Chainsaw
│ │ │ │   │ └ SuperBootspork
│ │ │ │   ├ ClericWeapon
│ │ │ │   │ ├ CWeapFlame
│ │ │ │   │ ├ CWeapMace
│ │ │ │   │ ├ CWeapStaff
│ │ │ │   │ └ CWeapWraithverge
│ │ │ │   ├ DoomWeapon
│ │ │ │   │ ├ BFG9000
│ │ │ │   │ │ └ LAZDevice
│ │ │ │   │ ├ Chaingun
│ │ │ │   │ │ └ RapidZorcher
│ │ │ │   │ ├ Pistol
│ │ │ │   │ │ └ MiniZorcher
│ │ │ │   │ ├ PlasmaRifle
│ │ │ │   │ │ └ PhasingZorcher
│ │ │ │   │ ├ RocketLauncher
│ │ │ │   │ │ └ ZorchPropulsor
│ │ │ │   │ ├ Shotgun
│ │ │ │   │ │ └ LargeZorcher
│ │ │ │   │ └ SuperShotgun
│ │ │ │   │   └ SuperLargeZorcher
│ │ │ │   ├ FighterWeapon
│ │ │ │   │ ├ FWeapAxe
│ │ │ │   │ ├ FWeapFist
│ │ │ │   │ ├ FWeapHammer
│ │ │ │   │ └ FWeapQuietus
│ │ │ │   ├ Fist
│ │ │ │   │ └ Bootspoon
│ │ │ │   ├ Gauntlets
│ │ │ │   │ └ GauntletsPowered
│ │ │ │   ├ HereticWeapon
│ │ │ │   │ ├ Blaster
│ │ │ │   │ │ └ BlasterPowered
│ │ │ │   │ ├ Crossbow
│ │ │ │   │ │ └ CrossbowPowered
│ │ │ │   │ ├ GoldWand
│ │ │ │   │ │ └ GoldWandPowered
│ │ │ │   │ ├ Mace
│ │ │ │   │ │ └ MacePowered
│ │ │ │   │ ├ SkullRod
│ │ │ │   │ │ └ SkullRodPowered
│ │ │ │   │ └ Staff
│ │ │ │   │   └ StaffPowered
│ │ │ │   ├ MageWeapon
│ │ │ │   │ ├ MWeapBloodscourge
│ │ │ │   │ ├ MWeapFrost
│ │ │ │   │ ├ MWeapLightning
│ │ │ │   │ └ MWeapWand
│ │ │ │   ├ PhoenixRod
│ │ │ │   │ └ PhoenixRodPowered
│ │ │ │   ├ Sigil
│ │ │ │   │ ├ Sigil1
│ │ │ │   │ ├ Sigil2
│ │ │ │   │ ├ Sigil3
│ │ │ │   │ ├ Sigil4
│ │ │ │   │ └ Sigil5
│ │ │ │   ├ Snout
│ │ │ │   ├ StrifeWeapon
│ │ │ │   │ ├ AssaultGun
│ │ │ │   │ ├ FlameThrower
│ │ │ │   │ ├ Mauler
│ │ │ │   │ │ └ Mauler2
│ │ │ │   │ ├ MiniMissileLauncher
│ │ │ │   │ ├ PunchDagger
│ │ │ │   │ ├ StrifeCrossbow
│ │ │ │   │ │ └ StrifeCrossbow2
│ │ │ │   │ └ StrifeGrenadeLauncher
│ │ │ │   │   └ StrifeGrenadeLauncher2
│ │ │ │   └ WeaponGiver
│ │ │ │     └ AssaultGunStanding
│ │ │ ├ SVEBlueChalice
│ │ │ ├ SVEFlagSpotBlue
│ │ │ ├ SVEFlagSpotRed
│ │ │ ├ SVETalismanPowerup
│ │ │ ├ SVETalismanRed
│ │ │ │ ├ SVETalismanBlue
│ │ │ │ └ SVETalismanGreen
│ │ │ ├ TeleporterBeacon
│ │ │ ├ WeaponHolder
│ │ │ └ WeaponPiece
│ │ │   ├ ClericWeaponPiece
│ │ │   │ ├ CWeaponPiece1
│ │ │   │ ├ CWeaponPiece2
│ │ │   │ └ CWeaponPiece3
│ │ │   ├ FighterWeaponPiece
│ │ │   │ ├ FWeaponPiece1
│ │ │   │ ├ FWeaponPiece2
│ │ │   │ └ FWeaponPiece3
│ │ │   └ MageWeaponPiece
│ │ │     ├ MWeaponPiece1
│ │ │     ├ MWeaponPiece2
│ │ │     └ MWeaponPiece3
│ │ ├ InvisibleBridge
│ │ │ ├ InvisibleBridge16
│ │ │ ├ InvisibleBridge32
│ │ │ └ InvisibleBridge8
│ │ ├ Ironlich
│ │ ├ ItemFog
│ │ ├ KlaxonWarningLight
│ │ ├ KneelingGuy
│ │ ├ Knight
│ │ │ └ KnightGhost
│ │ ├ KnightAxe
│ │ │ └ RedAxe
│ │ ├ Korax
│ │ ├ KoraxBolt
│ │ ├ KoraxSpirit
│ │ ├ LargeTorch
│ │ ├ LavaSmoke
│ │ ├ LavaSplash
│ │ ├ Leaf1
│ │ │ └ Leaf2
│ │ ├ LeafSpawner
│ │ ├ LightBrownFluorescent
│ │ ├ LightGlobe
│ │ ├ LightGoldFluorescent
│ │ ├ Lightning
│ │ │ └ LightningCeiling
│ │ │   └ LightningFloor
│ │ ├ LightningZap
│ │ ├ LightSilverFluorescent
│ │ ├ LittleFly
│ │ ├ LiveStick
│ │ ├ Loremaster
│ │ ├ LoreShot
│ │ ├ LoreShot2
│ │ ├ LostSoul
│ │ │ ├ BetaSkull
│ │ │ ├ ChexSoul
│ │ │ └ DeadLostSoul
│ │ ├ MaceFX1
│ │ │ ├ MaceFX2
│ │ │ └ MaceFX3
│ │ ├ MaceFX4
│ │ ├ Macil1
│ │ │ └ Macil2
│ │ ├ MageBoss
│ │ ├ MageStaffFX2
│ │ ├ MageWandSmoke
│ │ ├ MapMarker
│ │ ├ MapSpot
│ │ │ ├ FS_Mapspot
│ │ │ └ MapSpotGravity
│ │ ├ MaulerPuff
│ │ ├ MaulerTorpedo
│ │ ├ MaulerTorpedoWave
│ │ ├ MBFHelperDog
│ │ ├ Meat
│ │ │ └ Junk
│ │ ├ Meat2
│ │ │ └ NonsolidMeat2
│ │ ├ Meat3
│ │ │ └ NonsolidMeat3
│ │ ├ Meat4
│ │ │ └ NonsolidMeat4
│ │ ├ Meat5
│ │ │ └ NonsolidMeat5
│ │ ├ MediumTorch
│ │ ├ Merchant
│ │ │ ├ Armorer
│ │ │ ├ BarKeep
│ │ │ ├ Medic
│ │ │ └ WeaponSmith
│ │ ├ MetalPot
│ │ ├ MiniMissile
│ │ ├ Minotaur
│ │ │ └ MinotaurFriend
│ │ ├ MinotaurFX1
│ │ │ └ MinotaurFX2
│ │ │   └ MinotaurFX3
│ │ ├ MinotaurSmoke
│ │ ├ MinotaurSmokeExit
│ │ ├ MorphedMonster
│ │ │ ├ Chicken
│ │ │ └ Pig
│ │ ├ MorphProjectile
│ │ │ ├ EggFX
│ │ │ └ PorkFX
│ │ ├ Mug
│ │ ├ Mummy
│ │ │ ├ MummyGhost
│ │ │ └ MummyLeader
│ │ │   └ MummyLeaderGhost
│ │ ├ MummyFX1
│ │ ├ MummySoul
│ │ ├ Oracle
│ │ ├ OutsideLamp
│ │ ├ PainElemental
│ │ ├ PalmTree
│ │ ├ ParticleFountain
│ │ │ ├ BlackParticleFountain
│ │ │ ├ BlueParticleFountain
│ │ │ ├ GreenParticleFountain
│ │ │ ├ PurpleParticleFountain
│ │ │ ├ RedParticleFountain
│ │ │ ├ WhiteParticleFountain
│ │ │ └ YellowParticleFountain
│ │ ├ PathFollower
│ │ │ ├ ActorMover
│ │ │ └ MovingCamera
│ │ ├ PatrolPoint
│ │ ├ PatrolSpecial
│ │ ├ PhoenixFX1
│ │ ├ PhoenixFX2
│ │ ├ PhoenixPuff
│ │ ├ PhosphorousFire
│ │ ├ PhosphorousGrenade
│ │ ├ PickupFlash
│ │ ├ PileOfGuts
│ │ ├ PillarAlienPower
│ │ ├ PillarAztec
│ │ ├ PillarAztecDamaged
│ │ ├ PillarAztecRuined
│ │ ├ PillarHugeTech
│ │ ├ PillarTechno
│ │ ├ Piston
│ │ ├ Pitcher
│ │ ├ PlasmaBall
│ │ │ ├ PhaseZorchMissile
│ │ │ └ PlasmaBall1
│ │ │   └ PlasmaBall2
│ │ ├ PlayerPawn
│ │ │ ├ ChickenPlayer
│ │ │ ├ ClericPlayer
│ │ │ ├ DoomPlayer
│ │ │ │ └ ChexPlayer
│ │ │ ├ FighterPlayer
│ │ │ ├ HereticPlayer
│ │ │ ├ MagePlayer
│ │ │ ├ PigPlayer
│ │ │ ├ PlayerChunk
│ │ │ │ ├ BloodyFighterSkull
│ │ │ │ ├ BloodySkull
│ │ │ │ └ IceChunkHead
│ │ │ └ StrifePlayer
│ │ ├ PlayerSpeedTrail
│ │ ├ Pod
│ │ ├ PodGenerator
│ │ ├ PodGoo
│ │ ├ PointPuller
│ │ ├ PointPusher
│ │ ├ PoisonBag
│ │ │ └ ZPoisonShroom
│ │ ├ PoisonBolt
│ │ ├ PoisonCloud
│ │ ├ PoleLantern
│ │ ├ Pot
│ │ ├ PottedTree
│ │ ├ Pottery1
│ │ │ ├ Pottery2
│ │ │ └ Pottery3
│ │ ├ PotteryBit
│ │ ├ PowerCoupling
│ │ ├ PowerCrystal
│ │ ├ Programmer
│ │ ├ ProgrammerBase
│ │ ├ ProjectileBlade
│ │ ├ Puffy
│ │ ├ PunchPuff
│ │ ├ QuietusDrop
│ │ ├ RainPillar
│ │ ├ RandomSpawner
│ │ ├ RatBuddy
│ │ ├ RealGibs
│ │ │ └ Gibs
│ │ ├ Reaver
│ │ ├ RebelBoots
│ │ ├ RebelHelmet
│ │ ├ RebelShirt
│ │ ├ RedTorch
│ │ ├ Revenant
│ │ │ └ StealthRevenant
│ │ ├ RevenantTracer
│ │ ├ RevenantTracerSmoke
│ │ ├ Ripper
│ │ ├ RipperBall
│ │ ├ Rock1
│ │ ├ Rock2
│ │ ├ Rock3
│ │ ├ Rocket
│ │ │ └ PropulsorMissile
│ │ ├ RocketSmokeTrail
│ │ ├ RocketTrail
│ │ ├ Rubble1
│ │ ├ Rubble2
│ │ ├ Rubble3
│ │ ├ Rubble4
│ │ ├ Rubble5
│ │ ├ Rubble6
│ │ ├ Rubble7
│ │ ├ Rubble8
│ │ ├ SacrificedGuy
│ │ ├ ScriptedMarine
│ │ │ ├ MarineBFG
│ │ │ ├ MarineChaingun
│ │ │ ├ MarineChainsaw
│ │ │ ├ MarineFist
│ │ │ │ ├ MarineBerserk
│ │ │ │ └ MarineRocket
│ │ │ ├ MarinePistol
│ │ │ ├ MarinePlasma
│ │ │ ├ MarineRailgun
│ │ │ ├ MarineShotgun
│ │ │ └ MarineSSG
│ │ ├ SecretTrigger
│ │ ├ SectorAction
│ │ │ ├ MusicChanger
│ │ │ ├ SecActEnter
│ │ │ ├ SecActExit
│ │ │ ├ SecActEyesAboveC
│ │ │ ├ SecActEyesBelowC
│ │ │ ├ SecActEyesDive
│ │ │ ├ SecActEyesSurface
│ │ │ ├ SecActHitCeil
│ │ │ ├ SecActHitFakeFloor
│ │ │ ├ SecActHitFloor
│ │ │ ├ SecActUse
│ │ │ └ SecActUseWall
│ │ ├ SectorFlagSetter
│ │ ├ SectorSilencer
│ │ ├ SecurityCamera
│ │ │ └ AimingCamera
│ │ ├ Sentinel
│ │ ├ SentinelFX1
│ │ │ └ SentinelFX2
│ │ ├ Serpent
│ │ │ └ SerpentLeader
│ │ ├ SerpentFX
│ │ ├ SerpentGib1
│ │ │ ├ SerpentGib2
│ │ │ └ SerpentGib3
│ │ ├ SerpentHead
│ │ ├ ShortBlueTorch
│ │ │ └ ChexLightColumn
│ │ ├ ShortBush
│ │ ├ ShortGreenColumn
│ │ │ └ ChexSubmergedPlant
│ │ ├ ShortGreenTorch
│ │ │ └ ChexCivilian2
│ │ ├ ShortRedColumn
│ │ │ └ ChexMineCart
│ │ ├ ShortRedTorch
│ │ │ └ ChexCivilian3
│ │ ├ ShotgunGuy
│ │ │ ├ DeadShotgunGuy
│ │ │ ├ FlemoidusBipedicus
│ │ │ └ StealthShotgunGuy
│ │ ├ SigilBanner
│ │ ├ SkullColumn
│ │ │ └ ChexFlagOnPole
│ │ ├ SkyPicker
│ │ ├ SkyViewpoint
│ │ │ ├ SkyCamCompat
│ │ │ └ StackPoint
│ │ │   ├ LowerStackLookOnly
│ │ │   └ UpperStackLookOnly
│ │ ├ SlimeChunk
│ │ ├ SlimeSplash
│ │ ├ SludgeChunk
│ │ ├ SludgeSplash
│ │ ├ SmallBloodPool
│ │ ├ SmallTorchLit
│ │ ├ SmallTorchUnlit
│ │ ├ Snake
│ │ ├ SnakeProjA
│ │ │ └ SnakeProjB
│ │ ├ SnoutPuff
│ │ ├ SorcBall
│ │ │ ├ SorcBall1
│ │ │ ├ SorcBall2
│ │ │ └ SorcBall3
│ │ ├ Sorcerer1
│ │ ├ Sorcerer2
│ │ ├ Sorcerer2FX1
│ │ ├ Sorcerer2FX2
│ │ ├ Sorcerer2FXSpark
│ │ ├ Sorcerer2Telefade
│ │ ├ SorcererFX1
│ │ ├ SorcFX1
│ │ ├ SorcFX2
│ │ │ └ SorcFX2T1
│ │ ├ SorcFX3
│ │ ├ SorcFX3Explosion
│ │ ├ SorcFX4
│ │ ├ SorcSpark1
│ │ ├ SoundEnvironment
│ │ ├ SoundSequence
│ │ │ ├ HereticSoundSequence1
│ │ │ ├ HereticSoundSequence10
│ │ │ ├ HereticSoundSequence2
│ │ │ ├ HereticSoundSequence3
│ │ │ ├ HereticSoundSequence4
│ │ │ ├ HereticSoundSequence5
│ │ │ ├ HereticSoundSequence6
│ │ │ ├ HereticSoundSequence7
│ │ │ ├ HereticSoundSequence8
│ │ │ └ HereticSoundSequence9
│ │ ├ SoundSequenceSlot
│ │ ├ SoundWaterfall
│ │ ├ SoundWind
│ │ │ └ SoundWindHexen
│ │ ├ Spark
│ │ ├ SpawnFire
│ │ ├ SpawnShot
│ │ ├ SpecialSpot
│ │ │ ├ BossSpot
│ │ │ ├ BossTarget
│ │ │ └ MaceSpawner
│ │ ├ SpectralLightningBase
│ │ │ ├ SpectralLightningBall1
│ │ │ │ └ SpectralLightningBall2
│ │ │ ├ SpectralLightningDeath1
│ │ │ │ ├ SpectralLightningBigV1
│ │ │ │ │ └ SpectralLightningBigV2
│ │ │ │ └ SpectralLightningSpot
│ │ │ ├ SpectralLightningDeath2
│ │ │ │ └ SpectralLightningBigBall1
│ │ │ │   └ SpectralLightningBigBall2
│ │ │ ├ SpectralLightningDeathShort
│ │ │ │ └ SpectralLightningV1
│ │ │ │   └ SpectralLightningV2
│ │ │ └ SpectralLightningH1
│ │ │   ├ SpectralLightningH2
│ │ │   └ SpectralLightningH3
│ │ ├ SpectralLightningHTail
│ │ ├ SpectralMonster
│ │ │ ├ AlienSpectre1
│ │ │ │ ├ AlienSpectre2
│ │ │ │ ├ AlienSpectre3
│ │ │ │ ├ AlienSpectre4
│ │ │ │ └ AlienSpectre5
│ │ │ ├ EntityBoss
│ │ │ └ EntitySecond
│ │ ├ SpiderMastermind
│ │ ├ SRock1
│ │ ├ SRock2
│ │ ├ SRock3
│ │ ├ SRock4
│ │ ├ SStalactiteBig
│ │ ├ SStalactiteSmall
│ │ ├ SStalagmiteBig
│ │ ├ SStalagmiteSmall
│ │ ├ StaffPuff
│ │ │ └ BeakPuff
│ │ ├ StaffPuff2
│ │ ├ Stalagmite
│ │ ├ Stalagtite
│ │ │ └ ChexAppleTree
│ │ ├ Stalker
│ │ ├ Statue
│ │ ├ StatueRuined
│ │ ├ StickInWater
│ │ ├ Stool
│ │ ├ StrifeBishop
│ │ ├ StrifeBurningBarrel
│ │ ├ StrifeCandelabra
│ │ ├ StrifeHumanoid
│ │ │ ├ Acolyte
│ │ │ │ ├ AcolyteBlue
│ │ │ │ ├ AcolyteDGreen
│ │ │ │ ├ AcolyteGold
│ │ │ │ ├ AcolyteGray
│ │ │ │ ├ AcolyteLGreen
│ │ │ │ ├ AcolyteRed
│ │ │ │ ├ AcolyteRust
│ │ │ │ ├ AcolyteShadow
│ │ │ │ ├ AcolyteTan
│ │ │ │ └ AcolyteToBe
│ │ │ ├ Beggar
│ │ │ │ ├ Beggar1
│ │ │ │ ├ Beggar2
│ │ │ │ ├ Beggar3
│ │ │ │ ├ Beggar4
│ │ │ │ └ Beggar5
│ │ │ ├ Peasant
│ │ │ │ ├ Peasant1
│ │ │ │ ├ Peasant10
│ │ │ │ ├ Peasant11
│ │ │ │ ├ Peasant12
│ │ │ │ ├ Peasant13
│ │ │ │ ├ Peasant14
│ │ │ │ ├ Peasant15
│ │ │ │ ├ Peasant16
│ │ │ │ ├ Peasant17
│ │ │ │ ├ Peasant18
│ │ │ │ ├ Peasant19
│ │ │ │ ├ Peasant2
│ │ │ │ ├ Peasant20
│ │ │ │ ├ Peasant21
│ │ │ │ ├ Peasant22
│ │ │ │ ├ Peasant3
│ │ │ │ ├ Peasant4
│ │ │ │ ├ Peasant5
│ │ │ │ ├ Peasant6
│ │ │ │ ├ Peasant7
│ │ │ │ ├ Peasant8
│ │ │ │ └ Peasant9
│ │ │ ├ Rebel
│ │ │ │ ├ Rebel1
│ │ │ │ ├ Rebel2
│ │ │ │ ├ Rebel3
│ │ │ │ ├ Rebel4
│ │ │ │ ├ Rebel5
│ │ │ │ └ Rebel6
│ │ │ └ Zombie
│ │ ├ StrifePuff
│ │ │ ├ MiniMissilePuff
│ │ │ └ StrifeSpark
│ │ ├ SummoningDoll
│ │ ├ SurgeryCrab
│ │ ├ SVEOreSpawner
│ │ ├ SwitchableDecoration
│ │ │ ├ BatSpawner
│ │ │ ├ FlameLarge
│ │ │ │ └ FlameLarge2
│ │ │ ├ FlameSmall
│ │ │ │ └ FlameSmall2
│ │ │ ├ SwitchingDecoration
│ │ │ │ ├ ZGemPedestal
│ │ │ │ └ ZWingedStatueNoSkull
│ │ │ ├ ZCauldron
│ │ │ │ └ ZCauldronUnlit
│ │ │ ├ ZFireBull
│ │ │ │ └ ZFireBullUnlit
│ │ │ ├ ZTwinedTorch
│ │ │ │ └ ZTwinedTorchUnlit
│ │ │ └ ZWallTorch
│ │ │   └ ZWallTorchUnlit
│ │ ├ TableShit1
│ │ ├ TableShit10
│ │ ├ TableShit2
│ │ ├ TableShit3
│ │ ├ TableShit4
│ │ ├ TableShit5
│ │ ├ TableShit6
│ │ ├ TableShit7
│ │ ├ TableShit8
│ │ ├ TableShit9
│ │ ├ TallBush
│ │ ├ TallGreenColumn
│ │ │ └ ChexCavernStalagmite
│ │ ├ TallRedColumn
│ │ │ └ ChexCavernColumn
│ │ ├ Tank1
│ │ ├ Tank2
│ │ ├ Tank3
│ │ ├ Tank4
│ │ ├ Tank5
│ │ ├ Tank6
│ │ ├ TargetPractice
│ │ ├ TechLamp
│ │ ├ TechLamp2
│ │ ├ TechLampBrass
│ │ ├ TechLampSilver
│ │ ├ TechPillar
│ │ │ └ ChexSpaceship
│ │ ├ TeleGlitter1
│ │ │ └ TeleGlitter2
│ │ ├ TeleGlitterGenerator1
│ │ ├ TeleGlitterGenerator2
│ │ ├ TeleportDest
│ │ │ └ TeleportDest2
│ │ │   └ TeleportDest3
│ │ ├ TeleportFog
│ │ ├ TeleportSwirl
│ │ ├ TeleSmoke
│ │ ├ TelOtherFX1
│ │ │ ├ TelOtherFX2
│ │ │ ├ TelOtherFX3
│ │ │ ├ TelOtherFX4
│ │ │ └ TelOtherFX5
│ │ ├ Templar
│ │ ├ ThrowingBomb
│ │ ├ ThrustFloor
│ │ │ ├ ThrustFloorDown
│ │ │ └ ThrustFloorUp
│ │ ├ TorchTree
│ │ │ └ ChexOrangeTree
│ │ ├ Tray
│ │ ├ TreeDestructible
│ │ ├ TreeStub
│ │ ├ Tub
│ │ ├ Unknown
│ │ │ └ SpeakerIcon
│ │ ├ Volcano
│ │ ├ VolcanoBlast
│ │ ├ VolcanoTBlast
│ │ ├ WaterBottle
│ │ ├ WaterDrip
│ │ ├ WaterDropOnFloor
│ │ ├ WaterfallSplash
│ │ ├ WaterFountain
│ │ ├ WaterSplash
│ │ ├ WaterSplashBase
│ │ ├ WaterZone
│ │ ├ Whirlwind
│ │ ├ Wizard
│ │ ├ WizardFX1
│ │ ├ WolfensteinSS
│ │ ├ WoodenBarrel
│ │ ├ Wraith
│ │ │ └ WraithBuried
│ │ ├ WraithFX1
│ │ ├ WraithFX2
│ │ ├ WraithFX3
│ │ ├ WraithFX4
│ │ │ └ WraithFX5
│ │ ├ WraithvergeDrop
│ │ ├ ZArmorChunk
│ │ ├ ZBannerTattered
│ │ ├ ZBarrel
│ │ ├ ZBell
│ │ ├ ZBlueCandle
│ │ ├ ZBucket
│ │ ├ ZCandle
│ │ ├ ZChainBit32
│ │ ├ ZChainBit64
│ │ ├ ZChainEndHeart
│ │ ├ ZChainEndHook1
│ │ ├ ZChainEndHook2
│ │ ├ ZChainEndSkull
│ │ ├ ZChainEndSpike
│ │ ├ ZChandelier
│ │ ├ ZChandelierUnlit
│ │ ├ ZCorpseHanging
│ │ ├ ZCorpseKabob
│ │ ├ ZCorpseLynched
│ │ ├ ZCorpseLynchedNoHeart
│ │ ├ ZCorpseSitting
│ │ ├ ZCorpseSleeping
│ │ ├ ZIronMaiden
│ │ ├ ZLog
│ │ ├ ZMossCeiling1
│ │ ├ ZMossCeiling2
│ │ ├ ZombieMan
│ │ │ ├ DeadZombieMan
│ │ │ ├ FlemoidusCommonus
│ │ │ └ StealthZombieMan
│ │ ├ ZombieSpawner
│ │ ├ ZRock1
│ │ ├ ZRock2
│ │ ├ ZRock3
│ │ ├ ZRock4
│ │ ├ ZRockBlack
│ │ ├ ZRockBrown1
│ │ ├ ZRockBrown2
│ │ ├ ZRubble1
│ │ ├ ZRubble2
│ │ ├ ZRubble3
│ │ ├ ZShroomLarge1
│ │ ├ ZShroomLarge2
│ │ ├ ZShroomLarge3
│ │ ├ ZShroomSmall1
│ │ ├ ZShroomSmall2
│ │ ├ ZShroomSmall3
│ │ ├ ZShroomSmall4
│ │ ├ ZShroomSmall5
│ │ ├ ZShrub1
│ │ ├ ZShrub2
│ │ ├ ZStalactiteIceLarge
│ │ ├ ZStalactiteIceMedium
│ │ ├ ZStalactiteIceSmall
│ │ ├ ZStalactiteIceTiny
│ │ ├ ZStalactiteLarge
│ │ ├ ZStalactiteMedium
│ │ ├ ZStalactiteSmall
│ │ ├ ZStalagmiteIceLarge
│ │ ├ ZStalagmiteIceMedium
│ │ ├ ZStalagmiteIceSmall
│ │ ├ ZStalagmiteIceTiny
│ │ ├ ZStalagmiteLarge
│ │ ├ ZStalagmiteMedium
│ │ ├ ZStalagmitePillar
│ │ ├ ZStalagmiteSmall
│ │ ├ ZStatueGargoyleBlueShort
│ │ ├ ZStatueGargoyleBlueTall
│ │ ├ ZStatueGargoyleDarkRedShort
│ │ ├ ZStatueGargoyleDarkRedTall
│ │ ├ ZStatueGargoyleGreenShort
│ │ ├ ZStatueGargoyleGreenTall
│ │ ├ ZStatueGargoyleRedShort
│ │ ├ ZStatueGargoyleRedTall
│ │ ├ ZStatueGargoyleRustShort
│ │ ├ ZStatueGargoyleRustTall
│ │ ├ ZStatueGargoyleStripeTall
│ │ ├ ZStatueGargoyleTanShort
│ │ ├ ZStatueGargoyleTanTall
│ │ ├ ZStumpBare
│ │ ├ ZStumpBurned
│ │ ├ ZStumpSwamp1
│ │ ├ ZStumpSwamp2
│ │ ├ ZSuitOfArmor
│ │ ├ ZSwampVine
│ │ ├ ZTombstoneBigCross
│ │ ├ ZTombstoneBrianP
│ │ ├ ZTombstoneBrianR
│ │ ├ ZTombstoneCrossCircle
│ │ ├ ZTombstoneRIP
│ │ ├ ZTombstoneShane
│ │ ├ ZTombstoneSmallCross
│ │ ├ ZTree
│ │ ├ ZTreeDead
│ │ ├ ZTreeGnarled1
│ │ ├ ZTreeGnarled2
│ │ ├ ZTreeLarge1
│ │ ├ ZTreeLarge2
│ │ ├ ZTreeSwamp120
│ │ ├ ZTreeSwamp150
│ │ ├ ZVasePillar
│ │ ├ ZWingedStatue
│ │ └ ZXmasTree
│ └ SectorEffect
│   ├ Lighting
│   └ Mover
│     ├ MovingCeiling
│     │ └ Ceiling
│     └ MovingFloor
│       └ Floor
└ ThinkerIterator
```

Structure List
--------------

Here is a full list of all structures in ZScript as of GZDoom 3.6.0. There are 70 structures total. Note that some of these are merely implementation details and should not be used in code.

```
Struct
├ Console
├ ConsoleEvent
├ CVar
├ DamageTypeDefinition
├ DehInfo
├ DropItem
├ DynArray_F32
├ DynArray_F64
├ DynArray_I16
├ DynArray_I32
├ DynArray_I8
├ DynArray_Obj
├ DynArray_Ptr
├ DynArray_String
├ F3DFloor
├ FCheckPosition
├ FColormap
├ FLineTraceData
├ Font
├ FOptionMenuSettings
├ FStateParamInfo
├ FTranslatedLineTarget
├ GameInfoStruct
├ GIFont
├ InputEvent
├ JoystickConfig
├ KeyBindings
├ LevelLocals
├ Line
├ LinkContext
├ LookExParams
├ MugShot
├ OptionValues
├ PatchInfo
├ PlayerClass
├ PlayerEvent
├ PlayerInfo
├ PlayerSkin
├ RenderEvent
├ ReplaceEvent
├ SavegameManager
├ SaveGameNode
├ SBarInfo
├ Screen
├ SecPlane
├ SecSpecial
├ Sector
├ SectorPortal
├ Shader
├ Side
├ State
├ StrifeDialogueNode
├ StrifeDialogueReply
├ StringStruct
├ StringTable
├ Team
├ TerrainDef
├ TexMan
├ TraceResults
├ Translation
├ UiEvent
├ UserCmd
├ Vertex
├ VisStyle
├ Wads
├ WBPlayerStruct
├ WBStartStruct
├ WeaponSlots
├ WorldEvent
└ _
```

<!-- EOF -->
