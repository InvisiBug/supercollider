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



(
~fn = {
	var sig;
	sig = SinOsc.ar(freq: 260);
	sig = sig * 0.1;
	sig ! 2;
};
)

x = ~fn.play;

















