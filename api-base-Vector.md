# Vector2/Vector3

Vectors have builtin methods and `Vector3` in particular has a swizzle
operator.

```
struct Vector2
{
   double x, y;

   double  Length() const;
   vector2 Unit() const;
}

struct Vector3
{
   double x, y, z;
   vector2 xy;

   double  Length() const;
   vector3 Unit() const;
}
```

- `Length`

   Returns the length (magnitude) of the vector.

- `Unit`

   Returns a normalized vector. Equivalent to `vec / vec.Length()`.

<!-- EOF -->
