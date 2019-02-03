Table of Contents
=================

<!-- vim-markdown-toc GFM -->

* [Entry Points](#entry-points)
* [ACS](#acs)
* [Actors](#actors)
* [CVARINFO](#cvarinfo)
* [DECALDEF](#decaldef)
* [DECORATE](#decorate)
* [LOCKDEFS](#lockdefs)
* [GLDEFS](#gldefs)
* [KEYCONF](#keyconf)
* [MAPINFO](#mapinfo)
* [MENUDEF](#menudef)
* [TERRAIN](#terrain)

<!-- vim-markdown-toc -->

Entry Points
============

For backwards compatibility reasons and so as to not bloat the ZScript language
itself, many interactions with the engine are not defined in ZScript. This
section describes all ZScript interactions with the engine, both inside and
outside of ZScript itself.

ACS
===

ACS has several functions for interfacing with ZScript: `SetUserVariable`
(callfunc `24`,) `GetUserVariable` (callfunc `25`,) `SetUserArray` (callfunc
`28`,) `GetUserArray` (callfunc `29`) and `ScriptCall` (callfunc `210`.)

`GetUserVariable` may be used to get any `float` or `double` (converted to
fixed-point,) `name` or `string` (converted to ACS string,) `bool` (converted
to integer,) or integer (of any type including `enum`, converted to a 32-bit
signed integer) member of an `Actor`, by TID or by the script activator. The
member may be `native`, though it may not be `meta`. If the type is an `array`
or fixed-size array, the first element is used.

`SetUserVariable` follows the same rules as `GetUserVariable`, although
`native` variables may not be set. `name` is not handled.

`SetUserArray` and `GetUserArray` follow the same rules as `SetUserVariable`
and `GetUserVariable`, but the index of an array may be used. The variable does
not have to be an array if the index is `0`.

`ScriptCall` may be used to call any `static` function on any class. It cannot
call functions on `struct`s. If the first argument of the function is type
`Actor`, the activator is passed to this argument (or `null` if there is no
activator.) Each argument may be of type `int` (or its aliases,) `color` or
`bool` (converted from integer,) `double` (converted from fixed-point,) `name`,
`string` or `sound` (converted from ACS string.)

The function may have default arguments. The function may return zero or more
values, although more than one value will be ignored. The returned value may be
`int` (or one of its aliases,) `bool` or `color` (converted to integer,)
`double` (converted to fixed-point,) `name`, `sound` or `string` (converted to
ACS string.) If it is not one of these types, it will be ignored.

Actors
======

Actor classes can be replaced by the `replaces` class flag, which during
dynamic actor replacement will choose to spawn this class over its replaced
actor, unless the replaced actor is later replaced again by another class.
Dynamic actor replacement can also be overridden with an event handler's
`CheckReplacement` virtual function.

For example:

```
class MyActor : Actor replaces OtherActor {} // OtherActor will be dynamically replaced with MyActor
class MyOtherActor : Actor replaces OtherActor {} // OtherActor will now be replaced with MyOtherActor instead of MyActor
```

CVARINFO
========

Any CVars declared as a server CVar in `CVARINFO` or by the engine will be
accessible as a global variable in ZScript, which has a special type that can
be implicitly cast to the type of the CVar. They cannot be set this way, only
accessed.

DECALDEF
========

`DECALDEF` can set the decal generator for a specific `Actor` class with the
`generator` keyword. An actor can also define its generator and inherited
classes' generators with the `Decal` property.

DECORATE
========

TODO: lots of things to note here

LOCKDEFS
========

Key and lock groups in `LOCKDEFS` are defined as groups of `Inventory` or `Key`
descendants.

GLDEFS
======

Lights can be associated with `Actor` classes and frames in `GLDEFS`.

KEYCONF
=======

TODO: this can be used for custom buttons

MAPINFO
=======

In `MAPINFO`, the `GameInfo` block (referred to as `MAPINFO`/GameInfo in this
document) the following properties interact directly with ZScript:

- `EventHandlers` and `AddEventHandlers` override or add to the list of `StaticEventHandler` or `EventHandler` classes registered by the game (as opposed to event handlers registered per-map.)
- `MessageBoxClass` sets the `MessageBoxMenu` class to use for message boxes used by the engine's GUI.
- `PlayerClasses` and `AddPlayerClasses` override or add to the list of `PlayerPawn` classes the game provides.
- `PrecacheClasses` will pre-cache all sprites used by an `Actor` class. Note that this also works for `StateProvider` degenerates like `Weapon`.
- `StatScreen_CoOp` sets the `StatusScreen` class to use for co-op intermission screens.
- `StatScreen_DM` sets the `StatusScreen` class to use for Deathmatch intermission screens.
- `StatScreen_Single` sets the `StatusScreen` class to use for single-player intermission screens.
- `StatusBarClass` sets the status bar class used by the game to the provided `BaseStatusBar` class.
- `WeaponSlot` sets the game's default weapon slots to the provided `Weapon` classes.

TODO: there are other things here as well, like map event handlers

MENUDEF
=======

TODO: this directly uses ZScript classes

TERRAIN
=======

The `SmallSplash`, `SplashBase` and `SplashChunk` properties of `Splash` blocks
use `Actor`s.

<!-- EOF -->
