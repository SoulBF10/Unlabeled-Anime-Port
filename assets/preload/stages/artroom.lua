function onCreate()

setHealth(0.1)



sprite(-3099.8,-65,'bg',false)
spriteA(582.9,342,'couch',false,0)
sprite(111,44,'canvas',false)

	addAnimationByIndices('couch','couch2','couch','1',0)

spriteA(207,250,'drawings',false,0)
objectPlayAnimation('drawings','drawings',true,getRandomInt(0,17))
objectPlayAnimation('couch','couch',true,1)

sprite(-288.1,-74,'overlay',true)
setBlendMode('overlay','multiply')
setProperty('overlay.alpha',0.24)
setScrollFactor('overlay',0,0)
end

function onCreatePost()

setScrollFactor('couch',0.5,0.5)
setScrollFactor('boyfriend',0.5,0.5)
setScrollFactor('bg',0.5,0.5)
setScrollFactor('dad',1.2,1.2)
setScrollFactor('canvas',1.1,1.1)
setObjectOrder('boyfriendGroup',getObjectOrder('canvas'))

end


function sprite(x,y,name,front)
	makeLuaSprite(name,'suspai/'..name,x,y)
	addLuaSprite(name,front)
end
function spriteA(x,y,name,front,fps)
	makeAnimatedLuaSprite(name,'suspai/'..name,x,y)
	addAnimationByPrefix(name,name,name,fps,false)
	objectPlayAnimation(name,name,false)
	addLuaSprite(name,front)
end

function onSpawnNote(id,d,t,s)

if getPropertyFromGroup('notes',id,'strumTime') > 43640 and not getPropertyFromGroup('notes',id,'mustPress') then
setPropertyFromGroup('notes',id,'animSuffix','-alt')

end


end


function onSectionHit()


setProperty('defaultCamZoom',1)
if mustHitSection and curBeat < 152 then

setProperty('defaultCamZoom',1.4)

end



end





function onStepHit()



if curStep == (153*4) then

doTweenX('ddd','boyfriend',682,0.1)

end

end
function onBeatHit()


--runHaxeCode("getVar('komi').dance()")
if curBeat == 152 then


setObjectOrder('boyfriendGroup',getObjectOrder('dadGroup'))

end


end



