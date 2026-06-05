# MR2_OBJExporter
### Simple exporter for Monster Rancher 2's monster model(.mmj/.mmx) + texture(.tex) files
Requires the extracted files you get from using Reloaded-II to launch Monster Rancher 2 DX

Works for the PSX version as well, but only if you can find a way of extracting files from the iso

Will link materials automatically if you load BOTH a mmj/mmx and a tex file together.

### Current Issues
If you import the obj into Blender and some of the polygons look weird, it's the file's Normals.
It's a problem with how Blender auto assigns normals to imported objs. For now, you'll have to follow these steps to fix it:

1. Enter "Edit Mode" with the object
2. Press [A] to select all vertices
3. Press [Shift] + [N] to recalculate all normals


### Future Plans

- Find an in program fix for the issue with exported normals
- More materials to represent polygons that are semi-transparent in-game
- Implement converting the game's Rectangle primitives(different from usual polygons) which Phoenix uses for it's flame animations
- While not used in-game outside of attack animations, should still create option to export Line primitives
