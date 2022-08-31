dancing_maki = false
dancing_yoshi = false
makiOnScreen =  false
yoshiOnScreen = false

makicanHey = false
yoshicanHey = false

sf = 0.96

--860 330
--540 260

function onStartSong()

setPropertyFromClass('flixel.FlxG','sound.music.volume',1)

end

function onCreatePost()

setProperty('gf.visible',false)
end
function onCreate()
setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
setProperty('skipCountdown',true)
makeLuaSprite('colorbg','colorbg',-175,-185)
addLuaSprite('colorbg')
makeLuaSprite('lineartbg','lineartbg',-99,-102)
addLuaSprite('lineartbg')



	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf'); --Character json file for the death animation


makeAnimatedLuaSprite('maki','maki',785,160)
addAnimationByIndices('maki','dance0','maki','0,1,2,3,4,5',24)
addAnimationByIndices('maki','dance1','maki','6,7,8,9,10,11',24)
addAnimationByIndices('maki','dance2','maki','12,13,14,15,16,17',24)
addAnimationByIndices('maki','dance3','maki','18,19,20,21,22,23',24)
addAnimationByIndices('maki','enter','maki','24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39',24)
addAnimationByIndices('maki','hey','maki','40,41,42,43,44,45,46,47',24)
addLuaSprite('maki')

makeAnimatedLuaSprite('yoshi','yoshi',539,152)
addAnimationByIndices('yoshi','dance0','yoshi','0,1,2,3,4,5',24)
addAnimationByIndices('yoshi','dance1','yoshi','6,7,8,9,10,11',24)
addAnimationByIndices('yoshi','dance2','yoshi','12,13,14,15,16,17',24)
addAnimationByIndices('yoshi','dance3','yoshi','18,19,20,21,22,23',24)
addAnimationByIndices('yoshi','enter','yoshi','24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55',24)
addAnimationByIndices('yoshi','hey','yoshi','56,57,58,59,60,61,62',24)
addLuaSprite('yoshi')




setScrollFactor('yoshi',sf,sf)
setScrollFactor('maki',sf,sf)
setScrollFactor('lineartbg',sf,sf)
setScrollFactor('colorbg',sf,sf)
setScrollFactor('lineartfg',sf,sf)
setScrollFactor('colorfg',sf,sf)




makeLuaSprite('colorfg','colorfg',754,-211)
addLuaSprite('colorfg')
makeLuaSprite('lineartfg','lineartfg',756,-143)
addLuaSprite('lineartfg')

setProperty('dad.danceEveryNumBeats',4)




makeLuaSprite('shadow','shadow',197,346)
addLuaSprite('shadow')
setBlendMode('shadow','multiply')


makeLuaSprite('lighting','lighting',44,01)
addLuaSprite('lighting')
setBlendMode('lighting','add')
setScrollFactor('light',sf,sf)

makeLuaSprite('light','light',-44,-30)
addLuaSprite('light',true)
setProperty('light.alpha',0.39)
setBlendMode('light','add')
setScrollFactor('light',0.5,0.5)

makeLuaSprite('shade','shade',61,-227)
addLuaSprite('shade',true)
setBlendMode('shade','multiply')
setScrollFactor('shade',0.5,0.5)

end


function onBeatHit()


if string.starts(getProperty('yoshi.animation.curAnim.name'),'dance') then
	if dancing_maki and makiOnScreen then objectPlayAnimation('maki','dance'..curBeat % 4) end
	if dancing_yoshi and yoshiOnScreen then objectPlayAnimation('yoshi','dance'..curBeat % 4) end
end



if (curBeat+8) % 16 == 14 then
	if yoshicanHey then objectPlayAnimation('yoshi','hey') end
	if makicanHey then objectPlayAnimation('maki','hey') end
end


if (curBeat+8) % 16 == 0 then
	if dancing_yoshi and yoshiOnScreen then objectPlayAnimation('yoshi','dance'..curBeat % 4) end
	if dancing_maki and makiOnScreen then objectPlayAnimation('maki','dance'..curBeat % 4) end
end


if curBeat == 464 then

setProperty('camGame.visible',false)

end

end





function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end


function onUpdatePost()

setProperty('yoshi.visible',yoshiOnScreen)
setProperty('maki.visible',makiOnScreen)

end

function onEvent(n,v,b)

if n == 'canHey' then
if v == 'yoshi' then yoshicanHey = b == 'true' end
if v == 'maki' then makicanHey = b == 'true' end
end

if n == 'Heyo' then

dancing_maki = false
dancing_yoshi = false
objectPlayAnimation('yoshi','hey')
objectPlayAnimation('maki','hey')
runTimer('nowDance',(crochet*2)/1000)
end
if n == 'ENTER' then
	if v == 'yoshi' then
		yoshiOnScreen = true
		objectPlayAnimation('yoshi','enter')
		runTimer('yoshidance',1.1)
	end
	if v == 'maki' then
		makiOnScreen = true
		objectPlayAnimation('maki','enter')
		doTweenX('makidance','maki',404,(crochet*6)/1000,'linear')
	end
end


end



function onTweenCompleted(t)
if t == 'makidance' then
dancing_maki = true
objectPlayAnimation('maki','dance'..curBeat % 4) 
end

end

function onTimerCompleted(t,l,ll)
if t == 'yoshidance' then
dancing_yoshi = true
objectPlayAnimation('yoshi','dance'..curBeat % 4) 
end

if t == 'nowDance' then
dancing_maki = true
dancing_yoshi = true
	if dancing_yoshi and yoshiOnScreen then objectPlayAnimation('yoshi','dance'..curBeat % 4) end
	if dancing_maki and makiOnScreen then objectPlayAnimation('maki','dance'..curBeat % 4) end
end

end