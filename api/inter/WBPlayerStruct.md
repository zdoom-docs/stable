# WBPlayerStruct

Information for each individual player for a `StatusScreen`.

```
struct WBPlayerStruct
{
   int SItems;
   int SKills;
   int SSecret;
   int STime;

   int FragCount;
   int Frags[MAXPLAYERS];
}
```

### `SItems`

The number of items this player acquired.

### `SKills`

The number of monsters this player killed.

### `SSecret`

The number of secrets this player found.

### `STime`

The time this player finished the level at, in ticks. (This is the same for all
players.)

### `FragCount`

The total amount of frags this player scored against all players.

### `Frags`

The number of frags this player scored against each other player.

<!-- EOF -->
