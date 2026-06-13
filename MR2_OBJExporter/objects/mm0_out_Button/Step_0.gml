if (mm0_base_buffer != -1){
	var Export_active = variable_instance_get(export_mm0, "active");
	image_index = 0;
	apply = 1;
	variable_instance_set(export_mm0, "enable", 1);
	if (Export_active == 1){
		export_obj();
		variable_instance_set(export_mm0, "active", 0);
		obj_out_success = 1;
		obj_duplicate++;
	}
	//if (variable_instance_get(A_MM0, "enable") == 0){
	//	variable_instance_set(A_MM0, "enable", 1);
	//	variable_instance_set(B_MM0, "enable", 1);
	//	variable_instance_set(D_MM0, "enable", 1);
	//	variable_instance_set(I_MM0, "enable", 1);
	//	variable_instance_set(P_MM0, "enable", 1);
	//	variable_instance_set(V_MM0, "enable", 1);	
	//}
	//var A_MM0_active = variable_instance_get(A_MM0, "active");
	//var B_MM0_active = variable_instance_get(B_MM0, "active");
	//var D_MM0_active = variable_instance_get(D_MM0, "active");
	//var I_MM0_active = variable_instance_get(I_MM0, "active");
	//var P_MM0_active = variable_instance_get(P_MM0, "active");
	//var V_MM0_active = variable_instance_get(V_MM0, "active");
	//var Export_active = variable_instance_get(export_mm0, "active");
	//targeted_export = A_MM0_active + B_MM0_active + D_MM0_active + I_MM0_active + P_MM0_active + V_MM0_active;
	//switch(targeted_export){
	//	case 0:
	//	variable_instance_set(export_mm0, "display", "Export MM0");
	//	break;
	//	case 1:
	//	variable_instance_set(export_mm0, "display", "Single Overwrite");
	//	break;
	//	default:
	//	variable_instance_set(export_mm0, "display", "Bulk Overwrite");
	//	break;
	//}

	//if (Export_active == 1){
	//	//file_destination = get_open_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", fname_mm0, "","Save MRDX MMJ/MMX Files");
		
		
	//	if (targeted_export == 0){
	//		export_path = get_save_filename_ext("MRDX MM_ Files|*.mmj;*.mmx", ui_name_mm0, "","Save MRDX MMJ/MMX File");
	//		if (export_path == ""){
	//			variable_instance_set(export_mm0, "active", 0);
	//			exit;
	//		}
	//		x_mm0_buffer = buffer_load(export_path);
	//		mm0_write(x_mm0_buffer);
	//		buffer_save(x_mm0_buffer, export_path);
	//		variable_instance_set(export_mm0, "active", 0);
	//		exit;
	//	}
	//	if !(show_question("This will export your changes to each of the model's variants in the imported file's directory.\n\n\n Are you sure?")){
	//		variable_instance_set(export_mm0, "active", 0);
	//		exit;
	//	}
		
	//	if (A_MM0_active == 1){
	//		if(file_exists(filename_array[0])){
	//			a_mm0_buffer = buffer_load(filename_array[0]);
	//			mm0_write(a_mm0_buffer);
	//			buffer_save(a_mm0_buffer, filename_array[0]);
	//			filename_found[0] = 2;
	//		}
	//	}	
	//	if (B_MM0_active == 1){
	//		if(file_exists(filename_array[1])){
	//			b_mm0_buffer = buffer_load(filename_array[1]);
	//			mm0_write(b_mm0_buffer);
	//			buffer_save(b_mm0_buffer, filename_array[1]);
	//			filename_found[1] = 2;
	//		}
			
	//	}	
	//	if (D_MM0_active == 1){
	//		if(file_exists(filename_array[2])){
	//			d_mm0_buffer = buffer_load(filename_array[2]);
	//			mm0_write(d_mm0_buffer);
	//			buffer_save(d_mm0_buffer, filename_array[2]);
	//			filename_found[2] = 2;
	//		}
		
	//	}	
	//	if (I_MM0_active == 1){
	//		if(file_exists(filename_array[3])){
	//			i_mm0_buffer = buffer_load(filename_array[3]);
	//			mm0_write(i_mm0_buffer);
	//			buffer_save(i_mm0_buffer, filename_array[3]);
	//			filename_found[3] = 2;
	//		}
	//	}
	//	if (P_MM0_active == 1){
	//		if(file_exists(filename_array[4])){
	//			p_mm0_buffer = buffer_load(filename_array[4]);
	//			mm0_write(p_mm0_buffer);
	//			buffer_save(p_mm0_buffer, filename_array[4]);
	//			filename_found[4] = 2;
	//		}
	//	}		
	//	if (V_MM0_active == 1){
	//		if(file_exists(filename_array[5])){
	//			v_mm0_buffer = buffer_load(filename_array[5]);
	//			mm0_write(v_mm0_buffer);
	//			buffer_save(v_mm0_buffer, filename_array[5]);
	//			filename_found[5] = 2;
	//		}
	//	}
	//	timer = 0;
	//	variable_instance_set(export_mm0, "active", 0);
	//}
	
		
	//if (array_length(filename_array) == 0){
	//	exit;
	//}
	//timer++;
	//if (timer % 30 == 0){
	//	for (var a = 0; a < 6; a++){
	//		if(file_exists(filename_array[a])){
	//			filename_found[a] = 1;
	//		}
	//		else{
	//			filename_found[a] = 0;
	//		}
	//	}
	//}
}
else{
	image_index = 1;
	variable_instance_set(export_mm0, "enable", 0);
	apply = 0;
	exit;
}
