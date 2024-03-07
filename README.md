# lunar | lua script

## Info

***Source of components can be found in the sources folder in components. the components that are used are minified for less file space.***

## File Initalization 

```lua
assert(writefolder and "Your executor isn't supported.")
assert(writefile and "Your executor isn't supported.")
--
writefolder("Vynx")
writefolder("Vynx/components")
writefolder("Vynx/themes")
writefolder("Vynx/configs")
--
writefile("Vynx/components/Utility.lua", game:HttpGet(""))
writefile("Vynx/components/Math.lua", game:HttpGet(""))
writefile("Vynx/components/Visual.lua", game:HttpGet(""))
writefile("Vynx/components/Color.lua", game:HttpGet(""))
writefile("Vynx/components/Tween.lua", game:HttpGet(""))
```
## Loadstring
```lua
loadstring(game:HttpGet("https://rawgithubusercontent.com/Streekaiz/Vynx/source.lua"))()
```
