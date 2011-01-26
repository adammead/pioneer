define_model('sd_wing', {
	info = {
         	lod_pixels = {.1,20,50,0},
			bounding_radius = 10,
			materials = {'steel', 'w_glow'},
			},

	static = function(lod)
	    if lod == 1 then
	    	load_obj('sd_wing_coll.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
	    end
	    
		if lod > 1 then
			set_material('steel', .55,.65,.7,1,1.2,1.4,1.7,30)
			set_material('w_glow', 0,0,0,1,0,0,0,0,.7,1.5,2.5)

            use_material('steel')
			if lod > 2 then
				texture('sd_1.png')
   			else
   			    texture('sd_1_s.png')
			end
        	load_obj('sd_wing_1.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

			if lod > 2 then
            	texture('sd_2.png')
			else
			    texture('sd_2_s.png')
			end
			load_obj('sd_wing_2.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

			if lod > 2 then
				texture('sd_3.png')
			else
			    texture('sd_3_s.png')
			end
			load_obj('sd_wing_3.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
			
			if lod > 2 then
			    texture('sd_glow.png')
			else
			    texture('sd_glow_s.png')
			end
			use_material('w_glow')
            load_obj('sd_w_glow.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
        end
	end
})
            
define_model('stardust', {
	info = {
	        scale = 1.2,
			lod_pixels = {.1,20,100,0},
			bounding_radius = 35,
   			materials = {'steel', 'scoop', 'e_glow', 'win', 'thrusters'},
			tags = {'ship'},
            ship_defs = {
			{
					name='Stardust',
					forward_thrust = -200e5,
					reverse_thrust = 100e5,
					up_thrust = 15e5,
					down_thrust = -15e5,
					left_thrust = -15e5,
					right_thrust = 15e5,
					angular_thrust = 3e7,
					gun_mounts = 
					{
					{ v(0,0,-26), v(0,0,-1) },
					{ v(0,0,5), v(0,0,1) },
					},
					max_cargo = 100,
					max_laser = 2,
					max_fuelscoop = 0,
					capacity = 100,
					hull_mass = 100,
					price = 150000,
					hyperdrive_class = 4,
				}
			} 
		},  
		
	static = function(lod)
	    if lod == 1 then
	    	load_obj('sd_body_coll.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
	    end
	    
	    if lod > 1 then
			set_material('steel', .55,.65,.7,1,1.2,1.4,1.7,30)
            set_material('scoop', .2,.25,.3,1,.16,.3,.36,30)
			set_material('win', 0,0,0,1,1,1.5,2,100)
			set_material('thrusters', 0,0,0,0,0,0,0,1)

			use_material('steel')

   			if lod > 2 then
            	texture('sd_2.png')
			else
			    texture('sd_2_s.png')
			end
        	load_obj('sd_com_2.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
        	load_obj('sd_body_2.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

            if lod > 2 then
				texture('sd_3.png')
			else
			    texture('sd_3_s.png')
			end
            load_obj('sd_body_3.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

   			if lod > 2 then
				texture('sd_1.png')
   			else
   			    texture('sd_1_s.png')
			end
            load_obj('sd_com_1.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
        	load_obj('sd_body_1.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

			use_material('scoop')
            load_obj('sd_scoop.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

			if lod > 2 then
			    texture('sd_glow.png')
			else
			    texture('sd_glow_s.png')
			end
            use_material('e_glow')
            load_obj('sd_e_glow.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))

        	use_material('win')
        	texture(nil)
        	load_obj('sd_win.obj', Matrix.rotate(.5*math.pi,v(-1,0,0)))
        end	
        call_model('sd_wing',v(0,0,0),v(1,0,0),v(0,1,0),1)
	    call_model('sd_wing',v(0,0,0),v(-1,0,0),v(-1.666,-1,0),1)
	    call_model('sd_wing',v(0,0,0),v(-1,0,0),v(1.666,-1,0),1)

		use_material('thrusters')
        if lod > 1 then
	    	local B_T1 = v(0,16.517,13)
	    	local B_T2 = v(14.164,-8.498,13)
          	thruster(B_T1,v(0,0,1),20, true)
            xref_thruster(B_T2,v(0,0,1),20, true)
        end
	end,
	dynamic = function(lod)
	    set_material('e_glow', lerp_materials(os.clock()*.2,   {0,0,0,1,0,0,0,0,3,2,.7},
																{0,0,0,1,0,0,0,0,2,1.5,.7}))
 	end
})