
----LOADING
local mod_storage = minetest.get_mod_storage()

if mod_storage:get_string("note") == "" then
	mod_storage:set_string("note", "Write down your notice here")
end


--avoid opengl errors by delay
minetest.register_on_connect(function()
	
	minetest.after(1, function()
		minetest.ui.minimap:show()
		minetest.ui.minimap:set_mode(3)
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
		
		
		"label[0.1,1.1;Map Visible]" ..
		"dropdown[2.1,1;1.25;Visible;true,false;1]"
		
		--"vertlabel[-0.2,0.4;PARAMETERS]" ..
		
		--"textlist[0.4,1;5,1.5;rec_info;]" ..
		
		--"field[0.4,3.1;2.4,1;rec_timer;Timing in seconds:;5]" ..
		
		--"field[3.08,3.1;2.4,1;rec_fps;Framerate:;10]" ..
		
		--"button_exit[0.1,3.5;2.43,1;rec_btn;Start]" ..
		
		--"button[2.8,3.5;2.41,1;stop_btn;Stop]"
	)
end
