# WBStartStruct

Information passed into the `StatusScreen` class when an intermission starts.

```
struct WBStartStruct
{
	WBPlayerStruct Plyr[MAXPLAYERS];
	int            PNum;

	int Finished_Ep;
	int Next_Ep;

	string Current;
	string Next;
	string NextName;

	textureid LName0;
	textureid LName1;

	int MaxFrags;
	int MaxItems;
	int MaxKills;
	int MaxSecret;

	int ParTime;
	int SuckTime;
	int TotalTime;
}
```

### `Plyr`

The `WBPlayerStruct` for each player.

### `PNum`

The index of the player to show stats for.

### `Finished_Ep`

The cluster of the finished map, minus one.

### `Next_Ep`

The cluster of the next map, minus one.

### `Current`

The name of the map that was finished.

### `Next`

The name of the next map.

### `NextName`

The printable name of the next map.

### `LName0`

Texture ID of the level name of the map that was finished.

### `LName1`

Texture ID of the level name of the map being entered.

### `MaxFrags`

Unknown purpose, not actually used by any part of the engine.

### `MaxItems`

The maximum number of acquired items in the map.

### `MaxKills`

The maximum number of killed monsters in the map.

### `MaxSecret`

The maximum number of found secrets in the map.

### `ParTime`

The par time of the map, in ticks.

### `SuckTime`

The suck time of the map, in minutes.

### `TotalTime`

The total time for the whole game, in ticks.

<!-- EOF -->
