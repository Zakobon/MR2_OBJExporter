function vram(_x = 0, _y = 0, _rect_alpha = 1, _tim_alpha = 1){
	
	
	//To align grid surface to current draw page, do:
	//  xpage = pixel_x;
	//  ypage = pixel_y;
	//  if (ui_page > 15) {
	//		xpage = ui_page - 16
	//		ypage = 256
	//	}
	//	else{
	//		xpage = ui_page;
	//		ypage = 0;
	//	}
	//	x = x - xpage * 64;
	//	y = y - ypage;
	
	
	//Any TIM who's xy values are outside the grid are drawn with a reduced alpha
	
	//--Draw Rectangles--//
	//for each TIM, draw it's rectangle at it's exact coords
		
	//--Draw TIMs--//
	//Check for visibility toggle
	//If draw all:
	//draw all TIM's surfaces to their exact coords
	//If draw all, highlight one:
	//draw all TIM's surfaces to their exact coords at a VERY reduced alpha, then draw ui_tim at full alpha
	//If draw one:
	//draw ui_tim at full alpha
	
	if !(surface_exists(draw_vram)){
		draw_vram = surface_create(4096, 1024); //(64 * 16, 256 * 2) * 2
	}											//for x coords, we do [0-15] * 64 //so a max of 64 * 16
	surface_set_target(draw_vram);
	draw_clear_alpha(c_black, 0);
	
	
	draw_set_alpha(_rect_alpha);
	
	
	
	//TO-DO//
	//-draw_rectangle-//
	//replace ui_page checking with direct coord checking
	//remove ui_tim_view_next_page
	
	//NOTE//
	//This script was only mean to draw TIM SURFACES onto the VRAM Surface
	//NOT creating them
	
	for (var a = 0; a < ds_list_size(tim_list);a++){
	//for (var a = 0; a < ds_list_size(draw_ui_tim); a++){
		bit_mode = tim_list[|a].bit;
		switch (bit_mode){
			case 0:
			mult = 4;
			break;
			
			case 1:
			mult = 2;
			break;
		}
		
		timx = 0 + (tim_list[|a].pixel_x div 64) * 64 * mult * 2;
		timpx = (tim_list[|a].pixel_x % 64) * mult * 2;
		timy = 0 + tim_list[|a].pixel_y * 2;
		timw = (tim_list[|a].pixel_w * 2);
		timh = (tim_list[|a].pixel_h * 2);
		
		
		switch (tim_list[|a].clut_data[0].stp){
			case 0:
			draw_set_alpha(_rect_alpha * 1);
			break;
			
			case 1:
			draw_set_alpha(_rect_alpha * .6);
			break;
			
			default:
			draw_set_alpha(_rect_alpha * 0);
			break
		}
		
		//Draw Rectangles//
		fill = $FF000000;
		outline = $FFFFFFFF;
		//VRAM is split into two rows of 16 pages
		//This section helps define where ui_page currently is
		xpage = timx;
		ypage = timy;
		if (ui_page > 15) { 
			xpage = ui_page - 16
			ypage = 512;
		}
		else{
			xpage = ui_page;
			ypage = 0;
		}
		xdraw = xpage * 64 * mult * 2;
		ydraw = ypage;
		//Check to see if rectangle's x origin is in the current ui_page 
		//if (timx + timpx >= xdraw && timx + timpx < xdraw + (256)){
		if (timx + timpx < xdraw || timx + timpx >= xdraw + (256)){
			draw_set_alpha(_rect_alpha * .8); //Reduced transparency for TIMs outside of ui_page
		}
		else {
			draw_set_alpha(_rect_alpha);
		}
		
		//Set color and draw the actual rectangle with an outline
		switch(tim_list[|a].clut_y){ //clut_y draw color
			case 505:
			fill = $FFCFEAE4;
			break;
			case 506:
			fill = $FFB6D3CC;
			break;
			case 507:
			fill = $FF9DBBB3;
			break;
			case 508:
			fill = $FF84A39B;
			break;
			case 509:
			fill = $FF6A8B82;
			break;
			case 510:
			fill = $FF506962;
			break;
			case 511:
			fill = $FF354641;
			break;
		}
		outline = $FFFFFFFF;
		if (a == ui_tim){
			fill = $00D6C58F;
			outline = ((timer div 10) * $FF333333);
		}
		draw_set_colour(fill);
		draw_rectangle(timx + timpx, timy, timx + timpx + (timw * mult), timy + timh, 0);//Rectangle fill
		draw_set_colour(outline);		
		//draw_set_colour($FF161616)
		draw_rectangle(timx + timpx + 2, timy + 2, timx + timpx + (timw * mult) - 2, timy + timh - 2, 1);//Rectangle outline
		draw_rectangle(timx + timpx + 1, timy + 1, timx + timpx + (timw * mult) - 1, timy + timh - 1, 1);//Rectangle outline
		
		//Draw TIM Basic info onto the rectangle
		draw_set_colour($FF000000);
		if (timw >= 3 && timh >= 5){ 
			draw_text(timx + timpx + 2, timy + 1, string(a));
			if (timw >= 34 && timh >= 40){
				draw_text(timx + timpx + 2, timy + 20, string(tim_list[|a].clut_y));
				if (mult == 4){
					draw_set_colour($FF960019);
				}
				else{
					draw_set_colour($FF6A1B08);
				}
				draw_text(timx + timpx + 24, timy + 1, string(tim_bit_mode_string[tim_list[|a].bit]));
			}
		}
		
		//Draw the ui_draw_tim[a] surface here 
		switch (a == ui_tim){
			case true:
			draw_set_alpha(_tim_alpha);
			break;
			
			case false:
			draw_set_alpha(_tim_alpha * .6);
			break;
		}
		draw_surface(draw_ui_tim[a], timx + timpx, timy);
		draw_set_colour($FF363636);	
		draw_rectangle(timx + timpx + 2, timy + 2, timx + timpx + (timw * mult) - 2, timy + timh - 2, 1);//Rectangle outline
		draw_set_colour($FF565656);	
		draw_rectangle(timx + timpx + 1, timy + 1, timx + timpx + (timw * mult) - 1, timy + timh - 1, 1);//Rectangle outline
	}
	
	draw_set_colour($FFCCCCCC);
	surface_reset_target();
	view_surface_id[0] = draw_vram;
	draw_set_alpha(1);
}