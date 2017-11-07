deco = {}

local stand_table = { --name, material
{'White Deco Lamp', 'white'},
{'Red Deco Lamp', 'red'},
{'Green Deco Lamp', 'green'},
{'Yellow Deco Lamp', 'yellow'},
{'Orange Deco Lamp', 'orange'},
{'Pink Deco Lamp', 'pink'},
}

for i in ipairs (stand_table) do
	local name = stand_table[i][1]
	local material = stand_table[i][2]
	local invimg = stand_table[i][3]
	
minetest.register_node('deco:lamp_off_' ..material, {
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
		node.name = 'deco:deco_lamp_' ..material
		minetest.set_node(pos, node)
	end,
})

minetest.register_node('deco:deco_lamp_' ..material, {
	description = name,
	drawtype = 'mesh',
	mesh = 'deco_lamp.obj',
	tiles = {'deco_'..material..'.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=1, not_in_creative_inventory=1},
	light_source =  14,
	paramtype = 'light',
	paramtype2 = 'facedir',
	drop= 'deco:lamp_off' ..material,
	selection_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.35, -.5, -.35, .35, .25, .35}, -- Right, Bottom, Back, Left, Top, Front
		},
		on_rightclick = function (pos, node, puncher)
		node.name = 'deco:lamp_off_' ..material
		minetest.set_node(pos, node)
	end,
})
end

local table_table = { --name, material
{'Wooden Table', 'wood'},
{'Acacia Table', 'acacia_wood'},
{'Jungle Table', 'junglewood'},
{'Pine Table', 'pine_wood'},
{'Aspen Table', 'aspen_wood'}
}

for i in ipairs (table_table) do
	local name = table_table[i][1]
	local material = table_table[i][2]
	local invimg = table_table[i][3]

minetest.register_node('deco:table_' ..material, {
    description = name,
	tiles = {'default_'..material..'.png'},
	drawtype = 'nodebox',
	paramtype = 'light',
	groups = {flammable=2},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, -0.3125, 0.3125, -0.3125},
			{-0.5, -0.5, 0.3125, -0.3125, 0.3125, 0.5},
			{0.3125, -0.5, 0.3125, 0.5, 0.3125, 0.5},
			{0.3125, -0.5, -0.5, 0.5, 0.3125, -0.3125},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, 0.5},
		}
	}
})
end