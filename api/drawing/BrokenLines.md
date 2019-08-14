# BrokenLines

A container representing an array of lines of text that have been broken up to
fit the screen and clipping region.

```
class BrokenLines : Object
{
   int    Count();
   string StringAt(int line);
   int    StringWidth(int line);
}
```

### `Count`

Returns the amount of lines in this container.

### `StringAt`

Returns the text of line `line`.

### `StringWidth`

Returns the width (in pixels) of line `line`.

<!-- EOF -->
