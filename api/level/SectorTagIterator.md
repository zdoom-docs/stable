# SectorTagIterator

Iterates over sector indices with a specified tag.

```
class SectorTagIterator : Object
{
   static SectorTagIterator Create(int tag, Line defline = null);

   int Next();
   int NextCompat(bool compat, int secnum);
}
```

- `Create`

   Creates a new iterator over sectors with tag `tag`. TODO: I can't find where
   `defline` is actually used. It is a mystery.

- `Next`

   Returns the index of the current sector and advances the iterator. Returns
   `-1` when the list is exhausted.

- `NextCompat`

    If `compat` is `false`, acts exactly as `Next`. Otherwise, returns the
    index of the current sector and advances the iterator in a manner
    compatible with Doom's stair builders.

<!-- EOF -->
