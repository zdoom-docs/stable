# Game

TODO

```
string G_SkillName();
int    G_SkillPropertyInt(int p);
double G_SkillPropertyFloat(int p);

vector3, int G_PickDeathmatchStart();
vector3, int G_PickPlayerStart(int pnum, int flags = 0);
```

- `G_SkillName`

   The name of the skill in play.

- `G_SkillPropertyInt`

   Returns a skill property. `p` may be:

   | Name                   |
   | ----                   |
   | `SKILLP_ACSReturn`     |
   | `SKILLP_AutoUseHealth` |
   | `SKILLP_DisableCheats` |
   | `SKILLP_EasyBossBrain` |
   | `SKILLP_EasyKey`       |
   | `SKILLP_FastMonsters`  |
   | `SKILLP_Infight`       |
   | `SKILLP_NoPain`        |
   | `SKILLP_PlayerRespawn` |
   | `SKILLP_RespawnLimit`  |
   | `SKILLP_Respawn`       |
   | `SKILLP_SlowMonsters`  |
   | `SKILLP_SpawnFilter`   |

- `G_SkillPropertyFloat`

   Returns a skill property. `p` may be:

   | Name                    |
   | ----                    |
   | `SKILLP_Aggressiveness` |
   | `SKILLP_AmmoFactor`     |
   | `SKILLP_ArmorFactor`    |
   | `SKILLP_DamageFactor`   |
   | `SKILLP_DropAmmoFactor` |
   | `SKILLP_FriendlyHealth` |
   | `SKILLP_HealthFactor`   |
   | `SKILLP_MonsterHealth`  |

- `G_PickDeathmatchStart`

   Returns the position and angle of a random death-match start location.

- `G_PickPlayerStart`

   Returns the position and angle of a player start for player `pnum`. `flags` may be:

   | Name                  | Description                                               |
   | ----                  | -----------                                               |
   | `PPS_FORCERANDOM`     | Always picks a random player spawn for this player.       |
   | `PPS_NOBLOCKINGCHECK` | Does not check if an object is blocking the player spawn. |

<!-- EOF -->
