//===============================
// Not sequenced code
//===============================
s.boot; // if Server doesnt start yet

// code 1
Ndef(\oko).play;

Ndef(\oko,{Pan2.ar(LFNoise0.ar(1.0.rrand(12.0))*LFTri.ar(rrand(200,700),0,0.15),-1.rrand(1.0))*EnvGen.kr(Env.perc(0.2.rrand(0.5),0.5.rrand(2.5)),doneAction:2)});

// code 2
Ndef(\okl).play;

Ndef(\okl,{LFTri.ar([rrand(100.0,2000.0),rrand(100.0,2000.0)],0,LFNoise0.kr(5))*EnvGen.kr(Env.perc(0.01,5))*0.2});

// code 3: un pulso
Ndef(\dos).play;

Ndef(\dos, {|f1=120,f2=300| LFTri.ar([f1,f2+rrand(20.0,600.0)],0,LFNoise0.kr(50))*EnvGen.kr(Env.perc(0.03,1),doneAction:2)*0.3});

Ndef(\dos).rebuild;

// code 4: Fade-Noisy
Ndef(\wh).play;

Ndef(\wh,{|time=9.5| Pan2.ar(SinOsc.ar(300.0.rrand(1450.0),0,Line.kr(0.01,0.25,time,doneAction:2))*BrownNoise.ar(Line.kr(0.01,0.55,time,doneAction:2)),0)});

// code 5: like FeedBack
Ndef(\cc).play;

Ndef(\cc,{Pan2.ar(LFTri.ar(100.0.rrand(2000.0),0,SinOsc.kr(16,0,0.1,0.1)),0)*EnvGen.kr(Env.perc(9,0.001,-4),doneAction:2)}*0.25);

// code 6: continous
Ndef(\rms).play;

Ndef(\rms,{|sum=100, mod=70|Mix(Array.fill(3,{Pan2.ar(SinOsc.ar(((Array.series(10,rrand(200,210),100).sqrt)+sum).postln,0,0.2),0,0.3*Saw.ar(mod,0.75),rrand(-1.0,1.0),1.0.rand)}))*0.4});

// code 7
Ndef(\uno).play;

Ndef(\uno, {LFTri.ar({200.0.rrand(510.0)}.dup(3),0,{0.1.rand}.dup(3))});

//===============================
// Sequenced code
//===============================

// code 8
Ndef(\osc).play;

Ndef(\osc)[0]={|frec=13000,t_trig=1,pan=0,rel=0.3,vol=0.1|Pan2.ar(LFTri.ar(frec,0,vol),pan)*EnvGen.kr(Env.perc(0.01,rel),t_trig)};

Ndef(\osc)[1]=\set -> Pbind(\dur,Prand([0.012,0.025,0.03,0.05,8],inf),\frec,Pwhite(100,10000,inf),\t_trig,1,\pan, Pseq([1,-1,0],inf),\rel,Pwhite(0.01,0.05,inf),\vol,Pwhite(0.1,0.2,inf));

Ndef(\osc).stop(3);

// code 9
Ndef(\atmos).play;

Ndef(\atmos)[0]={|f1=222, pan=0,t_trig=1,rel=0.09| Pan2.ar(DynKlank.ar(`[[f1,f1*1.62,f1*1.9,f1*4.8],nil,[0.5,0.5,0.8,0.5]],PinkNoise.ar(0.0024)),pan,1)*EnvGen.kr(Env.perc(0.02,rel),t_trig)*3};

Ndef(\atmos).quant_(4)[1]=\set -> Pbind(\dur,Pseq([Pn(1/2,1),6,1,8],inf),\f1,Pbrown(100,700,10,inf),\t_trig, 1,\rel,Pwhite(0.09,1.5));

Ndef(\atmos).stop(2);

//===============================
// From the scratch section
//===============================
