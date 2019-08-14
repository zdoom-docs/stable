# Shape2D

Represents an arbitrary polygonal 2D shape.

```
class Shape2D : Object
{
	void Clear(int which = C_Verts | C_Coords | C_Indices);
	void PushCoord(vector2 c);
	void PushTriangle(int a, int b, int c);
	void PushVertex(vector2 v);
}
```

### `Clear`

Clears data out of a shape. Uses these as a bit flag:

| Name                | Description                 |
| ----                | -----------                 |
| `Shape2D.C_Coords`  | Clears texture coordinates. |
| `Shape2D.C_Indices` | Clears vertex indices.      |
| `Shape2D.C_Verts`   | Clears vertices.            |

### `PushCoord`

Pushes a texture coordinate into the shape buffer.

### `PushTriangle`

Pushes the indices of a triangle into the shape buffer.

### `PushVertex`

Pushes a vertex into the shape buffer.

<!-- EOF -->
