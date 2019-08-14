# Game State

TODO

```
readonly bool           AutomapActive;
readonly bool           DemoPlayback;
readonly uint           GameAction;
readonly int            GameState;
readonly int            GameTic;
play     LevelLocals    Level;
readonly MusPlayingInfo MusPlaying;

deprecated("3.8") readonly bool GlobalFreeze;
int ValidCount;
```

### `AutomapActive`

`true` if the auto-map is currently open on the client. **Not deterministic.**

### `DemoPlayback`

User is watching a demo.

### `GameAction`

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

### `GameState`

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

### `GameTic`

Number of game tics passed since engine initialization. **Not deterministic.**

### `Level`

All level info as defined in `LevelLocals`.

### `MusPlaying`

TODO

### `GlobalFreeze`

Deprecated. Don't use.

### `ValidCount`

Don't use this.

<!-- EOF -->
