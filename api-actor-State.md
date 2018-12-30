# State

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

   readonly bool bCANRAISE;
   readonly bool bDEHACKED;
   readonly bool bFAST;
   readonly bool bFULLBRIGHT;
   readonly bool bNODELAY;
   readonly bool bSAMEFRAME;
   readonly bool bSLOW;

   int  DistanceTo(State other);
   bool InStateSequence(State base);
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
- `Misc2`

   Primarily used in DeHackEd compatibility. Don't use this.

- `TicRange`

   The maximum amount of tics to add for random tic durations, or `0` if the duration is not random. For example, `TNT1 A random(5, 7)` would have a `Tics` value of `5` and a `TicRange` of `2`.

- `UseFlags`

   The scope of this state. See *Action Scoping*. Can have any of the `DefaultStateUsage` flags.

- `bCANRAISE`

   State has the `CANRAISE` flag, allowing `A_VileChase` to target this actor for healing without entering an infinitely long state.

- `bDEHACKED`

   `true` if the state has been modified by DeHackEd.

- `bFAST`

   State has the `FAST` flag, halving the duration when fast monsters is enabled.

- `bFULLBRIGHT`

   State has the `BRIGHT` flag, making it fully bright regardless of other lighting conditions.

- `bNODELAY`

   State has the `NODELAY` flag, forcing the associated action function to be run if the actor is in its first tic.

- `bSAMEFRAME`

   `true` if the state's frame is to be kept from the last frame used, i.e., is `#`.

- `bSLOW`

   State has the `SLOW` flag, doubling the duration when slow monsters is enabled.

- `DistanceTo`

   Returns the offset between this state and `other` in the global frame table. Only works if both states are owned by the same actor.

- `InStateSequence`

   Returns `true` if this state is within a contiguous state sequence beginning with `base`.

- `ValidateSpriteFrame`

   Returns `true` if the sprite frame actually exists.

- `GetSpriteTexture`

   Returns the texture, if the texture should be flipped horizontally, and scaling of this state's sprite. Scaling will return `scale` unless `skin` is nonzero. `skin` determines the player skin used.

<!-- EOF -->
