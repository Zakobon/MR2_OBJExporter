switch stages {
	case 3:
	var p_3_active = variable_instance_get(p_3, "active");
	var m_3_active = variable_instance_get(m_3, "active");
	if (m_3_active == true){
		m3_active = 1;
	}
	if (p_3_active == true){
		p3_active = 1;
	}
	variable_instance_set(p_3, "active", false);
	variable_instance_set(m_3, "active", false);
		
	case 2:
	var p_2_active = variable_instance_get(p_2, "active");
	var m_2_active = variable_instance_get(m_2, "active");
	if (m_2_active == true){
		m2_active = 1;
	}
	if (p_2_active == true){
		p2_active = 1;
	}
	variable_instance_set(p_2, "active", false);
	variable_instance_set(m_2, "active", false);
	
	case 1:
	var p_1_active = variable_instance_get(p_1, "active");
	var m_1_active = variable_instance_get(m_1, "active");
	if (m_1_active == true){
		m1_active = 1;
	}
	if (p_1_active == true){
		p1_active = 1;
	}
	variable_instance_set(p_1, "active", false);
	variable_instance_set(m_1, "active", false);
}
