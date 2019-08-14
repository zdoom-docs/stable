# PatchInfo

Either a patch or string depending on external configurations.

```
struct PatchInfo play
{
   int       mColor;
   Font      mFont;
   textureid mPatch;

   void Init(GIFont gifont);
}
```

### `mColor`

The color of the font, if this is a string.

### `mFont`

The font, if this is a string, or `null`.

### `mPatch`

The patch, if this is a patch, or an invalid texture.

### `Init`

Initializes the structure. If `gifont.Color` is `'Null'`, and `gifont.FontName`
is a valid patch, `mPatch` will be set accordingly. Otherwise, if the font has
a color or the patch is invalid, `gifont.FontName` is used to set `mFont` (or
it is defaulted to `BigFont`.)

<!-- EOF -->
