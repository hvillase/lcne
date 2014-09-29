//=============================================
//Step 1 LiveCodeNet Ensamble start code
//=============================================
s.boot; 
s.meter;
s.makeGui;

/*s.queryAllNodes; // to see my active nodes
s.plotTree; // to see my active nodes as plot
s.quit;*/

//=============================================
//Step 2  Connection to Router
//=============================================
(
q = ();
NetAddr.broadcastFlag = true;
q.addrs = (0..7).collect { |x| 
		NetAddr("255.255.255.255", 57120 + x)
};
q.sendAll = { |q ... args|
		q.addrs.do { |addr|
				addr.sendMsg(*args)
		}; ""
}
);

//===============================================
//Step 3 History - to share data with others 
//===============================================
(
History.start;
History.makeWin;

OSCdef(\hist, { |msg| 
	/*msg.postln;*/
	History.enter(msg[2].asString,msg[1]);
}, \hist).fix;
History.localOff;

History.forwardFunc = { |code| 
	q.sendAll(\hist, \hernani, code);
};
);

//============================================================
//Step 4 (optional, just if you want to play in sync) 
//requires BenoitLib: https://github.com/cappelnord/BenoitLib
//=============================================================
m = MandelHub.start("hernani"); // if I start as the leader
m.gui; // a gui of MandelHub

/*MandelHub.join("hernani", action:{m=MandelHub.instance});// if I join the leader
m.gui; // a gui of MandelHub*/

m.takeLead; // to take the leader

m.timer.reset; // to reset time

m.changeTempo(122/60, 1); // to change the time (bpm, time)

m.clear; // to finish the Mandel connection

//==============================================
//Step 5: when sound check is required
//==============================================
Ndef(\soundcheck).play;

Ndef(\soundcheck)[0]={|vol=0.55,paner=0|Pan2.ar(PinkNoise.ar(vol),paner)}; // the synth
Ndef(\soundcheck)[1]=\set -> Pbind(\dur,1,\vol,Pseq([0,0.55,0,0.55],inf),\paner,Pseq([-1,-1,1,1],inf)); // the sequencer

Ndef(\soundcheck).stop; // stop that noise!!

//=============================================
// Step 6: start coding
//=============================================

