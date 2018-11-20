Table of Contents
=================

<!-- vim-markdown-toc GFM -->

* [API](#api)
* [Type Symbols](#type-symbols)
   * [Integer types](#integer-types)
   * [Floating-point types](#floating-point-types)
* [Global Data](#global-data)
   * [Global Functions](#global-functions)
      * [Class Handling](#class-handling)
      * [Random Number Generation](#random-number-generation)
      * [Math](#math)
      * [Game](#game)
      * [Sound](#sound)
      * [System](#system)
   * [Global Variables](#global-variables)
      * [Static Info](#static-info)
      * [Game State](#game-state)
      * [Client](#client)
      * [Players](#players)
* [Types](#types)
   * [Built-in Types](#built-in-types)
      * [Array](#array)
      * [Color](#color)
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
   * [Globals](#globals)
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

<!-- vim-markdown-toc -->

API
===

The ZScript API is vast and has some holes which are hard to explain. Some parts are implemented in ways that don't make sense to user code, but are fine to the engine. Because of this, the API shall be documented in pseudo-ZScript which gives an idea of how it works for the modder rather than for the engine.

Type Symbols
============

Integer and floating-point types have symbols which can be accessed through `typename.name`. Here is a list of them.

## Integer types

- `Max`

   Maximum value of type.

- `Min`

   Minimum value of type.

## Floating-point types

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

Global Data
===========

Global Functions
----------------

### Class Handling

```
Type GetDefaultByType(TypeName);
Type New(class typename = ThisClass);
```

- `GetDefaultByType`

   Gets the default value of any built-in type.

- `New`

   Typically spelled lowercase (`new`), creates an object with type `typename`. Defaults to using the class of the calling object.

### Random Number Generation

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

### Math

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

### Game

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

### Sound

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

### System

```
uint MSTime();
vararg void ThrowAbortException(string format, ...);
```

- `MSTime`

   Returns the number of milliseconds since the engine was started. **Not deterministic.**

- `ThrowAbortException`

   Kills the VM and ends the game (without exiting) with a formatted error.

Global Variables
----------------

These variables are accessible in any context and are not bound by any specific object.

### Static Info

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

### Game State

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

### Client

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


### Players

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

Types
=====

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

   Called just before the object is collected by the garbage collector. **Not deterministic** unless the object is linked into the thinker list. Not all `Thinker`s are, so be careful when overriding this. Any `Actor` will generally be safe.

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

Globals
-------

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

<!-- EOF -->
