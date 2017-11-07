deco_lamp = {}

local stand_table = { --name, material, invimg
{'White Deco Lamp', 'white'},
{'Red Deco Lamp', 'red'}
}

for i in ipairs (stand_table) do
	local name = stand_table[i][1]
	local material = stand_table[i][2]
	local invimg = stand_table[i][3]
	
minetest.register_node('deco_lamp:lamp_off_' ..material, {
	description = name,
	drawtype = 'mesh',
	mesh = 'deco_lamp.obj',
	tiles = {'deco_'..material..'.png'},
	groups = {cracky=2, oddly_breakably_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35}, 
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35},
		},
	on_rightclick = function (pos, node, puncher)
		node.name = "deco_lamp:deco_lamp_" ..material
		minetest.set_node(pos, node)
	end,
})

minetest.register_node('deco_lamp:deco_lamp_' ..material, {
	description = name,
	drawtype = 'mesh',
	mesh = 'deco_lamp.obj',
	tiles = {'deco_'..material..'.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=1, not_in_creative_inventory=1},
	light_source =  14,
	paramtype = 'light',
	paramtype2 = 'facedir',
	drop= 'deco_lamp:lamp_off' ..material,
	selection_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35}, -- Right, Bottom, Back, Left, Top, Front
		},
		on_rightclick = function (pos, node, puncher)
		node.name = "deco_lamp:lamp_off_" ..material
		minetest.set_node(pos, node)
	end,
})
end