# Console

Basic access to console functionality.

```
struct Console
{
   static void HideConsole();
   static void MidPrint(Font font, string text, bool bold = false);
   static vararg void Printf(string fmt, ...);
}
```

- `HideConsole`

   Hides the console if it is open and `GameState` is not `GS_FULLCONSOLE`.

- `MidPrint`

   Prints `text` (possibly a `LANGUAGE` string if prefixed with `$`) in `font`
   to the middle of the screen for 1½ seconds. Will print even if the player is
   a spectator if `bold` is `true`. Uses the `msgmidcolor` CVar for non-bold
   messages and `msgmidcolor2` for bold messages.

   This is the function used internally by ACS' `Print` and `PrintBold`
   functions.

- `Printf`

   Prints a formatted string to the console.

<!-- EOF -->
