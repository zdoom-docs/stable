# String

Strings have many methods attached to them for manipulating text.

```
struct String
{
   static vararg string Format(string format, ...);

   vararg void AppendFormat(string format, ...);

   string CharAt(int pos) const;
   int    CharCodeAt(int pos) const;
   string Filter();
   int    IndexOf(string substr, int startIndex = 0) const;
   string Left(int len) const;
   uint   Length() const;
   string Mid(int pos = 0, int len = int.Max) const;
   void   Remove(int index, int amount);
   void   Replace(string pattern, string replacement);
   int    RightIndexOf(string substr, int endIndex = int.Max) const;
   void   Split(out array<string> tokens, string delimiter, EmptyTokenType keepEmpty = TOK_KEEPEMPTY) const;
   double ToDouble() const;
   int    ToInt(int base = 0) const;
   void   ToLower();
   void   ToUpper();
   void   Truncate(int newlen);

   deprecated("3.5.1") int LastIndexOf(string substr, int endIndex = int.Max) const;
}
```

### `Format`

Creates a string using a format string and any amount of arguments.

### `AppendFormat`

Works like `Format`, but appends the result to the string.

### `CharAt`

Returns the character at `pos` as a new string.

### `CharCodeAt`

Returns the character at `pos` as an integer.

### `Filter`

Replaces escape sequences in a string with escaped characters as a new string.

### `IndexOf`

Returns the first index of `substr` starting from the left at `start`.

### `Left`

Returns the first `len` characters as a new string.

### `Length`

Returns the number of characters in this string.

### `Mid`

Returns `len` characters starting at `pos` as a new string.

### `Remove`

Removes `amount` characters starting at `index` in place.

### `Replace`

Replaces all instances of `pattern` with `replacement` in place.

### `RightIndexOf`

Returns the first index of `substr` starting from the right at `end`.

### `Split`

Splits the string by each `delimiter` into `tokens`. `keepEmpty` may be either
`TOK_SKIPEMPTY` (the default) or `TOK_KEEPEMPTY`, which will keep or discard
empty strings found while splitting.

### `ToDouble`

Interprets the string as a double precision floating point number.

### `ToInt`

Interprets the string as a base `base` integer, guessing the base if it is `0`.

### `ToLower`

Converts all characters in the string to lowercase in place.

### `ToUpper`

Converts all characters in the string to uppercase in place.

### `Truncate`

Truncates the string to `len` characters in place.

### `LastIndexOf`

Broken. Use `RightIndexOf` instead.

<!-- EOF -->
