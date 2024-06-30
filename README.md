# lunar | lua script

## Info

***Source of components can be found in the sources folder in components. the components that are used are minified for less file space.***

## File Initalization 

```lua
assert(writefolder and "Your executor isn't supported.")
assert(writefile and "Your executor isn't supported.")
--
writefolder("Lunar")
writefolder("Lunar/components")
writefolder("Lunar/themes")
writefolder("Lunar/configs")
--
writefile("Lunar/components/Library.lua", game:HttpGet("https://github.com/Streekaiz/Lunar/blob/main/comps/unminified/Library.lua"))
writefile("Lunar/components/Utility.lua", game:HttpGet("https://github.com/Streekaiz/Lunar/blob/main/comps/minfied/Functions.lua"))
writefile("Lunar/components/Math.lua", game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Math.lua"))
writefile("Lunar/components/Color.lua", game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Color.lua"))
writefile("Lunar/components/Tween.lua", game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/comps/minified/Tween.lua"))
```
## Loadstring
```lua
loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Lunar/source.lua"))()
```
