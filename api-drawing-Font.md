# Font

A font as defined in `FONTDEFS` or a bitmap font file. **Not serializable. Do not use as a member unless marked as `transient`.**

```
struct Font
{
   static Font FindFont(name fontname);
   static int  FindFontColor(name color);
   static Font GetFont(name fontname);

   double GetBottomAlignOffset(int code);
   int    GetCharWidth(int code);
   string GetCursor();
   int    GetHeight();
   int    StringWidth(string code);

   BrokenLines BreakLines(string text, int maxlen);
}
```

- `FindFont`

   Gets a font as defined in `FONTDEFS`.

- `FindFontColor`

   Returns the color range enumeration for a named color.

- `GetFont`

   Gets a font either as defined in `FONTDEFS` or a ZDoom/bitmap font.

- `GetBottomAlignOffset`

   Returns the baseline for the character `code`.

- `GetCharWidth`

   Returns the width in pixels of a character code.

- `GetCursor`

   Returns the string used as a blinking cursor graphic for this font.

- `GetHeight`

   Returns the line height of the font.

- `StringWidth`

   Returns the width in pixels of the string.

- `BreakLines`

   Breaks `text` up into a `BrokenLines` structure according to the screen and clip region, as well as appropriately accounting for a maximum width in pixels of `maxlen`.

<!-- EOF -->
