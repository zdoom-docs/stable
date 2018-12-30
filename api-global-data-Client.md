# Client

TODO

```
KeyBindings AutomapBindings;
KeyBindings Bindings;

readonly Font BigFont;
readonly int  CleanHeight;
readonly int  CleanHeight_1;
readonly int  CleanWidth;
readonly int  CleanWidth_1;
readonly int  CleanXFac;
readonly int  CleanXFac_1;
readonly int  CleanYFac;
readonly int  CleanYFac_1;
readonly Font ConFont;
readonly Font IntermissionFont;
readonly Font SmallFont;
readonly Font SmallFont2;

ui float         BackbuttonAlpha;
ui int           BackbuttonTime;
ui int           MenuActive;
ui BaseStatusBar StatusBar;

int LocalViewPitch;
```

- `AutomapBindings`

   TODO

- `Bindings`

   TODO

- `BigFont`

   The `bigfont` for the current game.

- `CleanHeight`

   The current screen height divided by `CleanYFac`. **Not deterministic.**

- `CleanHeight_1`

   The current screen height divided by `CleanYFac_1`. **Not deterministic.**

- `CleanWidth`

   The current screen width divided by `CleanXFac`. **Not deterministic.**

- `CleanWidth_1`

   The current screen width divided by `CleanYFac_1`. **Not deterministic.**

- `CleanXFac`

   Integral scaling factor for horizontal positions to scale from 320x200 to the current virtual resolution. **Not deterministic.**

- `CleanXFac_1`

   Integral scaling factor for horizontal positions to scale from 320x200 to the current virtual resolution, accounting for aspect ratio differences. **Not deterministic.**

- `CleanYFac`

   Integral scaling factor for vertical positions to scale from 320x200 to the current virtual resolution. **Not deterministic.**

- `CleanYFac_1`

   Integral scaling factor for vertical positions to scale from 320x200 to the current virtual resolution, accounting for aspect ratio differences. **Not deterministic.**

- `ConFont`

   The console font.

- `IntermissionFont`

   The font used in intermission screens.

- `SmallFont`

   The `smallfnt` for the current game.

- `SmallFont2`

   The alternate `smallfnt`.

- `BackbuttonAlpha`

   Alpha of the back button in menus.

- `BackbuttonTime`

   The time until the back button starts fading out in menus.

- `MenuActive`

   The current active menu state. One of:

