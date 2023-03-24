// Stop Sound ( cmd +. )
// Show intellisense ( shift + cmd + space)
// Clear post window (cmd + shift + p)
// Run line (cmd + return)
// Search docs (cmd + shift + d)


(
{
	[SinOsc.ar(130), SinOsc.kr(130), SinOsc.kr(130)]
}.plot
)

var freq = [9.1770 ,   11.5623   , 13.7500 ,   18.3540    ,23.1247  ,  30.8677  ,  36.7081    ,46.2493,    61.7354   , 73.4162  ,  97.9989 ,  123.4708  , 146.8324  , 195.9977,   246.9417 ,  329.6276,   391.9954  , 493.8833  , 659.2551  , 783.9909]

{freq.do(freq,SinOsc.ar(freq).play)}


// Simple UGens
{ SinOsc.ar(300, mul: 0.1) ! 2 }.play;
{ LFTri.ar(300, mul: 0.1) ! 2 }.play;
{ Pulse.ar(300,  mul: 0.1) ! 2 }.play;
{ Saw.ar(300, mul:0.1) ! 2 }.play;


// Demo of aliasing
{ LFSaw.ar( XLine.kr(20, 20000, 10).poll ) * 0.1 ! 2 }.play
// No aliasing
{ Saw.ar( XLine.kr(20, 20000, 10).poll ) * 0.1 ! 2 }.play


// Plots
{ SinOsc.ar(300, mul: 0.1) ! 2 }.plot;
{ LFTri.ar(300, mul: 0.1) ! 2 }.plot;
{ Pulse.ar(300,  mul: 0.1) ! 2 }.plot;
{ Saw.ar(300, mul:0.1) ! 2 }.plot;


// Simple synth saved, played and stopped
(
~fn = {
	var sig;
	sig = SinOsc.ar(freq: 260);
	sig = sig * 0.1;
	sig ! 2;
};
)

x = ~fn.play;

x.free;



// Calling and messing with UGen
(
~fn2 = {
	arg inputFreq = 260, freqTime = 2;
	var sig;
	
	inputFreq = inputFreq.lag(freqTime);
	
	sig = SinOsc.ar(freq: inputFreq);
	sig = sig * 0.1;
	sig ! 2;
};
)

x = ~fn2.play;

x.set(\inputFreq, exprand(200,2000));

x.free; // Stop straight away

x.release(3) // Fade out in time






// Beach simulator
(
~fn3 = {
	arg amp = 0.2;
	var sig, mod;
	
	mod = SinOsc.kr(freq:1/4, phase:3pi / 2, mul:0.5, add:0.5); // 3pi/2 to start amplitude at 0
	sig = PinkNoise.ar(amp ! 2);
	sig = sig * mod;
	sig. Limiter.ar(sig)
	
};
)

x = ~fn3.play;

~fn.plot;

x.free; // Stop straight away

x.release(3) // Fade out in time

s.meter;

















