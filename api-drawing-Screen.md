# Screen

Functions for drawing various things to the screen.

Note: There are no longer any fully paletted renderers in GZDoom as of version 3.5. Alternate palette index parameters are generally ignored now.

```
struct Screen
{
   static vararg void DrawChar(Font font, int normalcolor, double x, double y, int character, ...);
   static vararg void DrawShape(textureid tex, bool animate, Shape2D s, ...);
   static vararg void DrawText(Font font, int normalcolor, double x, double y, string text, ...);
   static vararg void DrawTexture(textureid tex, bool animate, double x, double y, ...);

   static void Clear(int left, int top, int right, int bottom, color cr, int palcolor = -1);
   static void Dim(color cr, double amount, int x, int y, int w, int h);
   static void DrawFrame(int x, int y, int w, int h);
   static void DrawLine(int x0, int y0, int x1, int y1, color cr, int alpha = 255);
   static void DrawThickLine(int x0, int y0, int x1, int y1, double thickness, color cr, int alpha = 255);

   static double GetAspectRatio();
   static int GetHeight();
   static int GetWidth();
   static color PaletteColor(int index);
   static vector2, vector2 VirtualToRealCoords(vector2 pos, vector2 size, vector2 vsize, bool vbottom = false, bool handleaspect = true);

   static void ClearClipRect();
   static int, int, int, int GetClipRect();
   static int, int, int, int GetViewWindow();
   static void SetClipRect(int x, int y, int w, int h);
}
```

- `DrawChar`

   TODO

- `DrawShape`

   TODO

- `DrawText`

   TODO

- `DrawTexture`

   TODO

- `Clear`

   Draws a rectangle from `top left` to `bottom right` in screen coordinates of `cr` color. Does not support translucent colors. `palcolor` is a palette index to use as a color in paletted renderers or `-1` for automatic conversion from the given RGB color.

- `Dim`

   Draws a rectangle at `x y` of `w h` size in screen coordinates of `cr` color. Does not support translucent colors, but `amount` may be used to specify the translucency in a range of 0-1 inclusive.

- `DrawFrame`

   Draws a frame around a rectangle at `x y` of `w h` size in screen coordinates, using the border graphics as defined in `MAPINFO`/GameInfo.

- `DrawLine`

   Draws a one pixel wide line from `x0 y0` to `x1 y1` in screen coordinates of color `cr` with alpha `alpha` (range 0-255.)

- `DrawThickLine`

   Draws a `thickness` pixel wide line from `x0 y0` to `x1 y1` in screen coordinates of color `cr` with alpha `alpha` (range 0-255.)

- `GetAspectRatio`

   Returns the aspect ratio of the screen.

- `GetHeight`

   Returns the height of the screen.

- `GetWidth`

   Returns the width of the screen.

- `PaletteColor`

   Returns a `color` for a given palette index.

- `VirtualToRealCoords`

   TODO

- `ClearClipRect`

   Clears the clipping rectangle if there is one.

- `GetClipRect`

   Returns the clipping rectangle's `x`/`y`/`w`/`h`.

- `GetViewWindow`

   Returns the 3D viewing window, which may be smaller than the screen size with any given `screenblocks` setting.

- `SetClipRect`

   Sets the clipping rectangle to restrict further drawing to the region starting at `x y` of size `w h` in screen coordinates.

<!-- EOF -->
