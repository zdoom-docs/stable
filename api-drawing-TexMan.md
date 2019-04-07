# TexMan

The **Tex**ture **Man**ager is used for loading, finding, replacing and getting
information on textures.

```
struct TexMan
{
   static textureid CheckForTexture(string name, int usetype, int flags = TexMan.TryAny);
   static int       CheckRealHeight(textureid tex);
   static string    GetName(textureid tex);
   static vector2   GetScaledOffset(textureid tex);
   static vector2   GetScaledSize(textureid tex);
   static int, int  GetSize(textureid tex);
   static void      SetCameraToTexture(Actor viewpoint, string texture, double fov);
   static bool      OkForLocalization(textureid patch, string textSubstitute);

   deprecated("3.8") static void ReplaceTextures(string from, string to, int flags);
}
```

- `CheckForTexture`

   Returns a `textureid` for the texture named `name`. `usetype` may be one of
   the following, which selects what kind of texture to find:

   | Name                       | Description                                                                                       |
   | ----                       | -----------                                                                                       |
   | `TexMan.Type_Any`          | Any kind of texture.                                                                              |
   | `TexMan.Type_Autopage`     | Unused.                                                                                           |
   | `TexMan.Type_Build`        | Unused.                                                                                           |
   | `TexMan.Type_Decal`        | A decal pic defined in `DECALDEF`.                                                                |
   | `TexMan.Type_FirstDefined` | The first composite texture defined by the IWad.                                                  |
   | `TexMan.Type_Flat`         | A flat (ceiling/floor texture,) i.e. `FLOOR0_1`.                                                  |
   | `TexMan.Type_FontChar`     | Unused.                                                                                           |
   | `TexMan.Type_MiscPatch`    | A loose graphic, i.e. `M_DOOM`.                                                                   |
   | `TexMan.Type_Null`         | Reserved for the null graphic. Ignores `name`.                                                    |
   | `TexMan.Type_Override`     | Overridable generalized textures, for instance textures defined in `TX_START` or BUILD ART tiles. |
   | `TexMan.Type_SkinGraphic`  | Any loose graphic defined in `S_SKIN` i.e. statusbar faces.                                       |
   | `TexMan.Type_SkinSprite`   | Any sprite defined in `S_SKIN`.                                                                   |
   | `TexMan.Type_Sprite`       | A sprite in `S_START`, i.e. `MEDIA0`.                                                             |
   | `TexMan.Type_WallPatch`    | An uncomposited patch, i.e. `DOOR2_1`.                                                            |
   | `TexMan.Type_Wall`         | Any composited wall texture, i.e. `STARTAN2`.                                                     |

   `flags` may be any of the following combined (with the bitwise OR operator
   `|`:)

   | Name                   | Description                                                                               |
   | ----                   | -----------                                                                               |
   | `TexMan.AllowSkins`    | Allows `SkinGraphic`s to be returned under normal circumstances.                          |
   | `TexMan.DontCreate`    | Will never create a new texture when searching.                                           |
   | `TexMan.Localize`      | TODO                                          .                                           |
   | `TexMan.Overridable`   | Allows overriding of this texture by for instance `TEXTURES`.                             |
   | `TexMan.ReturnFirst`   | Allows returning the `FirstDefined` "null" texture under normal circumstances.            |
   | `TexMan.ShortNameOnly` | Will force use of a short name when searching.                                            |
   | `TexMan.TryAny`        | Returns any other type of texture if one is not found in the specified use type. Default. |

- `CheckRealHeight`

   Returns the height in pixels of the texture down to the last scanline which
   has actual pixel data. Note that this operation is extremely slow and should
   be used sparingly.

- `GetName`

   Returns the original name of a `textureid`.

- `GetScaledOffset`

   Returns the offsets for this texture used to display it (rather than the
   original offsets.)

- `GetScaledSize`

   Returns the size used to display this texture (rather than the physical
   size.)

- `GetSize`

   Returns the width and height of a `textureid`.

- `SetCameraToTexture`

   Sets the camera texture (as defined in `ANIMDEFS`) `texture` to the
   viewpoint of `viewpoint` with a fov of `fov`.

- `OkForLocalization`

   TODO

- `ReplaceTextures`

   Note: This function is deprecated and `LevelLocals::ReplaceTextures` should
   be used instead.

   Replaces textures named `from` with `to` within the map. `flags` may be used
   to filter out certain textures from being replaced:

   | Name                 | Description                          |
   | ----                 | -----------                          |
   | `TexMan.NOT_BOTTOM`  | Filters out linedef bottom textures. |
   | `TexMan.NOT_CEILING` | Filters out ceiling flats.           |
   | `TexMan.NOT_FLAT`    | Filters out any flat texture.        |
   | `TexMan.NOT_FLOOR`   | Filters out floor flats.             |
   | `TexMan.NOT_MIDDLE`  | Filters out linedef middle textures. |
   | `TexMan.NOT_TOP`     | Filters out linedef upper textures.  |
   | `TexMan.NOT_WALL`    | Filters out any linedef texture.     |

<!-- EOF -->
