# Array

While ZScript does not have proper user-facing generics, `Array` is one such type that does have a type parameter. It mirrors the internal `TArray` type.

```
struct Array<Type>
{
   void Clear();
   void Copy(array<Type> other);
   void Delete(uint index, int deletecount = 1);
   uint Find(Type item) const;
   void Grow(uint amount);
   void Insert(uint index, Type item);
   uint Max() const;
   void Move(array<Type> other);
   bool Pop();
   uint Push(Type item);
   uint Reserve(uint amount);
   void Resize(uint amount);
   void ShrinkToFit();
   uint Size() const;
}
```

- `Clear`

   Clears out the entire array.

- `Copy`

   Copies another array's contents into this array.

- `Delete`

   Deletes `count` object(s) at `index`. Moves objects after them into their place.

- `Find`

   Finds the index of `item` in the array, or `Size` if it couldn't be found.

- `Grow`

   Ensures the array can hold at least `amount` new members.

- `Insert`

   Inserts `item` at `index`. Moves objects after `index` to the right.

- `Max`

   Returns the allocated size of the array.

- `Move`

   Moves another array's contents into this array.

- `Pop`

   Deletes the last item in the array. Returns `false` if there are no items in the array.

- `Push`

   Places `item` at the end of the array, calling `Grow` if necessary.

- `Reserve`

   Adds `amount` new entries at the end of the array, increasing `Size`. Calls `Grow` if necessary.

- `Resize`

   Changes the allocated array size to `amount`. Deletes members if `amount` is smaller than `Size`.

- `ShrinkToFit`

   Shrinks the allocated array size `Max` to `Size`.

- `Size`

   Returns the amount of objects in the array.

<!-- EOF -->
