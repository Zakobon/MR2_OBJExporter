
if (create == 0){
	create = 1;
	switch stages {
		case 3:
		m_3 = instance_create_layer(x - 48 - (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(m_3, "enable", 0);
		variable_instance_set(m_3, "image", 4);
		variable_instance_set(m_3, "image_xscale", -1);
		p_3 = instance_create_layer(x + 48 + (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(p_3, "enable", 0);
		variable_instance_set(p_3, "image", 4);
		variable_instance_set(p_3, "image_xscale", 1);
	
		case 2:
		m_2 = instance_create_layer(x - 24 - (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(m_2, "enable", 0);
		variable_instance_set(m_2, "image", 2);
		variable_instance_set(m_2, "image_xscale", -1);
		p_2 = instance_create_layer(x + 24 + (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(p_2, "enable", 0);
		variable_instance_set(p_2, "image", 2);
		variable_instance_set(p_2, "image_xscale", 1);
	
		case 1:
		m_1 = instance_create_layer(x - 0 - (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(m_1, "enable", 0);
		variable_instance_set(m_1, "image_xscale", -1);
		p_1 = instance_create_layer(x + 0 + (x_off / 2), y + 0, "UI_Draw", Arrow_Button_24x24);
		variable_instance_set(p_1, "enable", 0);
		variable_instance_set(p_1, "image_xscale", 1);
		break;
		
		default:
		exit;
	}
}
timer++;
if (timer > 30){
	timer = 0;
}
if !(timer % 10){
	switch stages {
		case 3:
		variable_instance_set(m_3, "enable", enable);
		variable_instance_set(p_3, "enable", enable);
		case 2:
		variable_instance_set(m_2, "enable", enable);
		variable_instance_set(p_2, "enable", enable);
		case 1:
		variable_instance_set(m_1, "enable", enable);
		variable_instance_set(p_1, "enable", enable);
		break;
		case 0:
		exit;
	}
}

if (destroy == true){
	instance_destroy(m_1);
	instance_destroy(p_1);
	instance_destroy(m_2);
	instance_destroy(p_2);
	instance_destroy(m_3);
	instance_destroy(p_3);
	instance_destroy(self);
}