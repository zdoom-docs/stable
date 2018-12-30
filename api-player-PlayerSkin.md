# PlayerSkin

A player skin as defined in `SKININFO` or `S_SKIN`.

```
struct PlayerSkin
{
   int     CrouchSprite;
   string  Face;
   uint8   Gender;
   int     NameSpc;
   bool    OtherGame;
   uint8   Range0End;
   uint8   Range0Start;
   vector2 Scale;
   string  SkinName;
   int     Sprite;
}
```

- `CrouchSprite`

   The crouching sprite ID for this skin.

- `Face`

   Prefix for statusbar face graphics.

- `Gender`

   Default gender of the skin. May be one of the following:

   | Name             | Value | Description                 |
   | ----             | :---: | -----------                 |
   | `GENDER_FEMALE`  | `1`   | Feminine.                   |
   | `GENDER_MALE`    | `0`   | Masculine.                  |
   | `GENDER_NEUTRAL` | `2`   | Neutral.                    |
   | `GENDER_OTHER`   | `3`   | Other (robot, zombie, etc.) |

- `NameSpc`

   If this skin was defined in S_SKIN, this is the lump ID of the marker itself.

- `OtherGame`

   The player skin is made for another game and needs to be color remapped differently.

- `Range0End`

   The end index of the translation range to be used for changing the player sprite's color.

- `Range0Start`

   The beginning index of the translation range to be used for changing the player sprite's color.

- `Scale`

   The scaling factor used for the player sprite.

- `SkinName`

   Name of the skin.

- `Sprite`

   The sprite ID for this skin.

<!-- EOF -->
