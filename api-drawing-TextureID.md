# TextureID

Texture IDs can be explicitly converted to integers, but not the other way around. You can add and subtract integers with a `textureid`, however. (This only works with the integer on the right hand side.)

```
struct TextureID
{
   bool Exists() const;
   bool IsNull() const;
   bool IsValid() const;
   void SetInvalid();
   void SetNull();
}
```

- `Exists`

   Checks if the texture exists within the texture manager at all.

- `IsNull`

   Checks if the texture is the null index (`0`.)

- `IsValid`

   Checks if the texture index is not the invalid index (`-1`.)

- `SetInvalid`

   Sets the texture index to `-1`.

- `SetNull`

   Sets the texture index to `0`.

   The proper way to zero-initialize a `textureid` is:

   ```
   textureid tex;
   tex.SetNull();
   ```

<!-- EOF -->
