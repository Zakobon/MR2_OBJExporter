#region Wavefront OBJ File Wikipedia Description
//https://en.wikipedia.org/wiki/Wavefront_.obj_file
 
 
//# List of geometric vertices, with (x, y, z, [w]) coordinates, w is optional and defaults to 1.0.
//v 0.123 0.234 0.345 1.0
//v ...
//...
//# List of texture coordinates, in (u, [v, w]) coordinates, these will vary between 0 and 1. v, w are optional and default to 0.
//vt 0.500 1 [0]
//vt ...
//...
//# List of vertex normals in (x,y,z) form; normals might not be unit vectors.
//vn 0.707 0.000 0.707
//vn ...
//...
//# Parameter space vertices in (u, [v, w]) form; free form geometry statement (see below)
//vp 0.310000 3.210000 2.100000
//vp ...
//...
//# Polygonal face element (see below)
//f 1 2 3
//f 3/1 4/2 5/3
//f 6/4/1 3/5/3 7/6/5
//f 7//1 8//2 9//3
//f ...
//...
//# Line element (see below)
//l 5 8 1 2 4 9


//----------    Geometric vertex

//A vertex is specified via a line starting with the letter v. 
//That is followed by (x,y,z[,w]) coordinates. 
//W is optional and defaults to 1.0. W scales the point. 
//The point (x,y,z,w) corresponds to the point (x/w,y/w,z/w). 
//A right-hand coordinate system is used to specify the coordinate locations. 
//Some applications support vertex colors, by putting red, green and blue values 
//after x y and z (this precludes specifying w). The color values range from 0 to 1.[2] 


//----------    Parameter space vertices

//A free-form geometry statement can be specified in a line starting with the string vp. 
//Define points in parameter space of a curve or surface. u only is required for curve points, 
//u and v for surface points and control points of non-rational trimming curves, and u, v and w (weight) 
//for control points of rational trimming curves. 


//----------    Face elements

//Faces are defined using lists of vertex, texture and normal indices in the 
//format vertex_index/texture_index/normal_index for which each index starts 
//at 1 and increases corresponding to the order in which the referenced element was defined. 
//Polygons such as quadrilaterals can be defined by using more than three indices.

//OBJ files also support free-form geometry which use curves and surfaces to define objects, 
//such as NURBS surfaces. 


//----------    Vertex indices

//A valid vertex index matches the corresponding vertex elements of a previously defined vertex list. 
//If an index is positive then it refers to the offset in that vertex list, starting at 1. If an index is 
//negative then it relatively refers to the end of the vertex list, -1 referring to the last element.

//each face can contain three or more vertices. 

//[f v1 v2 v3 ...]


//----------    Vertex texture coordinate indices

//Optionally, texture coordinate indices can be used to specify texture coordinates when defining a face. 
//To add a texture coordinate index to a vertex index when defining a face, one must put a slash immediately 
//after the vertex index and then put the texture coordinate index. No spaces are permitted before or after 
//the slash. A valid texture coordinate index starts from 1 and matches the corresponding element in the 
//previously defined list of texture coordinates. each face can contain three or more elements. 

//[f v1/vt1 v2/vt2 v3/vt3 ...]


//----------    Vertex normal indices

//Optionally, normal indices can be used to specify normal vectors for vertices when defining a face. 
//To add a normal index to a vertex index when defining a face, one must put a second slash after the texture 
//coordinate index and then put the normal index. A valid normal index starts from 1 and matches the 
//corresponding element in the previously defined list of normals. each face can contain three or 
//more elements. 

//[f v1/vt1/vn1 v2/vt2/vn2 v3/vt3/vn3 ...]


//----------    Vertex normal indices without texture coordinate indices

//As texture coordinates are optional, one can define geometry without them, but one must put two slashes 
//after the vertex index before putting the normal index. 

//[f v1//vn1 v2//vn2 v3//vn3 ...]


//----------    Line elements

//Records starting with the letter "l" (lowercase L) specify the order of the vertices which build a polyline. 

//[l v1 v2 v3 v4 v5 v6 ...]

//----------    Other geometry formats    ----------//

//----------    Reference materials

//Materials that describe the visual aspects of the polygons are stored in external .mtl files. 
//More than one external MTL material file may be referenced from within the OBJ file. 
//The .mtl file may contain one or more named material definitions. 

//|mtllib [external .mtl file name]|
//|...                             |


//This tag specifies the material name for the element following it. 
//The material name matches a named material definition in an external .mtl file.

//|usemtl [material name]          |
//|...                             |


//Named objects and polygon groups are specified via the following tags.
//objects start with the letter "o" and groups start with the letter "g"

//|o [object name]                 |
//|  ...                           |
//|  g [group name]                |
//|  ...                           |


//Smooth shading across polygons is enabled by smoothing groups.

//|s 1                                        |
//|  ...                                      |
//|  # Smooth shading can be disabled as well.|
//|  s off                                    |
//|  ...                                      |


//----------    Relative and absolute indices

//OBJ files, due to their list structure, are able to reference vertices, normals, etc. 
//either by their absolute position (1 represents the first defined vertex, N representing 
//the Nth defined vertex), or by their relative position (-1 represents the latest defined vertex). 
//However, not all software supports the latter approach, and conversely some software 
//inherently writes only the latter form (due to the convenience of appending elements 
//without needing to recalculate vertex offsets, etc.), leading to occasional incompatibilities.
#endregion
#region My OBJ Template
// |# Wavefront OBJ exported by OBJExporter
	
// |mtllib xx_xx_x.mtl                       //external .mtl file name
// |
// |
// |
// |v [x y z]
// |v [x y z]
// |v [x y z]
// |# [num] vertices                         //comment line
// |
// |vt [u v]                                 // coord divided by 256
// |vt [u v]
// |vt [u v]
// |# [num] texture coordinates
// |
// |vn [x y z] // vn 0.000000 0.000000 0.000000
// |# [num] normals
// |                                         //--- Face defining + mtl/texture tag
// |o TMD object #{0}, VRAM page #{1}        //creating object{0} and group{1}
// |usemtl VRAM page #{1}
// |
// |f 1/1 2/2 3/3                            //linking vert and text indices
// |f 4/4 5/5 6/6 7/7                        //list 4 if a quad
// |
// |o TMD object #{0}, VRAM page #{1}        //repeat for remaining objects, split for seperate mtl/VRAM pages
// |usemtl VRAM page #{1}
// |
// |f 1/1 2/2 3/3                            
// |f 4/4 5/5 6/6       
#endregion
//To-Do//
//Need Normals to fix auto shading issue in Blender
//	-Normals are acting buggy and produce unexpected results, disabled for now
//  -Caused by flipped faces

/// @desc Takes imported MM file and exports an OBJ with MTL file. 
/// TEX File must also be imported to properly link the PNGs in the MTL file. 
function export_obj(){
	bit_string = ["_4Bit","_8Bit"];
	grid_string = ["","G"];
	objbuffer = buffer_create(0, buffer_grow, 1);
	mtlbuffer = buffer_create(0, buffer_grow, 1);
	mtllib_string = string_insert(fname_mm0, ".mtl", -1);
	mtllib = [mtllib_string];
	obj_string_array = [];
	mtl_string_array = [];
	
	f28_check_4bit[0] = 0;
	f29_check_4bit[0] = 0;
	f30_check_4bit[0] = 0;
	f31_check_4bit[0] = 0;
	
	f28_check_8bit[0] = 0;
	f29_check_8bit[0] = 0;
	f30_check_8bit[0] = 0;
	f31_check_8bit[0] = 0;
	#region OBJ File Header
	//title
	array_push(obj_string_array, "# Wavefront OBJ exported by TMD Converter" + "\n");
	array_push(obj_string_array, "\n");
	//mtllib list
	if (array_length(mtllib) > 0){
		for (var a = 0; a < array_length(mtllib); a++){
			array_push(obj_string_array, string("mtllib {0}", mtllib[a]) + "\n");
		}
	}
	array_push(obj_string_array, "\n");
	#endregion
	#region Vertec Coordinate Section
	if(array_length(tmd_edit.vert) > 0){
		for (var a = 0; a < array_length(tmd_edit.vert); a++){
			//array_push(obj_string_array, string("v {0}.000000 {1}.000000 {2}.000000", tmd_edit.vert[a].vx, ~tmd_edit.vert[a].vy + 1, tmd_edit.vert[a].vz) + "\n");
			array_push(obj_string_array, string("v {0} {1} {2}", str_obj_vert(tmd_edit.vert[a].vx), str_obj_vert(-tmd_edit.vert[a].vy), str_obj_vert(tmd_edit.vert[a].vz)) + "\n");
		}
	}
	//default for no verts
	else {array_push(obj_string_array, string("v 0.000000 0.000000 0.000000") + "\n");}
	//comment with vert count
	array_push(obj_string_array, string("# {0} vertices", array_length(tmd_edit.vert)) + "\n");
	array_push(obj_string_array, "\n");
	#endregion
	#region Vertex Normals Section
	
	if(array_length(tmd_edit.norm) > 0){ 
		for (var a = 0; a < array_length(tmd_edit.norm); a++){
			//testing//
			array_push(obj_string_array, string("vn {0} {1} {2}", str_obj_norm(tmd_edit.norm[a].nx), str_obj_norm(tmd_edit.norm[a].ny), str_obj_norm(tmd_edit.norm[a].nz)) + "\n");
			//array_push(obj_string_array, string("vn {0} {1} {2}", string(tmd_edit.norm[a].nx), string(tmd_edit.norm[a].ny), string(tmd_edit.norm[a].nz)) + "\n");
		}
	}
	else {array_push(obj_string_array, string("vn 0.000000 0.000000 0.000000") + "\n");}//default for no normals
	#endregion
	#region Texture Coordinate Section
	//vertex texture page coords
	//need to keep in mind the prim duplication when doing the primitive section
	vt_count4bit = 0;
	vt_count8bit = 0;
	quad_count = 0;
	if(array_length(tmd_edit.prim) > 0){
		for(var a = 0; a < tmd_edit.obj_num; a++){
			f28_4bit = [];
			f29_4bit = [];
			f30_4bit = [];
			f31_4bit = [];
			
			f28_8bit = [];
			f29_8bit = [];
			f30_8bit = [];
			f31_8bit = [];
			for (var b = 0; b < tmd_edit.objects[a].prim_num; b++){ //Texture Coords sorting
				current_prim = tmd_edit.prim[b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num];
				switch (current_prim.c_mode){
					case 0:
					switch (current_prim.page_x){
						case 12:
						array_push(f28_4bit, current_prim);
						break;
						case 13:
						array_push(f29_4bit, current_prim);
						break;
						case 14:
						array_push(f30_4bit, current_prim);
						break;
						case 15:
						array_push(f31_4bit, current_prim);
						break;
					}
					break;
					
					case 1:
					switch (current_prim.page_x){
						case 12:
						array_push(f28_8bit, current_prim);
						break;
						case 13:
						array_push(f29_8bit, current_prim);
						break;
						case 14:
						array_push(f30_8bit, current_prim);
						break;
						case 15:
						array_push(f31_8bit, current_prim);
						break;
					}
					break;
				}
			}
			if (array_length(f28_4bit) != 0){
				for(var b = 0; b < array_length(f28_4bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count4bit++;
					if(tmd_edit.prim[f28_4bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f28_4bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count4bit++;
					}
				}
			}
			if (array_length(f29_4bit) != 0){
				for(var b = 0; b < array_length(f29_4bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count4bit++;
					if(tmd_edit.prim[f29_4bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f29_4bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count4bit++;
					}
				}
			}
			if (array_length(f30_4bit) != 0){
				for(var b = 0; b < array_length(f30_4bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count4bit++;
					if(tmd_edit.prim[f30_4bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f30_4bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count4bit++;
					}
				}
			}
			if (array_length(f31_4bit) != 0){
				for(var b = 0; b < array_length(f31_4bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count4bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count4bit++;
					if(tmd_edit.prim[f31_4bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f31_4bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count4bit++;
					}
				}
			}
			
		
			if (array_length(f28_8bit) != 0){
				for(var b = 0; b < array_length(f28_8bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count8bit++;
					if(tmd_edit.prim[f28_8bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f28_8bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count8bit++;
					}
				}
			}
			if (array_length(f29_8bit) != 0){
				for(var b = 0; b < array_length(f29_8bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count8bit++;
					if(tmd_edit.prim[f29_8bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f29_8bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count8bit++;
					}
				}
			}
			if (array_length(f30_8bit) != 0){
				for(var b = 0; b < array_length(f30_8bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count8bit++;
					if(tmd_edit.prim[f30_8bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f30_8bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count8bit++;
					}
				}
			}
			if (array_length(f31_8bit) != 0){
				for(var b = 0; b < array_length(f31_8bit); b++){
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_x[0]), convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_y[0], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_x[1]), convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_y[1], 1)) + "\n");
					vt_count8bit++;
					array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_x[2]), convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_y[2], 1)) + "\n");
					vt_count8bit++;
					if(tmd_edit.prim[f31_8bit[b].p_index].cmd & 0b1000 == 8){
						array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_x[3]), convert_xy_uv(tmd_edit.prim[f31_8bit[b].p_index].tex_y[3], 1)) + "\n");
						vt_count8bit++;
					}
				}
			}
			
		}
	}
	else {//default for no texture coords
		array_push(obj_string_array, string("vt 0.000000 0.000000"));
	}
	
	
	//comment with vert coord count
	array_push(obj_string_array, string("# {0} texture coordinates", vt_count4bit + vt_count8bit) + "\n");
	array_push(obj_string_array, "\n");
	#endregion
	#region Object Grouping/Face Section
	// grouping part of primitive section
	current_obj = 0;
	vert_base = 0;
	tex_base = 1;
	tex_count = 0;
	triangle_total = 0;
	//flags for [page drawn to, opaque found, semi-transparency found]
	f28_check_4bit = [0, 0];
	f29_check_4bit = [0, 0];
	f30_check_4bit = [0, 0];
	f31_check_4bit = [0, 0];
	
	f28_check_8bit = [0, 0];
	f29_check_8bit = [0, 0];
	f30_check_8bit = [0, 0];
	f31_check_8bit = [0, 0];
	for(var a = 0; a < tmd_edit.obj_num; a++){
		//g TMD object #0, VRAM page #30 

		change = tmd_edit.objects[a].vert_off - tmd_edit.objects[0].vert_off;
		vert_base = change / 8;
		change = tmd_edit.objects[a].normal_off - tmd_edit.objects[0].normal_off;
		norm_base = change / 8;
		f28_4bit = [[],[]];
		f29_4bit = [[],[]];
		f30_4bit = [[],[]];
		f31_4bit = [[],[]];
		f28_8bit = [[],[]];
		f29_8bit = [[],[]];
		f30_8bit = [[],[]];
		f31_8bit = [[],[]];
		#region Page Sorting
		for (var b = 0; b < tmd_edit.objects[a].prim_num; b++){
			current_prim = b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num;
			primitive = tmd_edit.prim[b + tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num];
			prim_transparency = (primitive.cmd >> 1) & 0b1;
			
			switch (primitive.page_x){
				case 12:
				switch (primitive.c_mode){
					case 0:
					array_push(f28_4bit[prim_transparency], current_prim);
					break;
					case 1:
					array_push(f28_8bit[prim_transparency], current_prim);
					break;
				}
				break;
				
				case 13:
				switch (primitive.c_mode){
					case 0:
					array_push(f29_4bit[prim_transparency], current_prim);
					break;
					case 1:
					array_push(f29_8bit[prim_transparency], current_prim);
					break;
				}
				break;
				
				case 14:
				switch (primitive.c_mode){
					case 0:
					array_push(f30_4bit[prim_transparency], current_prim);
					break;
					case 1:
					array_push(f30_8bit[prim_transparency], current_prim);
					break;
				}
				break;
				
				case 15:
				switch (primitive.c_mode){
					case 0:
					array_push(f31_4bit[prim_transparency], current_prim);
					break;
					case 1:
					array_push(f31_8bit[prim_transparency], current_prim);
					break;
				}
				break;
			}
		}
		#endregion
		#region Group Writing 4bit
		if (array_length(f28_4bit[0]) != 0){
			f28_check_4bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #28 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #28 Opaque") + "\n");
			for (var b = 0; b < array_length(f28_4bit[0]); b++){
				f_vert = tmd_edit.prim[f28_4bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f28_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f28_4bit[1]) != 0){
			f28_check_4bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #28 Semi_Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #28 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f28_4bit[1]); b++){
				f_vert = tmd_edit.prim[f28_4bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f28_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f29_4bit[0]) != 0){
			f29_check_4bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #29 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #29 Opaque") + "\n");
			for (var b = 0; b < array_length(f29_4bit[0]); b++){
				f_vert = tmd_edit.prim[f29_4bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f29_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f29_4bit[1]) != 0){
			f29_check_4bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #29 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #29 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f29_4bit[1]); b++){
				f_vert = tmd_edit.prim[f29_4bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f29_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f30_4bit[0]) != 0){
			f30_check_4bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #30 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #30 Opaque") + "\n");
			for (var b = 0; b < array_length(f30_4bit[0]); b++){
				f_vert = tmd_edit.prim[f30_4bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f30_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f30_4bit[1]) != 0){
			f30_check_4bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #30 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #30 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f30_4bit[1]); b++){
				f_vert = tmd_edit.prim[f30_4bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f30_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f31_4bit[0]) != 0){
			f31_check_4bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #31 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #31 Opaque") + "\n");
			for (var b = 0; b < array_length(f31_4bit[0]); b++){
				f_vert = tmd_edit.prim[f31_4bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f31_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f31_4bit[1]) != 0){
			f31_check_4bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 4bit page #31 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 4bit page #31 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f31_4bit[1]); b++){
				f_vert = tmd_edit.prim[f31_4bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f31_4bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		#endregion
		#region Group Writing 8bit
		if (array_length(f28_8bit[0]) != 0){
			f28_check_8bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #28 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #28 Opaque") + "\n");
			for (var b = 0; b < array_length(f28_8bit[0]); b++){
				f_vert = tmd_edit.prim[f28_8bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f28_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f28_8bit[1]) != 0){
			f28_check_8bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #28 Semi_Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #28 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f28_8bit[1]); b++){
				f_vert = tmd_edit.prim[f28_8bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f28_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f29_8bit[0]) != 0){
			f29_check_8bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #29 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #29 Opaque") + "\n");
			for (var b = 0; b < array_length(f29_8bit[0]); b++){
				f_vert = tmd_edit.prim[f29_8bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f29_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f29_8bit[1]) != 0){
			f29_check_8bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #29 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #29 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f29_8bit[1]); b++){
				f_vert = tmd_edit.prim[f29_8bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f29_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f30_8bit[0]) != 0){
			f30_check_8bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #30 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #30 Opaque") + "\n");
			for (var b = 0; b < array_length(f30_8bit[0]); b++){
				f_vert = tmd_edit.prim[f30_8bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f30_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");

		}
		
		if (array_length(f30_8bit[1]) != 0){
			f30_check_8bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #30 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #30 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f30_8bit[1]); b++){
				f_vert = tmd_edit.prim[f30_8bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f30_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f31_8bit[0]) != 0){
			f31_check_8bit[0] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #31 Opaque", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #31 Opaque") + "\n");
			for (var b = 0; b < array_length(f31_8bit[0]); b++){
				f_vert = tmd_edit.prim[f31_8bit[0][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f31_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		
		if (array_length(f31_8bit[1]) != 0){
			f31_check_8bit[1] = 1;
			triangle_group = 0;
			//group declaration + name
			array_push(obj_string_array, string("g TMD object #{0}, VRAM 8bit page #31 Semi-Transparent", a) + "\n");
			//matlib declaraion
			array_push(obj_string_array, string("usemtl VRAM 8bit page #31 Semi-Transparent") + "\n");
			for (var b = 0; b < array_length(f31_8bit[1]); b++){
				f_vert = tmd_edit.prim[f31_8bit[1][b]];
				switch (array_length(f_vert.vert)){
					case 4:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					
					array_push(obj_string_array, string("f "));
					tex_base = tex_base - 2;
					for (var c = 1; c < 4; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					}
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
					
					case 3:
					array_push(obj_string_array, string("f "));
					for (var c = 0; c < 3; c++){
						array_push(obj_string_array, string("{0}/{1} ", string(vert_base + f_vert.vert[c] + 1), string(tex_base)));//, string(norm_base + f_vert.norm[c] + 1)));
						tex_base++;
					} 
					array_push(obj_string_array, "\n");
					triangle_total++;
					triangle_group++;
					break;
				}
			}
			//triangle_total = triangle_total + array_length(f31_8bit);
			array_push(obj_string_array, string("# {0} triangles in group", triangle_group) + "\n");
			array_push(obj_string_array, "\n");
		}
		#endregion
	}
	//quad_string = string("{0} quads", quad_count);	
	array_push(obj_string_array, string("# {0} triangles total", triangle_total));	
	#endregion
	//export_path = get_save_filename_ext("Wavefront OBJ|*.obj", fname_mm0, "","Save OBJ File");
	//export_path = variable_clone(user_filepath);
	#region OBJ File Export
	for (var a = 0; a < array_length(obj_string_array); a++){
		buffer_write(objbuffer, buffer_text, obj_string_array[a]);
	}
	export_path_obj = string("{0}{1}.obj", user_filepath, fname_mm0);
	export_path_mtl = string("{0}{1}.mtl", user_filepath, fname_mm0);
	buffer_save(objbuffer, export_path_obj);
	#endregion
	#region MTL File Creation
	if (ui_name_tex != "None"){
		filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
	}
	else{
		filename = string_delete(fname_mm0, string_length(fname_mm0) - 1, 2);
	}
	
	t_mode = ["opaque", "semi-transparent"];
	#region MTL List 4bit
	if (f28_check_4bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #28 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f28_check_4bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #28 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f29_check_4bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #29 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f29_check_4bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #29 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f30_check_4bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #30 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f30_check_4bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #30 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f31_check_4bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #31 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		//array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		//array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f31_check_4bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #31 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	#endregion
	#region MTL List 8bit
	if (f28_check_8bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #28 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f28_check_8bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #28 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f29_check_8bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #29 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f29_check_8bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #29 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f30_check_8bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #30 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f30_check_8bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #30 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f31_check_8bit[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #31 Opaque" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("d 1.00000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode]));
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (f31_check_8bit[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #31 Semi-Transparent" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	#endregion
	#region MTL File Export
	for (var a = 0; a < array_length(mtl_string_array); a++){
		buffer_write(mtlbuffer, buffer_text, mtl_string_array[a]);
	}
	//export_path = string_delete(export_path, string_length(export_path) - 2, 3);
	//export_path = string_insert("mtl", export_path, string_length(export_path) + 1);
	buffer_save(mtlbuffer, export_path_mtl);
	#endregion
	#endregion
}