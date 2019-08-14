# Thinker

A class representing any object in the game that runs logic every game tick,
i.e., "thinks." Most classes derive from `Thinker`, directly or indirectly.

All thinkers are grouped by their "stat" number, or "statnum," which specifies
the ordering of which thinkers are run, first to last. There are 127 stat
numbers total, 20 of which are not used by the engine and may be used for any
purpose.

The user-defined stat numbers begin at `Thinker.STAT_USER` and end at
`Thinker.STAT_USER_MAX`. Do not attempt to use normal integers as stat numbers
except as relative to these two.

<!--
	NOTE: These tables are not alphabetically organized as their ordering is
	      meaningful.
-->

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
class Thinker : Object play
{
   const TICRATE;

   LevelLocals Level;

   void ChangeStatNum(int stat);

   virtual void PostBeginPlay();
   virtual void Tick();

   static clearscope int Tics2Seconds(int tics);
}
```

### `TICRATE`

The number of game ticks in a second. This value is always `int(35)`.

### `Level`

The level this `Thinker` is in, which may differ from another one's.

### `ChangeStatNum`

Changes the statnum of this `Thinker`.

### `PostBeginPlay`

Called at the very end of this Thinker's initialization.

### `Tick`

Called every game tick. The order between this thinker's `Tick` and every other
thinker in the same statnum is unspecified.

### `Tics2Seconds`

Roughly converts a number of tics to an integral amount of seconds. Equivalent
to `tics / TICRATE`.

<!-- EOF -->
