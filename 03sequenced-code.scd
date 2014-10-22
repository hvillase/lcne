//==================================================
// sequenced - rhythmic code LCNE
// http://livecodenet.flujoalterno.com
//==================================================

// sequence A
Ndef(\unoA).play;
Ndef(\unoA)[0]={|f1=131,t_trig=1,amp=0.05| Pan2.ar(LFTri.ar(f1,0,LFTri.kr(2.5,0,0.1,0.2)),0)};

Ndef(\unoA).quant_(4)[1]= \set -> Pbind(\dur,Pseq([1.5,0.5],inf),\f1, Pseq([48,51,48,53].midicps,inf),\amp,0.2);
Ndef(\unoA).stop(2);

// sequence HH
Ndef(\hhH).play;
Ndef(\hhH)[0]={|freq=12000,vol=0.2,t_trig=1| Pan2.ar(MoogFF.ar(WhiteNoise.ar(vol),freq),0.1)*EnvGen.kr(Env.perc(0.01,0.1),t_trig)};

Ndef(\hhH).quant_(4)[1]=\set -> Pbind(\dur,1/4,\t_trig,1,\freq,Pseq([\12000,\12000,12000,\12000],inf));
Ndef(\hhH).stop(2);

// sequence BD 
Ndef(\bdH).play;
Ndef(\bdH)[0]={|frec=100,vol=0.9,t_trig=1| Pan2.ar(SinOsc.ar(frec,pi,vol)*EnvGen.kr(Env.perc(0.01,0.1),t_trig),0)};

Ndef(\bdH).quant_(4)[1]= \set -> Pbind(\dur, Pseq([1,0.75,0.25,0.25,0.25,0.5,1],inf), \vol, 0.9, \t_trig, 1, \frec,100);
Ndef(\bdH).stop;

// sequence B
Ndef(\smallSeq).play;

Ndef(\smallSeq)[0]={|f1,f2,t_trig=1,rel=0.1| Pan2.ar(SyncSaw.ar(f1,f2,0.1)*EnvGen.kr(Env.perc(0.01,rel),t_trig),0)};

Ndef(\smallSeq).quant_(4)[1]= \set -> Pbind(\dur, Pseq([1/2,1,1/2,2],inf), \f1, Pseq([80,130],inf),\f2,Prand([60,180,120,300],inf),\t_trig,1,\rel,0.1);

Ndef(\smallSeq).stop(2);

// sequence 8 bit

Ndef(\cd).play;

Ndef(\cd)[0]={|f1,t_trig=1,rel=0.03| Pan2.ar(LFTri.ar(f1,0,0.4)*EnvGen.kr(Env.perc(0.02,rel),t_trig))};

Ndef(\cd).quant_(4)[1] = \set -> Pbind(\dur, Pseq([1/4,Pn(1/4,4),1/4,1/2],inf),\f1, Pseq([160,80,120,400,80,230], inf), \t_trig, 1,\rel, Pseq([0.03,Pn(0.01,3),0.5,1],inf));

Ndef(\cd).stop(2);
