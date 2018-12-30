# Side

Also known as a "sidedef." One of the textured sides of a line. Each sidedef has three portions: Upper, middle, and lower. The middle texture is special as it can have translucency.

The three portions of a sidedef can be referred to with:

| Name          | Description         |
| ----          | -----------         |
| `Side.Top`    | The upper portion.  |
| `Side.Mid`    | The middle portion. |
| `Side.Bottom` | The lower portion.  |

```
struct Side play
{
   readonly Line   Linedef;
   readonly Sector Sector;

   uint8 Flags;
   int16 Light;

   int Index();

   clearscope Vertex V1();
   clearscope Vertex V2();

   textureid GetTexture(int which);
   double    GetTextureXOffset(int which);
   double    GetTextureYOffset(int which);
   double    GetTextureXScale(int which);
   double    GetTextureYScale(int which);

   void SetTexture(int which, textureid tex);
   void SetTextureXOffset(int which, double offset);
   void SetTextureYOffset(int which, double offset);
   void SetTextureXScale(int which, double scale);
   void SetTextureYScale(int which, double scale);

   void AddTextureXOffset(int which, double delta);
   void AddTextureYOffset(int which, double delta);

   void MultiplyTextureXScale(int which, double delta);
   void MultiplyTextureYScale(int which, double delta);

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

- `Linedef`

   The line this side belongs to.

- `Sector`

   The sector this side belongs to.

- `Flags`

   Any combination of the following bit flags:

   | Name                   | Description                                                                 |
   | ----                   | -----------                                                                 |
   | `WALLF_ABSLIGHTING`    | Light is absolute instead of relative to the sector.                        |
   | `WALLF_CLIP_MIDTEX`    | Clips the middle texture when it goes under the floor or above the ceiling. |
   | `WALLF_LIGHT_FOG`      | The wall's lighting will ignore fog effects.                                |
   | `WALLF_NOAUTODECALS`   | Don't attach decals to this surface.                                        |
   | `WALLF_NOFAKECONTRAST` | Disables the "fake contrast" effect for this side.                          |
   | `WALLF_POLYOBJ`        | This sidedef belongs to a polyobject.                                       |
   | `WALLF_SMOOTHLIGHTING` | Applies a unique contrast at all angles.                                    |
   | `WALLF_WRAP_MIDTEX`    | Repeats the middle texture infinitely on the vertical axis.                 |

- `Light`

   The light level of this side. Relative to the sector lighting unless `WALLF_ABSLIGHTING`.

- `Index`

   Returns the index of this side.

- `V1`, `V2`

   Returns the start and end points of this sidedef, respectively.

- `GetTexture`, `SetTexture`

   Gets or sets the texture of one portion of the sidedef.

- `GetTextureXOffset`, `SetTextureXOffset`, `AddTextureXOffset`

   Gets, sets or adds to the texture portion's horizontal offset.

- `GetTextureYOffset`, `SetTextureYOffset`, `AddTextureYOffset`

   Gets, sets or adds to the texture portion's vertical offset.

- `GetTextureXScale`, `SetTextureXScale`, `MultiplyTextureXScale`

   Gets, sets or multiplies the texture portion's horizontal scale.

- `GetTextureYScale`, `SetTextureYScale`, `MultiplyTextureYScale`

   Gets, sets or multiplies the texture portion's vertical scale.

- `GetUDMFFloat`, `GetUDMFInt`, `GetUDMFString`

   Gets a named UDMF property attached to this sidedef.

<!-- EOF -->
