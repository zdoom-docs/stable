# Array

While ZScript does not have proper user-facing generics, `Array` is one such
type that does have a (hard-coded) type parameter. It mirrors the internal
`TArray` type exactly. Note that all Object types monomorphize to the same
implementation and structures cannot be stored in arrays due to no polymorphic
variant of `TArray` existing in the engine.

```
struct Array<Type>
{
	uint Max() const;
	uint Size() const;

	void Append(array<Type> other);
	void Copy(array<Type> other);
	void Move(array<Type> other);

	void Clear();
	void Delete(uint index, int deletecount = 1);
	bool Pop();

	uint Find(Type item) const;
	void Grow(uint amount);
	void Insert(uint index, Type item);
	uint Push(Type item);
	uint Reserve(uint amount);
	void Resize(uint amount);
	void ShrinkToFit();
}
```

### `Max`

Returns the amount of allocated objects in the array.

### `Size`

Returns the amount of constructed objects in the array.

### `Clear`

Clears out the entire array, possibly destroying all objects in it.

### `Delete`

Removes `count` objects starting at `index`, possibly destroying them. Moves
objects after `index + count` to the left.

### `Pop`

Removes the last item in the array, possibly destroying it. Returns `false` if
there are no items in the array to begin with.

### `Append`

Value-copies another array's contents and places them into this array at the
end.

### `Copy`

Value-copies another array's contents into this array. The contents of `other`
are preserved. This operation can be extremely taxing in some cases.

### `Move`

Moves another array's contents into this array. The contents of `other` are
left indeterminate and shall not be used. This operation is extremely fast
as it only copies pointers but must be used carefully to avoid error.

### `Find`

Finds the index of `item` in the array, or `Size` if it couldn't be found.

### `Grow`

Ensures the array can hold at least `amount` new members, growing the allocated
object amount if necessary.

### `Insert`

Inserts `item` at `index`. Moves objects after `index` to the right.

### `Push`

Places `item` at the end of the array, calling `Grow` if necessary.

### `Reserve`

Adds `amount` new empty-constructed objects at the end of the array, increasing
`Size` and calling `Grow` if necessary. Value types are initialized to zero and
reference types to `null`.

### `Resize`

Adds or removes objects based on `amount`. If it is less than `Size` then
objects are destroyed, if it is more then objects are empty-constructed. New
objects follow the same initialization rules as `Reserve`.

### `ShrinkToFit`

Shrinks `Max` to `Size`. Does not mutate any objects in the array.

<!-- EOF -->
