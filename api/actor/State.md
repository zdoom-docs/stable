# State

Represents a state on an `Actor` or `StateProvider`. Data in `State` is
read-only and is copied as needed to its respective locations for modification,
as it is merely a look into the global constant state table.

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

   readonly bool bCanRaise;
   readonly bool bDeHackEd;
   readonly bool bFast;
   readonly bool bFullBright;
   readonly bool bNoDelay;
   readonly bool bSameFrame;
   readonly bool bSlow;

   int  DistanceTo(State other);
   bool InStateSequence(State base);
   bool ValidateSpriteFrame();

   textureid, bool, vector2 GetSpriteTexture(int rotation, int skin = 0, vector2 scale = (0, 0));
}
```

### `Frame`

The sprite frame of this state.

### `NextState`

A pointer to the next state in the global state table.

### `Sprite`

The sprite ID of this state.

### `Tics`

The number of game ticks this state lasts.

### `Misc1`, `Misc2`

Primarily used in DeHackEd compatibility. Don't use this.

### `TicRange`

The maximum amount of tics to add for random tic durations, or `0` if the
duration is not random. For example, `TNT1 A random(5, 7)` would have a `Tics`
value of `5` and a `TicRange` of `2`.

### `UseFlags`

The scope of this state. See *Action Scoping*. Can have any of the
`DefaultStateUsage` flags.

### `bCanRaise`

State has the `CanRaise` flag, allowing `A_VileChase` to target this actor for
healing without entering an infinitely long state.

### `bDeHackEd`

`true` if the state has been modified by DeHackEd.

### `bFast`

State has the `Fast` flag, halving the duration when fast monsters is enabled.

### `bFullBright`

State has the `Bright` flag, making it fully bright regardless of other
lighting conditions.

### `bNoDelay`

State has the `NoDelay` flag, forcing the associated action function to be run
if the actor is in its first tic.

### `bSameFrame`

`true` if the state's frame is to be kept from the last frame used, i.e., is
`#`.

### `bSlow`

State has the `Slow` flag, doubling the duration when slow monsters is enabled.

### `DistanceTo`

Returns the offset between this state and `other` in the global frame table.
Only works if both states are owned by the same actor.

### `InStateSequence`

Returns `true` if this state is within a contiguous state sequence beginning
with `base`.

### `ValidateSpriteFrame`

Returns `true` if the sprite frame actually exists.

### `GetSpriteTexture`

Returns the texture, if the texture should be flipped horizontally, and scaling
of this state's sprite. Scaling will return `scale` unless `skin` is nonzero.
`skin` determines the player skin used.

<!-- EOF -->
