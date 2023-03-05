local Module = {}

function Module:predict_velocity(target_part, projectile_speed)
   local velocity = target_part.Velocity

   local distance = (workspace.CurrentCamera.CFrame.p - target_part.CFrame.p).Magnitude
   local time_to_hit = (distance / projectile_speed)

   local predicted_position = target_part.CFrame.p + (velocity * time_to_hit)
   local delta = (predicted_position - target_part.CFrame.p).Magnitude

   local final_projectile_speed = projectile_speed - 0.013 * projectile_speed ^ 2 * time_to_hit ^ 2

   time_to_hit += (delta / final_projectile_speed)

   return target_part.CFrame.p + (velocity * time_to_hit)
end

function Module:prediict_drop(target_part, projectile_speed, projectile_drop)
   local distance = (workspace.CurrentCamera.CFrame.p - target_part.CFrame.p).Magnitude
   local time_to_hit = (distance / projectile_speed)

   local final_projectile_speed = projectile_speed - 0.013 * projectile_speed ^ 2 * time_to_hit ^ 2
   time_to_hit += (distance / final_projectile_speed)

   local drop_timing = projectile_drop * time_to_hit ^ 2

   if not tostring(drop_timing):find("nan") then
       return drop_timing
   end
   return 0
end

return Module
