# Concepts

<!-- vim-markdown-toc GFM -->

* [Action Scoping](#action-scoping)
* [Object Scoping](#object-scoping)
* [Format String](#format-string)
* [Sprite](#sprite)
* [Game Tick](#game-tick)
* [Interpolation](#interpolation)

<!-- vim-markdown-toc -->

Here is a cursory view of concepts vital to ZScript and ZDoom in general. If
you can't find something here, it's likely inherited directly from Doom, so you
should check [the Doom Wiki][1] for more relevant information.

[1]: https://doomwiki.org/wiki/Entryway

## Action Scoping

On classes derived from Actor, states and methods can be scoped to a certain
subset of uses. This is mainly to differentiate actions which take place in
inventory items and weapons, and actions which take place in the actual game
map, for disambiguating the `self` pointer usage. The available scopes are:

| Name      | Description                                   |
| ----      | -----------                                   |
| `actor`   | Actions are called from an actual map object. |
| `item`    | Actions are called from an inventory item.    |
| `overlay` | Actions are called from a weapon overlay.     |
| `weapon`  | Actions are called from a weapon.             |

These can be defined either in the `states` block header as-is, or in `Actor`'s
`DefaultStateUsage` property with the following bit flags:

| Name          | Scope     |
| ----          | -----     |
| `SUF_ACTOR`   | `actor`   |
| `SUF_ITEM`    | `item`    |
| `SUF_OVERLAY` | `overlay` |
| `SUF_WEAPON`  | `weapon`  |

## Object Scoping

Most objects are subject to object scoping, which restricts the way data can be
used in certain contexts. This is to ensure that the game simulation does not
get changed by the UI, for instance, or that the game simulation doesn't read
from the UI and break network synchronization. In other words, it is to prevent
a multitude of errors that arise when data is modified or read from the wrong
places.

There are three scopes in ZScript: Play, UI, and Data (also known as
"`clearscope`.") The Play scope is used for objects that are part of the game
simulation and interact with the world in some way or another, while the UI
scope is for objects that have no correlation with the world besides perhaps
reading information from it. The Data scope is shared between the two, and must
be used carefully.

Here is a chart of data access possibilities for each scope:

|                   | Data scope | Play scope | UI scope   |
| -                 | ---------- | ---------- | ---------- |
| From Data context | Read/write | Read-only  | No access  |
| From Play context | Read/write | Read/write | No access  |
| From UI context   | Read/write | Read-only  | Read/write |

## Format String

A format string is a string that specifies the format of a conversion from
arbitrary data to a contiguous character string. A format string contains
normal characters and *conversion specifiers*. See [this page][2] for more
information. Differences between C's `printf` and ZScript formats include:

- Since there's no `char` type, `int` is used for `%c`.
- `%s` also works for `name`.
- No `%n` specifier.
- An additional conversion specifier `%B` exists which converts a number to
binary.
- An additional conversion specifier `%H` exists which works like `%g` but
automatically selects the smallest appropriate precision.

[2]: https://en.cppreference.com/w/c/io/fprintf

## Sprite

A sprite is stored in two numbers: the *sprite ID* (represented by the
`spriteid` type or sometimes `int`) and the *sprite frame* (represented by an
`int` or `uint8` usually.) The rotation is generally irrelevant as only the `0`
(front rotation) frame is used in most contexts. The sprite frame is, unlike
the file and state block representations, not a character, but an integer. The
number `0` for instance represents the letter `A`, `1` to `B`, etc.

For more information on sprites and rotations, please refer to [the relevant
Doom Wiki article][3].

[3]: https://doomwiki.org/wiki/Sprite

## Game Tick

The Doom engine, as long as it has existed and into every faithful-enough port
of it, no matter how different from the source material, runs the game
simulation in the same way:

- Input events are processed.

   Keyboard, mouse, gamepad, etc. if a local player, the demo file if watching
   a demo, packets over the internet in networked games.

- The game is *ticked*.

   Every 1/35th of a second that passes, a new "game tick" takes place, also
   referred to as *gametic*, *tick* or simply *tic*.

- The game is rendered.

   All information from the *current* game tick is rendered. This usually
   happens more often than the game is actually ticked. In ZDoom, Eternity
   Engine, and some other ports, the information is interpolated between the
   last and current game tick when there is extra time available to give
   smoother rendering.

For more information on ticks, please refer to [the relevant Doom Wiki
article][4].

[4]: https://doomwiki.org/wiki/Tic

## Interpolation

TODO

<!-- EOF -->
