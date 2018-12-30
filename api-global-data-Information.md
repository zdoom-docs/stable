# Static Info

TODO

```
readonly array<class<Actor>> AllActorClasses;
readonly array<PlayerClass>  PlayerClasses;
readonly array<PlayerSkin>   PlayerSkins;
readonly array<Team>         Teams;

play     DEHInfo             DEH;
readonly GameInfoStruct      GameInfo;
readonly FOptionMenuSettings OptionMenuSettings;
readonly textureid           SkyFlatNum;
readonly Weapon              WP_NOCHANGE;
```

- `AllActorClasses`

   As the name implies, an array of every actor class type reference.

- `PlayerClasses`

   An array of all player classes as defined in `MAPINFO`/GameInfo and `KEYCONF`.

- `PlayerSkins`

   An array of all player skins as defined in `SKININFO` and `S_SKIN`.

- `Teams`

   An array of all teams. Maximum index is `Team.Max`.

- `DEH`

   Static DeHackEd information.

- `GameInfo`

   Static information from `MAPINFO`/GameInfo.

- `OptionMenuSettings`

   Defaults for `OptionMenu`s as defined in `MENUDEF`'s `OptionMenuSettings` block and `MAPINFO`/GameInfo.

- `SkyFlatNum`

   The texture ID for sky flats. `F_SKY1` by default in Doom.

- `WP_NOCHANGE`

   A constant denoting that the weapon the player is currently holding shouldn't be switched from.

<!-- EOF -->
