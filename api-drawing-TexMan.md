# TexMan

The **Tex**ture **Man**ager is used for loading, finding, replacing and getting information on textures.

```
struct TexMan
{
   static textureid CheckForTexture(string name, int usetype, int flags = TexMan.TryAny);
   static int       CheckRealHeight(textureid tex);
   static string    GetName(textureid tex);
   static vector2   GetScaledOffset(textureid tex);
   static vector2   GetScaledSize(textureid tex);
   static int, int  GetSize(textureid tex);
   static void      ReplaceTextures(string from, string to, int flags);
   static void      SetCameraToTexture(Actor viewpoint, string texture, double fov);
}
```

- `CheckForTexture`

   Returns a `textureid` for the texture named `name`. `usetype` may be one of the following, which selects what kind of texture to find:

   | Name                       | Description                                                   |
   | ----                       | -----------                                                   |
   | `TexMan.Type_Any`          | Returns any kind of texture.                                  |
   | `TexMan.Type_Autopage`     | Returns an auto-map background graphic. (TODO: needs example) |
   | `TexMan.Type_Build`        | Returns a tile from a BUILD TILES entry.                      |
   | `TexMan.Type_Decal`        | Unknown. (TODO)                                               |
   | `TexMan.Type_FirstDefined` | Unknown. (TODO)                                               |
   | `TexMan.Type_Flat`         | Returns any flat, i.e. `FLOOR0_1`.                            |
   | `TexMan.Type_FontChar`     | Unknown. (TODO)                                               |
   | `TexMan.Type_MiscPatch`    | Unknown. (TODO)                                               |
   | `TexMan.Type_Null`         | Returns the null graphic. Ignores `name`.                     |
   | `TexMan.Type_Override`     | Unknown. (TODO)                                               |
   | `TexMan.Type_SkinGraphic`  | Unknown. (TODO)                                               |
   | `TexMan.Type_SkinSprite`   | Unknown. (TODO)                                               |
   | `TexMan.Type_Sprite`       | Returns a sprite, i.e. `MEDIA0`.                              |
   | `TexMan.Type_WallPatch`    | Returns an uncomposited patch, i.e. `DOOR2_1`.                |
   | `TexMan.Type_Wall`         | Returns any composited wall texture, i.e. `STARTAN2`.         |

   `flags` may be any of the following combined (with the bitwise OR operator `|`:)

   | Name                   | Description                                     |
   | ----                   | -----------                                     |
   | `TexMan.AllowSkins`    | Unknown. (TODO)                                 |
   | `TexMan.DontCreate`    | Will never create a new texture when searching. |
   | `TexMan.Overridable`   | Unknown. (TODO)                                 |
   | `TexMan.ReturnFirst`   | Unknown. (TODO)                                 |
   | `TexMan.ShortNameOnly` | Will force use of a short name when searching.  |
   | `TexMan.TryAny`        | Default. Unknown. (TODO)                        |

- `CheckRealHeight`

   TODO

- `GetName`

   Returns the original name of a `textureid`.

- `GetScaledOffset`

   TODO

- `GetScaledSize`

   TODO

- `GetSize`

   Returns the width and height of a `textureid`.

- `ReplaceTextures`

   Replaces textures named `from` with `to` within the map. `flags` may be used to filter out certain textures from being replaced:

   | Name                 | Description                          |
   | ----                 | -----------                          |
   | `TexMan.NOT_BOTTOM`  | Filters out linedef bottom textures. |
   | `TexMan.NOT_CEILING` | Filters out ceiling flats.           |
   | `TexMan.NOT_FLAT`    | Filters out any flat texture.        |
   | `TexMan.NOT_FLOOR`   | Filters out floor flats.             |
   | `TexMan.NOT_MIDDLE`  | Filters out linedef middle textures. |
   | `TexMan.NOT_TOP`     | Filters out linedef upper textures.  |
   | `TexMan.NOT_WALL`    | Filters out any linedef texture.     |

- `SetCameraToTexture`

   Sets the camera texture (as defined in `ANIMDEFS`) `texture` to the viewpoint of `viewpoint` with a fov of `fov`.

<!-- EOF -->
