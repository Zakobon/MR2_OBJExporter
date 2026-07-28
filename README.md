# MR2_OBJExporter
### Simple exporter for Monster Rancher 2's monster model(.mmj/.mmx) + texture(.tex) files
Requires the extracted files you get from using Reloaded-II to launch Monster Rancher 2 DX

Works for the PSX version as well, but only if you can find a way of extracting files from the iso

Will link materials automatically if you load **BOTH** a mmj/mmx and a tex file together.

You can also preview a page's 4-bit and 8-bit textures in the viewer with the respective buttons.

### Grid mode is now available for exported PNGs _and_ TEX files!! 
This is to help get a better understanding where textures are placed on a model.

Just click the Grid Mode button to enable it on whichever pages you want and select a pattern.

You will need to replace the old TEX file with the exported one, so **MAKE BACKUPS** or risk overwriting the originals!

Pattern selection will apply to each page individually!
  - This way you can have a better experience identifying pages on models

TEX Files can _only_ export into grid patterns, no mixing with the original textures like you can with the OBJ Files
  - It's the CLUT/palette limitation in-game that prevents this feature from happening

### Current Issues
If you import the obj into Blender and some of the polygons look weird, it's because a few of the polygons have their face directions flipped. It should only be an issue with MMJ files. At a later date I'll add a way of recalculating each polygon's face direction based on each piece of the model.

For now, you'll have to follow these steps in Blender to fix it:

1. Enter "Edit Mode" with the object
2. Press [A] to select all vertices
3. Press [Shift] + [N] to recalculate all normals


### Future Plans

- Find an in program fix for the issue with exported polygon face direction
- Implement converting the game's Rectangle primitives(different from usual polygons) which Phoenix uses for it's flame animations
- While not used in-game outside of attack animations, should still create option to export Line primitives
