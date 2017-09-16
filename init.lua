--0 off 1-3 surface 4-6 radar


----LOADING
local mod_storage = minetest.get_mod_storage()


print("IT'S HEREEEERERSER")
print(mod_storage:get_int("show"))

if mod_storage:get_string("show") == "" then
	mod_storage:set_string("show", 1)
end

if mod_storage:get_int("set_mode") == 0 then
	mod_storage:set_int("set_mode", 1)
end

if mod_storage:get_int("set_shape") == 0 then
	mod_storage:set_int("set_shape", 0)
end



--avoid opengl errors by delay
minetest.register_on_connect(function()
	
	minetest.after(1, function()
		minetest.ui.minimap:show()
		minetest.ui.minimap:set_mode(1)
		minetest.ui.minimap:set_shape(0)
		show_minimap_form_spec()
	end)
	
end)

------




---MODIFYING


minetest.register_chatcommand("mapsettings", {
	description = "Modify minimap settings",
	func = function()
		print("test")
		show_minimap_form_spec()
end})

function show_minimap_form_spec()
	minetest.show_formspec("hud_settings", 
		"size[6,6]" ..
		
		"bgcolor[#000000;false]" ..
		
		"button_exit[5.2,-0.15;1,0.7;close;×]" ..
		
		"label[0.6,0;Advanced Minimap Settings]" ..
		
		
		--visible setting
		"label[0.1,1.1;Map_Visible]" ..
		"dropdown[2.1,1;1.25;Map_Visible;true,false;1]"..
		
		--mode setting- surface & radar
		"label[0.1,2.1;Map_Mode]" ..
		"dropdown[2.1,2;2.25;Map_Mode;Surface X1,Surface X2,Surface X4,Radar X1,Radar X2,Radar X4;1]"..
		
		--map shape
		"label[0.1,3.1;Map_Shape]" ..
		"dropdown[2.1,3;1.75;Map_Shape;Square,Round;1]"
		
		
		--"button[3.75,5.5;2.5,1;Save_And_Apply;Save & Apply]"
	)
end

--recieve fields
minetest.register_on_formspec_input(function(formname, fields)
	if formname == "hud_settings" and not fields.quit then
	
		if fields.Map_Visible then
			print(fields.Map_Visible)
			if fields.Map_Visible == "true" then
				minetest.ui.minimap:show()
				mod_storage:set_string("show", 1)
			elseif fields.Map_Visible == "false" then
				minetest.ui.minimap:hide()
				mod_storage:set_string("show", 0)
			end
		end
		if fields.Map_Mode then
			if fields.Map_Mode == "Surface X1" then
				mod_storage:set_int("set_mode", 1)
				minetest.ui.minimap:set_mode(1)
			elseif fields.Map_Mode == "Surface X2" then
				mod_storage:set_int("set_mode", 2)
				minetest.ui.minimap:set_mode(2)
			elseif fields.Map_Mode == "Surface X4" then
				mod_storage:set_int("set_mode", 3)
				minetest.ui.minimap:set_mode(3)
			elseif fields.Map_Mode == "Radar X1" then
				mod_storage:set_int("set_mode", 4)
				minetest.ui.minimap:set_mode(4)
			elseif fields.Map_Mode == "Radar X2" then
				mod_storage:set_int("set_mode", 5)
				minetest.ui.minimap:set_mode(5)
			elseif fields.Map_Mode == "Radar X4" then
				mod_storage:set_int("set_mode", 6)
				minetest.ui.minimap:set_mode(6)
			end
		end
		if fields.Map_Shape then
			if fields.Map_Shape == "Square" then
				minetest.ui.minimap:set_shape(0)
				mod_storage:set_int("set_shape", 0)
			elseif fields.Map_Shape == "Round" then
				minetest.ui.minimap:set_shape(1)
				mod_storage:set_int("set_shape", 1)
			end
		end
	
	
	end
end)
