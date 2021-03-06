/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor", "Resident")

/datum/job/assistant/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	switch(H.backbag)
		if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
		if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(H), slot_back)
		if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
	if (H.mind.role_alt_title)
		switch(H.mind.role_alt_title)
			if("Visitor") //I doubt someone visiting the station would want to wear an ugly grey uniform
				H.equip_to_slot_or_del(new /obj/item/clothing/under/assistantformal(H), slot_w_uniform)

			if("Resident")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/color/white(H), slot_w_uniform)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	return 1

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
