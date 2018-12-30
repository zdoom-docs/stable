# StringTable

The localized string table as defined by `LANGUAGE`.

```
struct StringTable
{
   static string Localize(string val, bool prefixed = true);
}
```

- `Localize`

   Returns the localized variant of `val`. If `prefixed` is `true`, the string is returned as-is unless it is prefixed with `$` where the `$` character itself is ignored. **Not deterministic** unless there is only one variant of `val`. This is generally fine because this should only be used for visual strings anyway.

<!-- EOF -->
