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
// |f 1/1 2/2 3/3                            //linking vert and texture indices
// |f 4/4 5/5 6/6 7/7                        //list 4 if a quad
// |
// |o TMD object #{0}, VRAM page #{1}        //repeat for remaining objects, split for seperate mtl/VRAM pages
// |usemtl VRAM page #{1}
// |
// |f 1/1 2/2 3/3                            
// |f 4/4 5/5 6/6       
#endregion
//To-Do//
//-Change how multiple objects are handled
//	-most likely the reason why mmj export isn't great
//-Need Normals to fix auto shading issue in Blender
//	-Normals are acting buggy and produce unexpected results, disabled for now
//  -Caused by flipped faces

/// @desc Takes imported MM file and exports an OBJ with MTL file. 
/// TEX File must also be imported to properly link the PNGs in the MTL file. 

function export_obj(){
	quad_split = true;
	test_count = 0;
	bit_string = ["_4Bit","_8Bit"];
	grid_string = ["","G"];
	objbuffer = buffer_create(0, buffer_grow, 1);
	mtlbuffer = buffer_create(0, buffer_grow, 1);
	mtllib_string = string_insert(fname_mm0, ".mtl", -1);
	mtllib = [mtllib_string];
	obj_string_array = [];
	mtl_string_array = [];
	
	#region Functions
	/// @desc Fills obj_string_array with the vt field(UV) of a supplied primitive
	/// @arg {Asset.Primitive} _prim Target prim that will supply the UV data
	function vt_write(_prim) {
		for (var b = 0; b < array_length(_prim.tex_x); b++){
			array_push(obj_string_array, string("vt 0.{0} 0.{1}", convert_xy_uv(_prim.tex_x[b]), convert_xy_uv(_prim.tex_y[b], 1)) + "\n");
			vt_count++;
			if (b == 3){
				quad_count++;
			}
		}
	}
	
	/// @desc fills prim_group with arrays of sorted indices of the prim's p_index fields
	/// @arg {Array.Primitive} _prims The target primitive array
	function prim_group_sort(_prims){
		var temp_array = [];
		repeat (8){
			array_push(temp_array, []);
		}
		for (var a = 0; a < array_length(_prims); a++){
			var ind = (_prims[a].page_x - 12) + (_prims[a].c_mode * 4)
			array_push(temp_array[ind], a);
		}
		return temp_array;
	}
	
	/// @desc Returns given array. Used to stop new arrays from becoming pointers to the old ones
	/// @arg {array} Array Copy target
	function array_clone(_array){
		_array = _array;
		return _array;
	}
	#endregion
	
	//Reverse order of primitives, which will match the way it's rendered in game
	
	tmd_duplicates = {
		prim : [],
		vert : [],
		norm : []
	};

	//add duplicate primitive's data so Blender doesn't overwrite it
	for (var a = 0; a < array_length(tmd_base.duplicates); a++){
		var dupe_prim = tmd_edit.prim[tmd_base.duplicates[a][0]];
		array_push(tmd_duplicates.prim, dupe_prim);
		for (var b = 0; b < array_length(dupe_prim.vert); b++){
			var new_vert = tmd_edit.vert[dupe_prim.vert[b]]
			new_vert.vz--;
			array_push(tmd_duplicates.vert, new_vert);
			tmd_duplicates.prim[a].vert[b] = a;
		}
		for (var b = 0; b < array_length(dupe_prim.norm); b++){
			var new_norm = tmd_edit.norm[dupe_prim.norm[b]]
			new_norm.nz -= 1;
			array_push(tmd_duplicates.norm, new_norm);
			tmd_duplicates.prim[a].norm[b] = a;
		}
	}

	//prim_group holds 8 arrays that contain the sorted primitive's p_index fields
	//sorted by the 4 VRAM pages, and the two bit modes
	//prim_group = [
	//	[p28 4bit], [p29 4bit], [p30 4bit], [p31 4bit],
	//	[p28 8bit], [p29 8bit], [p30 8bit], [p31 8bit]
	//]
	
	prim_group = [];
	dupe_group = [];
	// Stat counters to print out in comment fields
	vt_count = 0;
	quad_count = 0;
	triangle_count = 0;
	
	
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
	if(array_length(tmd_reverse.vert) > 0){
		for (var a = 0; a < array_length(tmd_reverse.vert); a++){
			//array_push(obj_string_array, string("v {0}.000000 {1}.000000 {2}.000000", tmd_reverse.vert[a].vx, ~tmd_reverse.vert[a].vy + 1, tmd_reverse.vert[a].vz) + "\n");
			array_push(obj_string_array, string("v {0} {1} {2}", str_obj_vert(-tmd_reverse.vert[a].vx), str_obj_vert(-tmd_reverse.vert[a].vy), str_obj_vert(tmd_reverse.vert[a].vz)) + "\n");
		}
	}
	//default for no verts
	else {array_push(obj_string_array, string("v 0.000000 0.000000 0.000000") + "\n");}
	//comment with vert count
	array_push(obj_string_array, string("# {0} vertices", array_length(tmd_reverse.vert)) + "\n");
	array_push(obj_string_array, "\n");
	#endregion
	#region Vertex + Normals Section
	n_count = 0;
	if(array_length(tmd_reverse.norm) > 0){ 
		for (var a = 0; a < array_length(tmd_reverse.norm); a++){
			//testing//
			n_count++;
			array_push(obj_string_array, string("vn {0} {1} {2}", str_obj_norm(tmd_reverse.norm[a].nx, true), str_obj_norm(tmd_reverse.norm[a].ny, true), str_obj_norm(tmd_reverse.norm[a].nz, false)) + "\n");
			//array_push(obj_string_array, string("vn {0} {1} {2}", str_obj_norm(tmd_reverse.norm[a].nx, false), str_obj_norm(tmd_reverse.norm[a].ny, false), str_obj_norm(tmd_reverse.norm[a].nz, false)) + "\n");
			//array_push(obj_string_array, string("vn {0} {1} {2}", string(tmd_reverse.norm[a].nx), string(tmd_reverse.norm[a].ny), string(tmd_reverse.norm[a].nz)) + "\n");
		}
	}
	else {array_push(obj_string_array, string("vn 0.000000 0.000000 0.000000") + "\n");
	}//default for no normals
	array_push(obj_string_array, string("# {0} normals", n_count) + "\n");
	array_push(obj_string_array, "\n");
	#endregion
	
	#region Texture Coordinate Section
	//vertex texture page coords
	//need to keep in mind the prim duplication when doing the primitive section
	
	
	#region Page Sorting V2 [Under construction: Finished]

	prim_group = prim_group_sort(tmd_reverse.prim);
	dupe_group = prim_group_sort(tmd_duplicates.prim);
	#endregion
	
	
	#region vt Writing [Under construction: Finished]
	if(array_length(tmd_reverse.prim) > 0){
		for (var a = 0; a < array_length(prim_group); a++){
			for (var b = 0; b < array_length(prim_group[a]); b++){
				vt_write(tmd_reverse.prim[prim_group[a][b]]);
			}
		}
	}
	else {//default for no texture coords
		array_push(obj_string_array, string("vt 0.000000 0.000000") + "\n");
	}
	
	array_push(obj_string_array, string("# {0} texture coordinates", vt_count) + "\n");
	array_push(obj_string_array, "\n");
	
	#endregion
	
	#region Object Grouping/Face Section
	// grouping part of primitive section
	current_obj = 0;
	vert_base = 0;
	tex_base = 1;
	tex_count = 0;
	
	//change = tmd_edit.objects[a].vert_off - tmd_edit.objects[0].vert_off;
	//vert_base = change / 8;
	//change = tmd_edit.objects[a].normal_off - tmd_edit.objects[0].normal_off;
	//norm_base = change / 8;
		
	mtl_title = ["VRAM 4bit page #28", "VRAM 4bit page #29", "VRAM 4bit page #30", "VRAM 4bit page #31", 
	"VRAM 8bit page #28", "VRAM 8bit page #29", "VRAM 8bit page #30", "VRAM 8bit page #31"];
	mtl_check = [false, false, false, false, false, false, false, false];
	
	norm_flag = false;
	triangle_group = 0;
	for (var a = 0; a < array_length(prim_group) + array_length(dupe_group); a++){
	//for (var a = 0; a < array_length(prim_group); a++){
		if (a < array_length(prim_group)){
			mtl_sorted = prim_group;
			mtl = mtl_title[a]
		}
		else{
			mtl_sorted = dupe_group;
			mtl = string("{0}, {1}", mtl_title[a mod 8], "Duplicate");
		}
		if (array_length(mtl_sorted[a mod 8]) == 0){
			continue;
		}
		//group declaration + name
		array_push(obj_string_array, string("g TMD object #{0}, {1}", triangle_group, mtl) + "\n");
		//matlib declaraion
		array_push(obj_string_array, string("usemtl {0}", mtl_title[a mod 8]) + "\n");
			
		if (quad_split == true){
			for (var b = 0; b < array_length(mtl_sorted[a mod 8]); b++){
				mtl_check[a] = true;
				skip = false;

				var prim_r = tmd_reverse.prim[mtl_sorted[a mod 8][b]];
				for (var c = 0; c < array_length(tmd_edit.duplicates); c++){
					if (quad_count > 0){
						break;
					}
					if (prim_r.p_index == tmd_edit.duplicates[c][1]){
						tex_base += 3;
						skip = true;
						continue;
					}
				}
				if (skip){
					continue;
				}
				for (var c = 0; c < (array_length(prim_r.vert) - 2); c++){
					array_push(obj_string_array, string("f "));
					if (c > 0){
						tex_base -= 2;
						flip = false;
					}
					else {
						flip = true;
					}
					for (var d = 0; d < 3; d++){
						if (c == 0){
							v_ind = 2 - d;
						}
						else{
							v_ind = 0 + d;
						}
						if (norm_flag == true){ //Normals disabled until I can get a better result than when they're excluded
							norm_str = string("/{0} ", prim_r.norm_final[v_ind + c] + 1);
						}
						else{
							norm_str = " ";
						}
						array_push(obj_string_array, string("{0}/{1}{2}", string(prim_r.vert_final[v_ind + c] + 1), string(tex_base + v_ind), norm_str));
					}
					tex_base += 3;
					array_push(obj_string_array, "\n");
					triangle_count++;
				}
			}
			triangle_group++;
		}
		array_push(obj_string_array, "\n");
	}
	


	array_push(obj_string_array, string("# {0} triangles total", triangle_count) + "\n");
	array_push(obj_string_array, string("# {0} quads found", quad_count));
	
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
	

	#region MTL List 4bit
	if (mtl_check[0] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #28" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode28[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[0], grid_string[grid_mode28[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[1] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #29" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode29[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[0], grid_string[grid_mode29[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[2] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #30" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode30[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[0], grid_string[grid_mode30[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[3] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 4bit page #31" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode31[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[0], grid_string[grid_mode31[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	#endregion
	#region MTL List 8bit
	if (mtl_check[4] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #28" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode28[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram28{1}{2}.png", filename, bit_string[1], grid_string[grid_mode28[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[5] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #29" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode29[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram29{1}{2}.png", filename, bit_string[1], grid_string[grid_mode29[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[6] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #30" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode30[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram30{1}{2}.png", filename, bit_string[1], grid_string[grid_mode30[0]])); //alpha map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, "\n");
	}
	if (mtl_check[7] != 0){
		array_push(mtl_string_array, string("newmtl VRAM 8bit page #31" + "\n"));
		array_push(mtl_string_array, string("Kd 0.50000 0.50000 0.50000" + "\n"));
		array_push(mtl_string_array, string("illum 0" + "\n"));
		array_push(mtl_string_array, string("map_Kd {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode31[0]])); //texture map
		array_push(mtl_string_array, "\n");
		array_push(mtl_string_array, string("map_d {0}_vram31{1}{2}.png", filename, bit_string[1], grid_string[grid_mode31[0]])); //alpha map
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