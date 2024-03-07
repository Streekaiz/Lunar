local a={}local b,c,d,e,f,g,h,i,j,k,l=math.huge,math.pi,math.clamp,math.round,math.abs,math.floor,math.random,math.sin,math.cos,math.rad,math.pi/2;a.EasingStyle={["Enum.EasingStyle.Linear"]={["In"]=function(m)return m end,["Out"]=function(m)return m end,["InOut"]=function(m)return m end},["Enum.EasingStyle.Cubic"]={["In"]=function(m)return m^3 end,["Out"]=function(m)return(m-1)^3+1 end,["InOut"]=function(m)if m<=0.5 then return(4*m)^3 else return(4*(m-1))^3+1 end end},["Enum.EasingStyle.Quad"]={["In"]=function(m)return m^2 end,["Out"]=function(m)return-(m-1)^2+1 end,["InOut"]=function(m)if m<=0.5 then return(2*m)^2 else return(-2*(m-1))^2+1 end end},["Enum.EasingStyle.Quart"]={["In"]=function(m)return m^4 end,["Out"]=function(m)return-(m-1)^4+1 end,["InOut"]=function(m)if m<=0.5 then return(8*m)^4 else return(-8*(m-1))^4+1 end end},["Enum.EasingStyle.Quint"]={["In"]=function(m)return m^5 end,["Out"]=function(m)return(m-1)^5+1 end,["InOut"]=function(m)if m<=0.5 then return(16*m)^5 else return(16*(m-1))^5+1 end end},["Enum.EasingStyle.Sine"]={["In"]=function(m)return i(l*m-l)end,["Out"]=function(m)return i(l*m)end,["InOut"]=function(m)return 0.5*i(c*m-l)+0.5 end},["Enum.EasingStyle.Exponential"]={["In"]=function(m)return 2^(10*m-10)-0.001 end,["Out"]=function(m)return 1.001*-2^(-10*m)+1 end,["InOut"]=function(m)if m<=0.5 then return 0.5*2^(20*m-10)-0.0005 else return 0.50025*-2^(-20*m+10)+1 end end},["Enum.EasingStyle.Back"]={["In"]=function(m)return m^2*(m*(1.70158+1)-1.70158)end,["Out"]=function(m)return(m-1)^2*((m-1)*(1.70158+1)+1.70158)+1 end,["InOut"]=function(m)if m<=0.5 then return 2*m*m*(2*m*(2.5949095+1)-2.5949095)else return 0.5*(m*2-2)^2*((m*2-2)*(2.5949095+1)+2.5949095)+1 end end},["Enum.EasingStyle.Bounce"]={["In"]=function(m)if m<=0.25/2.75 then return-7.5625*(1-m-2.625/2.75)^2+0.015625 elseif m<=0.75/2.75 then return-7.5625*(1-m-2.25/2.75)^2+0.0625 elseif m<=1.75/2.75 then return-7.5625*(1-m-1.5/2.75)^2+0.25 else return 1-7.5625*(1-m)^2 end end,["Out"]=function(m)if m<=1/2.75 then return 7.5625*m*m elseif m<=2/2.75 then return 7.5625*(m-1.5/2.75)^2+0.75 elseif m<=2.5/2.75 then return 7.5625*(m-2.25/2.75)^2+0.9375 else return 7.5625*(m-2.625/2.75)^2+0.984375 end end,["InOut"]=function(m)if m<=0.125/2.75 then return 0.5*(-7.5625*(1-m*2-2.625/2.75)^2+0.015625)elseif m<=0.375/2.75 then return 0.5*(-7.5625*(1-m*2-2.25/2.75)^2+0.0625)elseif m<=0.875/2.75 then return 0.5*(-7.5625*(1-m*2-1.5/2.75)^2+0.25)elseif m<=0.5 then return 0.5*(1-7.5625*(1-m*2)^2)elseif m<=1.875/2.75 then return 0.5+3.78125*(2*m-1)^2 elseif m<=2.375/2.75 then return 3.78125*(2*m-4.25/2.75)^2+0.875 elseif m<=2.625/2.75 then return 3.78125*(2*m-5/2.75)^2+0.96875 else return 3.78125*(2*m-5.375/2.75)^2+0.9921875 end end},["Enum.EasingStyle.Elastic"]={["In"]=function(m)return-2^(10*(m-1))*i(c*2*(m-1-0.3/4)/0.3)end,["Out"]=function(m)return 2^(-10*m)*i(c*2*(m-0.3/4)/0.3)+1 end,["InOut"]=function(m)if m<=0.5 then return-0.5*2^(20*m-10)*i(c*2*(m*2-1.1125)/0.45)else return 0.5*2^(-20*m+10)*i(c*2*(m*2-1.1125)/0.45)+1 end end},["Enum.EasingStyle.Circular"]={["In"]=function(m)return-Sqrt(1-m^2)+1 end,["Out"]=function(m)return Sqrt(-(m-1)^2+1)end,["InOut"]=function(m)if m<=0.5 then return-Sqrt(-m^2+0.25)+0.5 else return Sqrt(-(m-1)^2+0.25)+0.5 end end}}return a.EasingStyle