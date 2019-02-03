# FColorMap

Describes the coloring of a sector.

```
struct FColorMap
{
   uint8 BlendFactor;
   uint8 Desaturation;
   color FadeColor;
   color LightColor;
}
```

- `BlendFactor`

   TODO: "This is for handling Legacy-style color maps which use a different
   formula to calculate how the color affects lighting."

- `Desaturation`

   How much to desaturate colors in this sector. Range is 0 to 255, inclusive.

- `FadeColor`

   The color of fog in this sector. None if all components are 0.

- `LightColor`

   The color of the sector. Default if all components are 0.

<!-- EOF -->
