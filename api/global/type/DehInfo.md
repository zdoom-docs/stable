# DehInfo

Static DeHackEd information.

```
struct DehInfo
{
   readonly int    BfgCells;
   readonly int    BlueAC;
   readonly double ExplosionAlpha;
   readonly uint8  ExplosionStyle;
   readonly int    MaxHealth;
   readonly int    MaxSoulsphere;
   readonly int    NoAutofreeze;
}
```

### `BfgCells`

The amount of ammunition `A_FireBfg` will deplete. Default is 40.

### `BlueAC`

Multiple of 100 for `BlueArmor`'s `Armor.SaveAmount`. Default is 2 for 200
armor.

### `ExplosionAlpha`

For actors with the `DEHEXPLOSION` flag, the alpha to set the actor to on
explosion.

### `ExplosionStyle`

For actors with the `DEHEXPLOSION` flag, the render style to be applied on
explosion.

### `MaxHealth`

TODO

### `MaxSoulsphere`

The `Inventory.MaxAmount` for `Soulsphere`. Default is 200.

### `NoAutofreeze`

Overrides generic freezing deaths if not zero, making all actors act as if they
had the `NOICEDEATH` flag.

<!-- EOF -->
