# LineIdIterator

Iterates over line indices with a specified tag.

```
class LineIdIterator : Object
{
	static LineIdIterator Create(int tag);

	int Next();
}
```

### `Create`

Creates a new iterator over lines with tag `tag`.

### `Next`

Returns the index of the current line and advances the iterator. Returns `-1`
when the list is exhausted.

<!-- EOF -->
