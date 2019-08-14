# Game

TODO

```
string G_SkillName();
int    G_SkillPropertyInt(int p);
double G_SkillPropertyFloat(int p);

deprecated("3.8") vector3, int G_PickDeathmatchStart();
deprecated("3.8") vector3, int G_PickPlayerStart(int pnum, int flags = 0);
```

### `G_SkillName`

The name of the skill in play.

### `G_SkillPropertyInt`

Returns a skill property. `p` may be:

| Name                   |
| ----                   |
| `SKILLP_ACSRETURN`     |
| `SKILLP_AUTOUSEHEALTH` |
| `SKILLP_DISABLECHEATS` |
| `SKILLP_EASYBOSSBRAIN` |
| `SKILLP_EASYKEY`       |
| `SKILLP_FASTMONSTERS`  |
| `SKILLP_INFIGHT`       |
| `SKILLP_NOPAIN`        |
| `SKILLP_PLAYERRESPAWN` |
| `SKILLP_RESPAWNLIMIT`  |
| `SKILLP_RESPAWN`       |
| `SKILLP_SLOWMONSTERS`  |
| `SKILLP_SPAWNFILTER`   |

### `G_SkillPropertyFloat`

Returns a skill property. `p` may be:

| Name                    |
| ----                    |
| `SKILLP_AGGRESSIVENESS` |
| `SKILLP_AMMOFACTOR`     |
| `SKILLP_ARMORFACTOR`    |
| `SKILLP_DAMAGEFACTOR`   |
| `SKILLP_DROPAMMOFACTOR` |
| `SKILLP_FRIENDLYHEALTH` |
| `SKILLP_HEALTHFACTOR`   |
| `SKILLP_MONSTERHEALTH`  |
| `SKILLP_KICKBACKFACTOR` |

### `G_PickDeathmatchStart`

Note: This function is deprecated and `LevelLocals::PickDeathmatchStart` should
be used instead.

Returns the position and angle of a random death-match start location.

### `G_PickPlayerStart`

Note: This function is deprecated and `LevelLocals::PickPlayerStart` should be
used instead.

Returns the position and angle of a player start for player `pnum`. `flags` may
be:

| Name                  | Description                                               |
| ----                  | -----------                                               |
| `PPS_FORCERANDOM`     | Always picks a random player spawn for this player.       |
| `PPS_NOBLOCKINGCHECK` | Does not check if an object is blocking the player spawn. |

<!-- EOF -->
