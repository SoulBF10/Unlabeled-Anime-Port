function onCreate()
--So i don't have to add the event on the event.json
runHaxeCode([[

game.eventPushedMap.set('addCharacter',true)]]

)

end
function onCreatePost()

sprite(-641.35,-209,'bg',false)

triggerEvent('addCharacter','najimi','-41,247')
runHaxeCode([[


getVar('najimi').visible = false;



]])

setObjectOrder('boyfriendGroup',getObjectOrder('gfGroup'))

sprite(-641.35,-260.45,'desks',true)

scaleObject('bg',1.26,1.26)
scaleObject('desks',1.26,1.26)

setScrollFactor('bg',0.6,0.6)
setScrollFactor('desks',1.2,1.2)



runTimer('blink1',6,0)

runTimer('blink4',4,0)

setProperty('gf.visible',false)
setProperty('gf.flipX',false)





initLuaShader('bloom')
setCameraShader('game','bloom')

initLuaShader('chromaticAbberation')
setSpriteShader('desks','chromaticAbberation')
setShaderInt('desks','amount',3)


end
function sprite(x,y,name,front)
	makeLuaSprite(name,'komi/'..name,x,y)
	addLuaSprite(name,front)
end



function onStartCountdown()


runTimer('blink2',9,0)

end

function onTimerCompleted(t,l,ll)

if t == 'unblink1' then
	blinkAnim(false,'dad')
end
if t == 'blink1' then
	blinkAnim(true,'dad')
	runTimer('unblink1',0.08)
end

if t == 'unblink2' then
	blinkAnim(false,'boyfriend')
end
if t == 'blink2' then
	blinkAnim(true,'boyfriend')
	runTimer('unblink2',0.08)
end


if t == 'unblink4' then
	blinkAnim(false,'gf')
end
if t == 'blink4' then
	blinkAnim(true,'gf')
	runTimer('unblink4',0.08)
end


if t == 'unblink3' then
	blinkAnim2(false,'najimi')
end
if t == 'blink3' then
	blinkAnim2(true,'najimi')
	runTimer('unblink3',0.1)
end

if t == 'bfWalkDown' then
	
doTweenY('bfdo','gf',213,0.3,'sineIn')
	runTimer('bfWalkUp',0.3)
end
if t == 'bfWalkUp' then
	
doTweenY('bfup','gf',193,0.3,'sineOut')
end
end

function blinkAnim(blinko,char)

if getProperty(char..'.animation.curAnim.name') == 'idle'..getProperty(char..'.idleSuffix') then
playAnim(char,'blink'..getProperty(char..'.idleSuffix'),true,false,getProperty(char..'.animation.curAnim.curFrame'))
end
if not blinko then

if getProperty(char..'.animation.curAnim.name') == 'blink'..getProperty(char..'.idleSuffix') then
playAnim(char,'idle'..getProperty(char..'.idleSuffix'),true,false,getProperty(char..'.animation.curAnim.curFrame'))
end
end

end



function blinkAnim2(blinko,char)


runHaxeCode([[

if(getVar('najimi').animation.curAnim.name == 'idle'){
getVar('najimi').playAnim('blink',true,false,getVar('najimi').animation.curAnim.curFrame);

}

]])
if not blinko then
runHaxeCode([[
if(getVar('najimi').animation.curAnim.name == 'blink'){
getVar('najimi').playAnim('idle',true,false,getVar('najimi').animation.curAnim.curFrame);
}
]])

end

end





function onBeatHit()

if curBeat == 72 then
setProperty('gf.visible',true)
doTweenX('bfEnter','gf',880,2.7)
runTimer('bfWalkDown',0.6,4)
end
if curBeat == 122 then
runHaxeCode([[



getVar('najimi').visible = true;



]])
runTimer('blink3',5,0)
end



if curBeat == 164 then

doTweenAlpha('ddd','camHUD',0,1)
doTweenColor('dddd','boyfriend','000000',6)
doTweenColor('ddfdd','gf','000000',6)
doTweenColor('ddgdd','bg','333333',6)
doTweenColor('ddhdd','desks','000000',6)

runHaxeCode([[
FlxTween.color(getVar('najimi'),6,0xffffffff,0xff000000);
]])
end

if curBeat == 202 then

doTweenColor('dddd','boyfriend','FFFFFF',3)
doTweenColor('ddhdd','gf','FFFFFF',3)
doTweenColor('dddfd','bg','FFFFFF',3)
doTweenColor('ddddd','desks','FFFFFF',3)

runHaxeCode([[
FlxTween.color(getVar('najimi'),3,0xff000000,0xffffffff);
]])
end
if curBeat == 205 then

doTweenAlpha('ddd','camHUD',1,1)

end


end