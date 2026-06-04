//translate object's vertex values by the s8 values stored in tmd_base.final
function dh_2_apply(_offset, _pad){
	byte = _offset;
	offset = 0;
	for (var a = 0; a < tmd_edit.obj_num; a++){ //object
		p_base = tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num;
		
		for (var b = 0; b < tmd_base.objects[a].vert_num; b++){ //vert
			v_index = (tmd_base.objects[a].vert_off - tmd_base.objects[0].vert_off) / 8;
			tmd_edit.vert[v_index + b].vx = tmd_base.vert[v_index + b].vx + tmd_edit.final[offset + byte];
			//offset++;
			tmd_edit.vert[v_index + b].vy = tmd_base.vert[v_index + b].vy + tmd_edit.final[offset + byte];
			//offset++;
			tmd_edit.vert[v_index + b].vz = tmd_base.vert[v_index + b].vz + tmd_edit.final[offset + byte];
			//offset++;
			
		}
		offset++
		offset++
		offset++
		for (var c = 0; c < _pad; c++){
			offset++
		}
	}
}