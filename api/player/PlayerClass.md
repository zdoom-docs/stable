# PlayerClass

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

### `Flags`

Not currently implemented correctly, `PCF_NOMENU` does not exist in ZScript,
but its value is `1` if you need to check for that.

### `Skins`

Skin indices available to this player class.

### `Type`

The class type reference for this player class.

### `CheckSkin`

Checks if `skin` is in `Skins`.

### `EnumColorsets`

TODO

### `GetColorsetName`

TODO

<!-- EOF -->
