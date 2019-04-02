# PSprite

A **P**layer **Sprite**, paradoxically, is not the player themself, but the
sprite *within their view*, such as their weapon. PSprites are arbitrarily
layered by number, somewhat similar to `HUDMessage`s. They are drawn ordered
from lowest to highest.

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
class PSprite : Object play
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

   The offset from the weapon's normal resting position on the vertical axis.
   Note that `32` is the real resting position because of `A_Raise`.

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

<!-- EOF -->
