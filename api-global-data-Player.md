# Players

TODO

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

<!-- EOF -->
